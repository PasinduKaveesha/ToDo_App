import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app_for_flutter/home_page.dart';
import 'package:test_app_for_flutter/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('myBox');

  var box = await Hive.openBox('myBox');
  bool IntroShown = box.get('IntroShown', defaultValue: false);

  runApp(MyApp(IntroShown: IntroShown));
}

class MyApp extends StatelessWidget {
  final bool IntroShown;
  const MyApp({super.key, required this.IntroShown});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      home: IntroShown ? HomePage() : IntroScreen(),
      
      
    );
  }
}
