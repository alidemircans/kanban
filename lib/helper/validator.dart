import 'package:flutter/material.dart';

class Validator {
  static const int passwordMinLength = 6;
  static const int passwordMaxLength = 20;
  static const int nameMinLength = 3;
  static const int nameMaxLength = 50;

  static String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (value == null || value.trim().isEmpty) {
      return "Lütfen bir email giriniz!";
    } else if (!regex.hasMatch(value)) {
      return "Lütfen geçerli bir email giriniz!";
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Bu alan boş bırakılmamalıdır";
    } else if (value.trim().length < passwordMinLength) {
      return "Bu alan en az $passwordMinLength karakter olmalıdır!";
    } else if (value.trim().length > passwordMaxLength) {
      return "Bu alan en fazla $passwordMaxLength karakter olabilir!";
    } else {
      return null;
    }
  }

  static String? validateNameAndSurname(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Bu alan boş bırakılmamalıdır";
    } else if (value.trim().length < nameMinLength) {
      return "Bu alan en az $nameMinLength karakter olmalıdır!";
    } else if (value.trim().length > nameMaxLength) {
      return "Bu alan en fazla $nameMaxLength karakter olabilir!";
    } else {
      return null;
    }
  }
}
