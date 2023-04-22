import 'package:flutter/material.dart';
import 'package:hive_demo/hive/boxes.dart';
import 'hive/db_fields.dart';
import 'home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StudentAdapter());
  boxStudent = await Hive.openBox<Student>('studentBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      
    );
  }
}
