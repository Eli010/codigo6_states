abstract class PostState {}

class PostInitState extends PostState {}

class PostLoadingState extends PostState {}

class PostSuccedState extends PostState {
  final List data;
  PostSuccedState({required this.data});
}

class PostErrorState extends PostState {}
