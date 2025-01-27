import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app_for_flutter/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Hive.initFlutter(); 
  await Hive.openBox('myBox'); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      home: HomePage(),
    );
  }
}
