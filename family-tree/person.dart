
import 'married.dart';

class Person{
  int id;
  String name;
  String description;
  int marriedId;
  Married? married;
  String createdAt;
  String updatedAt;

  Person({ required this.id, required this.name, required this.description, required this.marriedId, required this.married, required this.createdAt, required this.updatedAt});

  static Person sample(){
    return Person(id: 0, name: "", description: "description", marriedId: 0, married: null, createdAt: "createdAt", updatedAt: "updatedAt");
  }

  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'name' : name,
      'married_id' : marriedId,
      'married' : married,
      'created_at' : createdAt,
      'updated_at' : updatedAt,
    };
  }
}