import 'package:flutter/material.dart';

class L10N {
  static final all = [
    const Locale('en'),
    const Locale('fa'),
    const Locale('ar'),
  ];
  static String getFlag(String code) {
    switch (code) {
      case 'ar':
        return 'العربی';
      case 'fa':
        return 'فارسی';
      case 'en':
      default:
        return 'English';
    }
  }
}
