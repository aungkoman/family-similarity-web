import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:zipmyit/core/util/data_status.dart';
import 'package:zipmyit/domain/entities/child.dart';
import 'package:zipmyit/domain/entities/family_old_tree.dart';
import 'package:zipmyit/domain/entities/new/family_tree.dart';
import 'package:zipmyit/domain/entities/new/relation_data.dart';
import 'package:zipmyit/domain/entities/person_relation.dart';
import 'package:zipmyit/domain/entities/relation.dart';
import 'package:zipmyit/domain/usecases/child/select_child.dart';
import 'package:zipmyit/domain/usecases/married/delete_married.dart';
import 'package:zipmyit/domain/usecases/married/detail_married.dart';
import 'package:zipmyit/domain/usecases/married/insert_married.dart';
import 'package:zipmyit/domain/usecases/married/select_married.dart';
import 'package:zipmyit/domain/usecases/married/update_married.dart';
import 'package:zipmyit/domain/usecases/person/delete_person.dart';
import 'package:zipmyit/domain/usecases/delete_person_relation.dart';
import 'package:zipmyit/domain/usecases/get_family_tree_by_person_id.dart';
import 'package:zipmyit/domain/usecases/get_person_by_id.dart';
import 'package:zipmyit/domain/usecases/person/detail_person.dart';
import 'package:zipmyit/domain/usecases/person/select_person.dart';
import 'package:zipmyit/domain/usecases/person/insert_person.dart';
import 'package:zipmyit/domain/usecases/insert_person_relation.dart';
import 'package:zipmyit/domain/usecases/person/update_person.dart';
import 'package:zipmyit/domain/usecases/update_person_relation.dart';
import '../../core/error/failures.dart';
import '../../data/const/const.dart';

import '../../domain/entities/new/married.dart';
import '../../domain/entities/new/person.dart';
import '../../domain/entities/person_old.dart';
import '../../domain/usecases/child/delete_child.dart';
import '../../domain/usecases/child/detail_child.dart';
import '../../domain/usecases/child/insert_child.dart';
import '../../domain/usecases/child/update_child.dart';
import '../../test/dijkstra.dart';

class ZipMyitProvider extends ChangeNotifier {

  /*
  List<Person> personList = [...personDataList];
  List<Married> marriedList = [...marriedDataList];

  Person person = Person.sample();

   */
  FamilyTree familyTree = FamilyTree.sample();

  Future<String> updateFamilyTree({required Person person, required List<Person> personList, required List<Married> marriedList}) async{
    print("ZipMyitProvider->updateFamilyTree");
    familyTree = _getFamilyTreeByPersonId(person: person, personList: personList  , marriedList: marriedList);
    notifyListeners();
    return "success";
  }


  // အပြင်က Data ကို မှီခိုနေရတာ -> Side Effect ပဲ
  // တက်နိုင်သမှျ Pure ရအောင်လုပ်
  // ဒါမှ စိတ်ရှင်းလက်ရှင်းနဲ့ trace လိုက်လို့ရမှာ။
  // ဒါက Pure Function ဖြစ်သွားပြီ။
  FamilyTree _getFamilyTreeByPersonId({required Person person, required List<Person> personList, required List<Married> marriedList}){

    int personId = person.id;
    print("getFamilyTreeByPersonId $personId");

    // Person person = personList.where((e) => e.id == personId).toList().first;
    // လူရဲ့ Married ကို စိတ်ဝင်စားမနေနဲ့
    // data ကသာ လိုက်ရှာ

    // မိဘ ရှိလားစစ်
    // Married ကတော ့Person Detail ပါမှ ဖြစ်မယ်။
    List<Married> parentMarriedList = marriedList.where((element) => element.id == person.marriedId).toList();

    Person? dad; // = person.married?.fromPerson;
    Person? mom; // = person.married?.toPerson;
    if(parentMarriedList.isNotEmpty){
      dad = parentMarriedList.first.toPerson;
      mom = parentMarriedList.first.fromPerson;
    }
    List<Person> parents = [];
    if(dad != null) parents.add(dad);
    if(mom != null) parents.add(mom);

    List<Person> siblings = personList.where((element) => person.marriedId > 0  && person.id != element.id &&  element.marriedId == person.marriedId).toList();

    print("finding for ${person.id}");
    marriedList.forEach((element) {
      print(element.fromPerson.name + " & " + element.toPerson.name);
    });
    List<Married> ownMarriedList = marriedList.where((element) => element.fromPersonId == person.id || element.toPersonId == person.id ).toList();
    print("ownMarriedList ");
    print(ownMarriedList);
    List<Person> spouses = ownMarriedList.map((e) => e.fromPersonId == person.id ? e.toPerson : e.fromPerson).toList();
    print("spouses ");
    print(spouses);


    List<Person> children = [];

    for(int i=0; i < ownMarriedList.length; i++){
      print("married id is " +  ownMarriedList[i].id.toString());
      List<Person> childList = personList.where((e) => e.marriedId == ownMarriedList[i].id).toList();
      print(childList);
      children.addAll(childList);
    }

    FamilyTree familyTree = FamilyTree(
        id: person.id,
        person: person,
        parents: parents,
        siblings: siblings,
        spouses: spouses,
        children: children
    );

    return familyTree;
  }

