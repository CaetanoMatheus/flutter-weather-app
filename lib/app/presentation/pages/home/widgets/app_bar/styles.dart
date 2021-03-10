import 'package:flutter/material.dart';

mixin HomeAppBarStyles {
  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(20),
      border: InputBorder.none,
      hintText: hint,
      hintStyle: TextStyle(fontSize: 18),
    );
  }
}
