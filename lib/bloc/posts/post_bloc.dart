import 'package:codigo6_states/bloc/posts/post_event.dart';
import 'package:codigo6_states/bloc/posts/post_state.dart';
import 'package:codigo6_states/services/remote/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  ApiService apiService = ApiService();
  //inicializamos con nuestro estado inicial
  //super: es hacer caso al padre de bloc "PostBloc"
  PostBloc() : super(PostErrorState()) {
    //on = verifica el evento
    on<RegisterPostEvent>((event, emit) {
      print("Evento 1");
    });
    on<DeletePostEvent>((event, emit) {
      print("Evento 2");
      print(event);
      print(emit);
      emit(PostLoadingState());
    });
    on<GetPostEvent>((event, emit) async {
      emit(PostLoadingState());
      List posts = await apiService.getPosts();
      // print("Evento 3");
      emit(PostSuccedState(data: posts));
    });
  }
}
