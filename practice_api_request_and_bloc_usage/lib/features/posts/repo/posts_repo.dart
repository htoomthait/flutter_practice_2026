import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:practice_api_request_and_bloc_usage/features/posts/models/post_data_ui_model.dart';

class PostsRepo {
  static Future<List<PostDataUiModel>> fetchPost() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];

    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post = PostDataUiModel.fromMap(result[i]);
        posts.add(post);
      }

      return posts;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<bool> addPost(PostDataUiModel post) async {
    var client = http.Client();

    var dummyPost = {
      'userId': '1',
      'id': '101',
      'title': 'Test Title',
      'body': 'Test Body'
    };

    var realPostBody = {
      'userId': post.userId.toString(),
      'id': post.id.toString(),
      'title': post.title,
      'body': post.body
    };

    try{
      var response = await client.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(dummyPost)
      );

      if(response.statusCode >= 200 && response.statusCode < 300){
        return true;
      }
      else{
        return false;
      }


    }catch(e){
      log(e.toString());

      return false;
    }

  }


}
