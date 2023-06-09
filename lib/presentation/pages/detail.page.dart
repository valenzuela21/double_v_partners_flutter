import 'package:double_partners/models/info.model.dart';
import 'package:double_partners/presentation/shared/layout.shared.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final info = ModalRoute.of(context)?.settings.arguments as InfoModel;
    return Layout(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Nombre:", style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: 8),
        Text(info.name, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height:8),
        Text("Apellidio:", style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: 8),
        Text(info.secondName,  style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height:8),
        Text("Correo Electrónico:", style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: 8),
        Text(info.email,  style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height:8),
        Text("Dirección:", style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height:8),
        info.address.isNotEmpty ?
        SizedBox(
          height: 400,
          child: ListView.builder(
              itemCount: info.address.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 25,
                  color: Colors.transparent,
                  child: Text(info.address[index].address,  style: Theme.of(context).textTheme.titleSmall),
                );
              }),
        ) : Text("No hay direcciones...", style: Theme.of(context).textTheme.titleSmall)
      ],
    ));
  }
}
