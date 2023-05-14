import 'package:double_partners/presentation/components/app_bar.component.dart';
import 'package:flutter/material.dart';
class Layout extends StatelessWidget {

  Widget child;

  Layout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
