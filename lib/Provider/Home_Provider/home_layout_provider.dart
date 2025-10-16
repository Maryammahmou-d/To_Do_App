import 'package:flutter/cupertino.dart';

class HomeLayoutProvider extends ChangeNotifier {
  int currentIndex = 0;

  void changeCurrentIndex(index) {
    if (currentIndex != index) {
      currentIndex = index;
    }
    notifyListeners();
  }
}
