

import 'package:zipmyit/domain/entities/new/person.dart';

class FamilyTree{
  int id;
  Person person;
  List<Person> parents;
  List<Person> siblings;
  List<Person> spouses;
  List<Person> children;

  FamilyTree({
    required this.id,
    required this.person,
    required this.parents,
    required this.siblings,
    required this.spouses,
    required this.children
  });

  static FamilyTree  sample() => FamilyTree(
    id : 0,
    person : Person.sample(),
    parents: [], // [Person.sample(), Person.sample()],
    siblings : [], //[Person.sample()],
    spouses : [], //[Person.sample()],
    children : [], // [Person.sample(),Person.sample()],
  );

  FamilyTree clone(){
    return FamilyTree(id: id, person: person, parents: parents, siblings: siblings, spouses: spouses, children: children);
  }

}