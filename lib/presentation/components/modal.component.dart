import 'package:flutter/material.dart';
class ModalComponent {
  static Future<void> dialogBuilder(BuildContext context, Widget child) {
    final size = MediaQuery.of(context).size;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(8.0),
          content: SizedBox(
            width: 400,
            height: size.height / 3.5,
            child: child,
          ),
        );
      },
    );
  }
}
