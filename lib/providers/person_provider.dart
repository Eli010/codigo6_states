import 'package:flutter/material.dart';

class PersonProvider extends ChangeNotifier {
  List people = [];
  addPersons(String person) {
    people.add(person);
    notifyListeners();
  }
}
