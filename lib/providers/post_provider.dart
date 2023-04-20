import 'package:codigo6_states/services/remote/api_service.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  //realizamos la llamada a neustra APi service
  ApiService apiService = ApiService();
//NOS CREMOAS UNA LIST VACIAs
  List posts = [];
  //usamos este provider para llamar
  Future<List> getPost() async {
    //el getPost() viene del api Service
    return await apiService.getPost();
  }

  //usaremos este provider para ecuchar en diferentes lugares
  //y carga la lista del post
  getPost2() async {
    //trae la informacion la guarda en el post
    posts = await apiService.getPost();
    //notifica
    notifyListeners();
  }
}
