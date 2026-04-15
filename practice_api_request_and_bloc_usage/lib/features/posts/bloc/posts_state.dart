part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}


abstract class PostsActionState extends PostsState {

}


class PostFetchSuccessfulState extends PostsState {
  final List<PostDataUiModel> posts;

  PostFetchSuccessfulState({
    required this.posts
  });
}

class PostFetchErrorState extends PostsState {}

class PostsFetchingLoadingState extends PostsState {}

class PostAdditionSuccessState extends PostsActionState {}

class PostAdditionErrorState extends PostsActionState {}

class PostAdditionLoadingState extends PostsActionState {}