  void createNewCouple({required Person child, required Person dad, required Person mom}){

  }


  String _findRelation({required Person personOne, required Person personTwo, required List<Person> personList, required List<Married> marriedList}) {
    String relate = "";
    if(personOne.id == personTwo.id){
      relate = "self";
      return relate;
    }
    if( personOne.marriedId != 0 &&  personOne.marriedId == personTwo.marriedId){
      // relate = "sibling";
      relate = "ညီအစ်ကို မောင်နှမ";
      return relate;
    }
    // parent
    // ကိုယ် ရဲ့ မိဘတွေ ရှိလားကြည့်မယ်။
    try{
      // parent
       List<Married> mList = marriedList.where((element) => element.id == personOne.marriedId).toList();
       print("mList for personOne is ");
       print(mList);

       if(mList.isNotEmpty){
         Married married = mList.first;
         // find dad or mom
         if(married.toPersonId == personTwo.id || married.fromPersonId == personTwo.id){
           // relate = "parent";
           relate = "မိဘ";
           return relate;
         }


       }

       // child
       List<Married> mList2 = marriedList.where((element) => element.id == personTwo.marriedId).toList();
       if(mList2.isNotEmpty){
         Married married = mList2.first;
         // find dad or mom
         if(married.toPersonId == personOne.id || married.fromPersonId == personOne.id){
           // relate = "child";
           relate = "ကလေး";
           return relate;
         }
       }

       // ကိုယ်ပါတဲ့ မင်ဂလာ အတွဲတွေ ထုတ်ရမှာ
       List<Married> myMarriedList = marriedList.where((element) => element.fromPersonId == personOne.id || element.toPersonId == personOne.id ).toList();
       for(int i=0; i < myMarriedList.length; i++){
         print("${myMarriedList[i].fromPersonId} & ${myMarriedList[i].toPersonId} ");

         if(myMarriedList[i].fromPersonId == personOne.id && myMarriedList[i].toPersonId == personTwo.id){
           // relate = "spouse";
           relate = "အိမ်ထောင်ဘက်";
           return relate;
         }
         if(myMarriedList[i].toPersonId == personOne.id && myMarriedList[i].fromPersonId == personTwo.id){
           // relate = "spouse";
           relate = "အိမ်ထောင်ဘက်";
           return relate;
         }
       }

    }
    catch(exp){
      print("exp");
    }
    return relate;
  }


    List<RelationData> findRelationBetweenTwoPerson({required Person personOne, required Person personTwo, required List<Person> personList, required List<Married> marriedList}) {
    print("ZipMyitProvider->updateFamilyTree");
    // familyTree = _getFamilyTreeByPersonId(person: person, personList: personList  , marriedList: marriedList);
    // get family tree for each person
    // and build graph
    // find the shortest path

    Map<String, Map<String, int>> graph2 = {
      'A': {'B': 3, 'D': 3, 'F': 6},
      'B': {'A': 3, 'D': 1, 'E': 3},
      'C': {'E': 2, 'F': 3},
      'D': {'A': 3, 'B': 1, 'E': 1, 'F': 2},
      'E': {'B': 3, 'C': 2, 'D': 1, 'F': 5},
      'F': {'A': 6, 'C': 3, 'D': 2, 'E': 5},
    };

    Map<String, Map<String, int>> graph = {};

    for(int i=0; i < personList.length; i++){
      FamilyTree familyTree = _getFamilyTreeByPersonId(person: personList[i], personList: personList, marriedList: marriedList);
      // ဒီလူနဲ့ အဆက်အသွယ်တွေ စထည့်မယ်။
      String thisPersonId = familyTree.person.id.toString();
      graph[thisPersonId] = {};
      for (Person person in familyTree.parents) {
        graph[thisPersonId]?[person.id.toString()] = 1;
      }
      for (Person person in familyTree.siblings) {
        graph[thisPersonId]?[person.id.toString()] = 1;
      }
      for (Person person in familyTree.spouses) {
        graph[thisPersonId]?[person.id.toString()] = 1;
      }
      for (Person person in familyTree.children) {
        graph[thisPersonId]?[person.id.toString()] = 1;
      }
      print(graph);
      print("---------");
      // ဒါဆို လူတစ်ယောက်ရဲ့ Connection တွေ အကုန်ထည့်ပြီးပြီ။
    } // လူအားလုံးရဲ့ Connection တွေ ထည့်ပြီးပြီ
    print("---- Final Graph ----");
    print(graph);

    Dijkstra g = Dijkstra(graph);

    Map<String,dynamic> result = (g.shortestPath(personOne.id.toString(),  personTwo.id.toString())); // {'status': 'route', 'distance': 3, 'solution_path': ['D', 'E', 'C']}

    // ပြန်ပေးရမယ့် ပုံစံက
    // Person -> Relation ဒါမျိုး array ပြပေးရင်ရပြီ။

    print(result);




    List<String> relatePersonIdList = result['solution_path'] ?? [];
    print(relatePersonIdList);
    relatePersonIdList =  relatePersonIdList.reversed.toList();
    print(relatePersonIdList);


    List<RelationData> relationDataList = [];
    for(int i=0; i < relatePersonIdList.length - 1 ; i++){
      // လူ နှစ်ယောက် အချက်အလက်ထည့်
      Person person1 = personList.where((element) => element.id ==  (int.tryParse(relatePersonIdList[i]) ?? 0)).toList().first;
      Person person2 = personList.where((element) => element.id ==  (int.tryParse(relatePersonIdList[i+1]) ?? 0)).toList().first;
      // သူတို့ နှစ်ယောက်နရဲ့ relation
      String relate = _findRelation(personOne: person1, personTwo: person2, personList: personList, marriedList: marriedList);
      print("${person1.name} - ${person2.name} => $relate");
      RelationData relationData = RelationData(fromPerson: person1, toPerson: person2, relate: relate);
      relationDataList.add(relationData);
    }

    return relationDataList;
  }

