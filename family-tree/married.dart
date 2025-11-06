import 'package:zipmyit/domain/entities/new/person.dart';
import 'package:zipmyit/domain/entities/person_old.dart';
import 'package:zipmyit/domain/entities/relation.dart';

class Married{
  int id;
  int fromPersonId;
  int toPersonId;
  Person fromPerson;
  Person toPerson;
  String createdAt;
  String updatedAt;

  Married({ required this.id, required this.fromPersonId, required this.toPersonId,   required this.fromPerson, required this.toPerson, required this.createdAt, required this.updatedAt});

  static Married get sample => Married(
      id: 0,
      fromPersonId: Person.sample().id,
      toPersonId: Person.sample().id,
      fromPerson: Person.sample(),
      toPerson: Person.sample(),
      createdAt : "createdAt",
      updatedAt : "updatedAt",
  );
}