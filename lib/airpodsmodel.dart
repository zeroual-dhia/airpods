import 'package:airpods/constants.dart';
import 'package:flutter/widgets.dart';

class Airpodsmodel with ChangeNotifier {
  final List<Map<String, dynamic>> airpods = Airpods.airpodsList;
  int currentIndex = 0;
  bool setIndex(index) {
    currentIndex = index;
    notifyListeners();
    return true;
  }
}