  /*
  List<FamilyTree> familyTreeList = [];

  void setPerson(Person updatedPerson){
    person = updatedPerson;
    familyTree = getFamilyTreeByPersonId(personId: person.id);
    familyTreeList.add(familyTree);
    notifyListeners();
  }


  Future<String> updateFamilyTree(Person updatedPerson) async{
    person = updatedPerson;
    familyTree = getFamilyTreeByPersonId(personId: person.id);
    notifyListeners();
    return "success";
  }


  Future<String> addPerson(Person newPerson) async{
    personList.add(newPerson);
    notifyListeners();
    return "success";
  }
  void addMarried(Married newMarried){
    print("ZipMyitProvider->addMarried");
    print("${newMarried.toPerson.name} & ${newMarried.fromPerson.name}");

    marriedList.add(newMarried);
    notifyListeners();
  }

  Future<Person> getPersonById(int personId) async{
    return personList.where((element) => element.id == personId).toList().first;
  }
  Future<Married> getMarriedById(int marriedId) async{
    return marriedList.where((element) => element.id == marriedId).toList().first;
  }

  Future<String> updatedPerson(Person updatedPerson)async{
    print("updatePerson ${updatedPerson.name}");
    for(int i=0; i < personList.length; i++){
      if(personList[i].id == updatedPerson.id){
        print("we update ${updatedPerson.name}");
        personList[i] = updatedPerson;
      }
    }
    familyTree = getFamilyTreeByPersonId(personId: person.id);
    print(familyTree.parents);
    notifyListeners();
    return "success";
  }


  Future<String> removePersonById(int personId)async{
    print("removePersonById $personId");
    personList.removeWhere((element) => element.id == personId);
    notifyListeners();
    return "success";
  }

  FamilyTree getFamilyTreeByPersonId({required int personId}){

    print("getFamilyTreeByPersonId $personId");

    Person person = personList.where((e) => e.id == personId).toList().first;
    Person? dad = person.married?.fromPerson;
    Person? mom = person.married?.toPerson;
    List<Person> parents = [];
    if(dad != null) parents.add(dad);
    if(mom != null) parents.add(mom);

    List<Person> siblings = personList.where((element) => person.marriedId > 0  && person.id != element.id &&  element.marriedId == person.marriedId).toList();

    print("finding for ${person.id}");
    marriedList.forEach((element) {
      print(element.fromPerson.name + " & " + element.toPerson.name);
    });
    List<Married> ownMarriedList = marriedList.where((element) => element.fromPersonId == person.id || element.toPersonId == person.id ).toList();
    print("ownMarriedList ");
    print(ownMarriedList);
    List<Person> spouses = ownMarriedList.map((e) => e.fromPersonId == person.id ? e.toPerson : e.fromPerson).toList();
    print("spouses ");
    print(spouses);


    List<Person> children = [];

    for(int i=0; i < ownMarriedList.length; i++){
      print("married id is " +  ownMarriedList[i].id.toString());
      List<Person> childList = personList.where((e) => e.marriedId == ownMarriedList[i].id).toList();
      print(childList);
      children.addAll(childList);
    }

    FamilyTree familyTree = FamilyTree(
        id: person.id,
        person: person,
        parents: parents,
        siblings: siblings,
        spouses: spouses,
        children: children
    );

    return familyTree;
  }
  Future<String> removeMarriedById(int marriedId)async{
    print("removeMarriedById $marriedId");
    marriedList.removeWhere((element) => element.id == marriedId);
    notifyListeners();
    return "success";
  }

   */


}