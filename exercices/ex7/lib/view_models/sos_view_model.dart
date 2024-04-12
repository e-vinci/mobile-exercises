import 'dart:collection';

import 'package:flutter/foundation.dart';

class SosViewModel extends ChangeNotifier {
  var _message = "I'm having an emergency at @loc, send help!";
  final _recipients = <String>[];

  String get message => _message;

  UnmodifiableListView<String> get recipients =>
      UnmodifiableListView(_recipients);

  set message(String value) {
    _message = value;
    notifyListeners();
  }

  void addRecipient(String recipient) {
    _recipients.add(recipient);
    notifyListeners();
  }

  void removeRecipient(String recipient) {
    _recipients.remove(recipient);
    notifyListeners();
  }
}
