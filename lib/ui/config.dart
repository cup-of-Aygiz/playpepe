import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSize {
  static const double heroSize = 100;
  static const double heroSizeBig = 120;
}

class AppAnimation {
  static const animationDuration = const Duration(milliseconds: 300);
}

class AppText {
  static const textStyle = const TextStyle(
    fontWeight: FontWeight.w800,
    color: Colors.deepOrange,
    fontFamily: 'Cramaten',
    fontSize: 50,
  );
  static const textStyleToUpdate = const TextStyle(
    fontWeight: FontWeight.w500,
    color: Color(0xffFFDB0606),
    fontFamily: 'Cramaten',
    fontSize: 25,
  );
}
//класс АппПаддинг
