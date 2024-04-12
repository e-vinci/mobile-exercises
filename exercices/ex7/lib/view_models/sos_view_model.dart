import 'package:flutter/foundation.dart';

class SosViewModel extends ChangeNotifier {
  var _message = "I'm having an emergency at @loc, send help!";

  String get message => _message;

  set message(String value) {
    _message = value;
    notifyListeners();
  }
}
