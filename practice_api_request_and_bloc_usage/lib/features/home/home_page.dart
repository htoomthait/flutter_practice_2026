import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts", style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,

      ),
    );
  }
}


