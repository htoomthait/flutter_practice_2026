import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }




  FutureOr<void> postsInitialFetchEvent(PostsInitialFetchEvent event, Emitter<PostsState> emit) {

    

  }
}