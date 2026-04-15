import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:practice_api_request_and_bloc_usage/features/posts/models/post_data_ui_model.dart';

import '../repo/posts_repo.dart';

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



    try {
      List<PostDataUiModel> posts = await PostsRepo.fetchPost();


      emit(PostFetchSuccessfulState(posts: posts));


    } catch(e) {

      emit(PostFetchErrorState());
    }
  }

  FutureOr<void> postAddEvent(PostAddEvent event, Emitter<PostsState> emit) async {
    emit(PostAdditionLoadingState());

    try{

      bool success = await PostsRepo.addPost(PostDataUiModel(userId: 1, id: 101, title: "Test Title", body: "Test Body"));

      if(success){
        print("Post added successfully");
        emit(PostAdditionSuccessState());
      }
      else{
        print("Failed to add post");
        emit(PostAdditionErrorState());
      }

    }catch(e){
      print("Failed to add post");
      emit(PostFetchErrorState());
    }

  }
}
