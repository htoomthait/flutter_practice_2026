import 'package:flutter/material.dart';

import '../models/post.dart';


class PostCard extends StatelessWidget{
  final Post post;
  const PostCard({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const  EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
            child: Text('${post.id}')
        ),
        title: Text(
            post.title,
            style: const TextStyle(fontWeight: FontWeight.bold)
        ),
        subtitle: Text(post.body),
      ),
    );
  }
}