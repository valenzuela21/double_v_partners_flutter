import 'package:flutter/material.dart';
class ModalComponent {
  static Future<void> dialogBuilder(BuildContext context, Widget child) {
    final size = MediaQuery.of(context).size;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(10.0),
          contentPadding: const EdgeInsets.all(8.0),
          content: SizedBox(
            width: 400,
            height: size.height / 4.0,
            child: child,
          ),
        );
      },
    );
  }
}
