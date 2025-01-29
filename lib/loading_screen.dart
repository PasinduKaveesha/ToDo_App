import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home_page.dart'; // Import your home page

class IntroScreen extends StatelessWidget {
  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Welcome",
      body: "Welcome to the ToDo app!",
      image: Center(
          child: Icon(Icons.add_task_rounded,
              size: 200, color: Colors.amber[900])),
      decoration: PageDecoration(
        pageColor: Colors.yellow[200],
        bodyTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        imageFlex: 3,
      ),
    ),
    PageViewModel(
      title: "Search Tasks",
      body: "Search your tasks easily using the search bar.",
      image: Center(
          child: Icon(Icons.search, size: 200, color: Colors.amber[900])),
      decoration: PageDecoration(
        pageColor: Colors.yellow[200],
        bodyTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        imageFlex: 3,
      ),
    ),
    PageViewModel(
      title: "Delete Tasks",
      body: "Delete your tasks by sliding the tasks",
      image: Center(
          child: Icon(Icons.delete, size: 200, color: Colors.amber[900])),
      decoration: PageDecoration(
        pageColor: Colors.yellow[200],
        bodyTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        imageFlex: 3,
      ),
    ),
    PageViewModel(
      title: "Update Tasks",
      body: "Hold Down the task to update it.",
      image: Center(
          child: Icon(Icons.update, size: 200, color: Colors.amber[900])),
      decoration: PageDecoration(
        pageColor: Colors.yellow[200],
        bodyTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        imageFlex: 3,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[200],
      child: IntroductionScreen(
        globalBackgroundColor: Colors.yellow[200],
        pages: pages,
        onDone: () async {
          var box = await Hive.openBox('myBox');
          await box.put('IntroShown', true);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        showNextButton: true,
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(color: Colors.black),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        done: const Text("Done",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
