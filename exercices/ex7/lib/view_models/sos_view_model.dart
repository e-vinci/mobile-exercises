import 'dart:collection';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SosViewModel extends ChangeNotifier {
  late SharedPreferences _prefs;

  var _message = "";
  final _recipients = <String>[];

  SosViewModel() {
    SharedPreferences.getInstance().then((value) {
      _prefs = value;
      _message = _prefs.getString("message") ??
          "I'm having an emergency at @loc, send help!";
      _recipients.addAll(_prefs.getStringList("recipients") ?? []);
      notifyListeners();
    });
  }

  final canSendSms = kIsWeb || Platform.isIOS || Platform.isAndroid;

  String get message => _message;

  UnmodifiableListView<String> get recipients =>
      UnmodifiableListView(_recipients);

  set message(String value) {
    _message = value;
    _prefs.setString("message", value);
    notifyListeners();
  }

  void addRecipient(String recipient) {
    _recipients.add(recipient);
    _prefs.setStringList("recipients", _recipients);
    notifyListeners();
  }

  void removeRecipient(String recipient) {
    _recipients.remove(recipient);
    _prefs.setStringList("recipients", _recipients);
    notifyListeners();
  }
}
