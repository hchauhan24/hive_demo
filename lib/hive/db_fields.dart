import 'package:hive/hive.dart';

part 'db_fields.g.dart';

@HiveType(typeId: 1)
class Student {
  Student({required this.name, required this.age});
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;
}

// ' flutter packages pub run build_runner build '  : The command to generate adapter.
//First write : part '${file_name}.g.dart' 