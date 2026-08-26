import 'package:flutter/material.dart';
import 'package:simple_api_call/widgets/post_card.dart';

import 'models/post.dart';
import 'services/post_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple AI Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:  ColorScheme.fromSeed(seedColor: Colors.blue)
      ),
      home: const PostListScreen()
    );
  }
}

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final PostService postService = PostService();
  late Future<List<Post>> postsFuture;

  @override
  void initState() {
    super.initState();
    postsFuture = postService.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Post>>(
        future: postsFuture,
        builder: (context, snapshot){
          // Loading
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error
          if(snapshot.hasError){
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // No data
          if(!snapshot.hasData || snapshot.data!.isEmpty){
            return  const Center(
              child: Text('No posts found')
            );
          }

          final posts = snapshot.data!;
          posts.sort((a, b) => b.id.compareTo(a.id)); // sorting by id desc

          return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index){
                final post = posts[index];


                return PostCard(post: post);

              }
          );


        },
      )
    );
  }

}