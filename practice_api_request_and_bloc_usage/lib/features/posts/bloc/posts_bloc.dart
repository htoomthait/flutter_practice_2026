import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:practice_api_request_and_bloc_usage/features/posts/models/post_data_ui_model.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
    PostsInitialFetchEvent event,
    Emitter<PostsState> emit,
  ) async {
    emit(PostsFetchingLoadingState());
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


      for(int i = 0; i < result.length; i++){
        PostDataUiModel post = PostDataUiModel.fromMap(result[i]);
        posts.add(post);
      }



      emit(PostFetchSuccessfulState(posts: posts));
      client.close();

    } catch(e) {
      log(e.toString());
      client.close();
      emit(PostFetchErrorState());
    }
  }

  FutureOr<void> postAddEvent(PostAddEvent event, Emitter<PostsState> emit) {}
}
