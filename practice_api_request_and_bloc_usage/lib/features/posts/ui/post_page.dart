import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/posts_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostsBloc _postsBloc = PostsBloc();


  @override
  void initState() {
    _postsBloc.add(PostsInitialFetchEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts", style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,

      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: _postsBloc,
        listenWhen: (previous, current) => current is PostsActionState,
        buildWhen: (previous, current) => current is !PostsActionState,
        listener: (context, state) {
          if (state is PostAdditionSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Post added successfully")),
            );
          }
          else if (state is PostAdditionErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Failed to add post")),
            );
          }
        },
        builder: (context, state){
          log("Post UI current state: ${state.runtimeType}");
          switch (state.runtimeType) {
            case const (PostFetchSuccessfulState):
              final successState = state as PostFetchSuccessfulState;
              return ListView.builder(
                  itemCount: successState.posts.length,
                  itemBuilder: (context, index){
                    return Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(16),
                      color: Colors.grey.shade200,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Title: ${successState.posts[index].title}"),
                            Text("Body: ${successState.posts[index].body}")
                          ]
                      ),
                    );
                  }
              );
            case const (PostFetchErrorState):
              return Text("Failed to fetch posts");
            case const (PostsFetchingLoadingState):
              return Center(child: CircularProgressIndicator());

            case const (PostAdditionLoadingState):
              return Center(child: CircularProgressIndicator());
            default:
              return SizedBox(height: 10.0,);
          }



        }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _postsBloc.add(PostAddEvent());
          },
          child: Icon(Icons.add),
      ),
    );
  }
}
