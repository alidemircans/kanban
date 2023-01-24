import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  SharedPreferences? prefs;

  SharedPreferencesServices() {
    instance();
  }

  instance() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setToShared(key, value) async {
    if (prefs != null) {
      return await prefs!.setString(key, value);
    } else {
      return false;
    }
  }

  clearShared() {
    if (prefs != null) prefs!.clear();
  }

  String? getDataFromShared(key) {
    return prefs != null ? prefs!.getString(key) : null;
  }

  logOut(context) async {
    prefs!.remove("userId");
    prefs!.remove("userToken");
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }
}
