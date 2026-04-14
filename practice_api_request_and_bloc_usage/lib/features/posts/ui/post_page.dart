import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
