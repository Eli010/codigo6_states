import 'package:codigo6_states/cubit/post/post_state.dart';
import 'package:codigo6_states/services/remote/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  //nos creamos nuestro constructor
  // PostCubit(super.initialState);//esto es al inicio
  PostCubit() : super(PostInitState());
  //traemos nuestro servicio
  ApiService apiService = ApiService();
  //me creo una funciona para emitir mi servicios
  Future<void> getPostsData() async {
    emit(PostLoadingState());
    List posts = await apiService.getPosts();
    emit(PostSuccedState(posts: posts));
  }
}
