import 'package:codigo6_states/bloc/posts/post_event.dart';
import 'package:codigo6_states/bloc/posts/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  //inicializamos con nuestro estado inicial
  //super: es hacer caso al padre de bloc "PostBloc"
  PostBloc() : super(PostErrorState()) {
    //on = verifica el evento
    on<Event1>((event, emit) {
      print("Evento 1");
    });
    on<Event2>((event, emit) {
      print("Evento 2");
      print(event);
      print(emit);
      emit(PostLoadingState());
    });
    on<Event3>((event, emit) {
      print("Evento 3");
      emit(PostErrorState());
    });
    on<Event4>((event, emit) {
      print("Evento 3");
      emit(PostSuccedState());
    });
    on<Event5>((event, emit) {
      print("Evento 3");
    });
  }
}
