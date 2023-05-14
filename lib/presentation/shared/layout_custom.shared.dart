import 'package:flutter/material.dart';

import '../components/app_bar.component.dart';

class LayoutCustomShared extends StatelessWidget {
  Widget child;
  LayoutCustomShared({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child:
          Column(
            children: [
              MaterialButton(
                  disabledColor: Theme.of(context).colorScheme.primary,
                  focusColor:Theme.of(context).colorScheme.primary,
                  splashColor: Theme.of(context).colorScheme.primary,
                  highlightColor: Theme.of(context).colorScheme.primary,
                  elevation: 0,
                  color: Theme.of(context).colorScheme.tertiary,
                  onPressed: (){
                    Navigator.pushNamed(context, "/create");
                  },
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                    child: Text("Agregar Usuario".toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700)),
                  )),
              Expanded(child: child)
            ],
          ),
        ),
      ),
    );
  }
}
