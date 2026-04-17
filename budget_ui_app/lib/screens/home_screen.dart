import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            pinned: true,
            floating: false,
            expandedHeight: 100.0,
            backgroundColor: Theme.of(context).primaryColor,
            centerTitle: true,
            leading: IconButton(icon: Icon(Icons.settings), iconSize: 30.0, onPressed: (){},),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Budget UI App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add), iconSize: 30.0, onPressed: (){},)
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index){
                return Container(
                  margin: EdgeInsets.all(10.0),
                  height: 100.0,
                  color: Colors.red
                );
              }
              ,
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
