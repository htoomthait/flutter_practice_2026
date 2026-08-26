import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post.dart';

class PostService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> getPosts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/posts')
    );


    if(response.statusCode == 200){
      final List<dynamic> data =  jsonDecode(response.body);

      return data
          .map((json) => Post.fromJson(json))
          .toList();
    }
    else{
      throw Exception('Fail to load posts');
    }

  }

  Future<Post> createPost(Post post) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(post.toJson())
    );


    if(response.statusCode == 201){
      return Post.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Failed to create post');
    }



  }

}