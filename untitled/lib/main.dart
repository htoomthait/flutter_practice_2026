import 'package:demo_beginner_app/widgets/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:demo_beginner_app/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Beginner Demo App',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MyScaffold(),
    );
  }
}
