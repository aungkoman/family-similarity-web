import 'package:zipmyit/domain/entities/new/person.dart';

class RelationData{
  Person fromPerson;
  Person toPerson;
  String relate;

  RelationData({ required this.fromPerson,  required this.toPerson, required this.relate });

}