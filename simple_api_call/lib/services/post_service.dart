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

}