import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration generalInputDecoration(
      {required String hinText,
        required String labelText,
        required Color colorInput,
        Color colorError = Colors.red,
        IconData? prefixIcon}) {

    return InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: colorInput, width: 1.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorInput, width: 1.5)),
        hintText: hinText,
        labelText: labelText,
        fillColor: colorInput,
        focusColor: colorInput,
        hoverColor: colorInput,
        counter: const Offstage(),
        labelStyle: TextStyle(color: colorInput),
        hintStyle: TextStyle(fontSize: 18.0, color: colorInput),
        errorStyle: TextStyle(color: colorError, height: 1.4),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorError, width: 1.3 )),
        focusedErrorBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: colorError, width: 1.5)),
        prefixIcon:
        prefixIcon != null ? Icon(prefixIcon, color: colorInput) : null);
  }
}
