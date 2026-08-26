import 'package:flutter/material.dart';
import 'package:simple_api_call/models/post.dart';


class PostDetailScreen extends StatelessWidget{
  final Post post;

  const PostDetailScreen({super.key,  required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: Theme.of(context).textTheme.headlineSmall
            ),

            SizedBox(
              height: 20,
            ),

            Text(
              post.body,
              style: Theme.of(context).textTheme.bodyLarge
            ),
            const SizedBox(height: 20,),

            Text("Post Id: ${post.id}"),
            Text("User Id: ${post.userId}")
          ],
        ),
      )
    );
  }
}
