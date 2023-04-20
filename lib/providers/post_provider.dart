import 'package:codigo6_states/services/remote/api_service.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  //realizamos la llamada a neustra APi service
  ApiService apiService = ApiService();

  Future<List> getPost() async {
    //el getPost() viene del api Service
    return await apiService.getPost();
  }

  getPost2() {}
}
