import 'package:flutter/material.dart';
import 'package:simple_api_call/models/post.dart';
import 'package:simple_api_call/services/post_service.dart';


class PostDetailScreen extends StatelessWidget{
  final Post post;

  PostDetailScreen({super.key,  required this.post});

  final _postService =  PostService();


  void _handleDeletePost(BuildContext context)  async {
    showDialog(
        context: context,
        builder: (dialogContext){
          return AlertDialog(
            title: const Text('Delete Post'),
            content: const Text('Are you sure you want to delete this post?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // 1. Explicitly close the dialog box overlay
                  Navigator.pop(dialogContext);

                  // Call DELETE API here
                  final isDeleted = await _postService.deletePost(post.id!);
                  if(isDeleted){
                    print('Post deleted with ID of: ${post.id}');

                  // 3. Optional: Pop the detail screen to go back to the list
                  if (context.mounted) {
                  Navigator.pop(context);
                  }

                  }


                },
                child: const Text('Delete'),
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => _handleDeletePost(context), icon: Icon(Icons.delete))
        ],
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
