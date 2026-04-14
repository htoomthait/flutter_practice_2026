import "package:flutter/material.dart";
import "package:practice_api_request_and_bloc_usage/features/posts/ui/post_page.dart";

void main() async{
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PostPage()
    );
  }
}