import 'package:double_partners/blocs/address_list/address_list_bloc.dart';
import 'package:double_partners/blocs/info_list/info_list_bloc.dart';
import 'package:double_partners/presentation/components/form/input.form.dart';
import 'package:double_partners/presentation/components/modal.component.dart';
import 'package:double_partners/presentation/shared/layout.shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/form/calendar.form.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _dataInputDate = TextEditingController();

  final AutovalidateMode _autoValidateMode = AutovalidateMode.always;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _lastname.dispose();
    _email.dispose();
    _dataInputDate.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listAddress = context.watch<AddressListBloc>().state.listAddress;
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return Layout(
        child: WillPopScope(
      onWillPop: () async {
        context.read<AddressListBloc>().add(CleanAddressEvent());
        return true;
      },
      child: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
        child: Column(children: [
          SizedBox(
              height: size.height / 1.27,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _name,
                    enableSuggestions: false,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecorations.generalInputDecoration(
                        hinText: 'Ingresa el nombre completo',
                        labelText: 'Nombre',
                        colorInput: colorScheme.secondary),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Ingresa el nombre completo";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _lastname,
                    enableSuggestions: false,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecorations.generalInputDecoration(
                        hinText: 'Ingresa el apellido completo',
                        labelText: 'Apellido',
                        colorInput: colorScheme.secondary),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Ingresa el apellido completo";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _email,
                    enableSuggestions: false,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecorations.generalInputDecoration(
                        hinText: 'Ingresa el email completo',
                        labelText: 'Correo Electrónico',
                        colorInput: colorScheme.secondary),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Ingresa el email completo";
                      }
                      if (!emailValid.hasMatch(value)) {
                        return "Ingresa el email correctmente";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _dataInputDate,
                    enableSuggestions: false,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    autocorrect: false,
                    keyboardType: TextInputType.none,
                    readOnly: true,
                    decoration: InputDecorations.generalInputDecoration(
                        hinText: 'Ingresa la fecha de nacimiento',
                        labelText: 'Fecha de nacimiento',
                        colorInput: colorScheme.secondary),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Ingresa la fecha de nacimiento";
                      }
                      return null;
                    },
                    onTap: () {
                      CalendarPicker.dialogBuilder(context, _dataInputDate);
                    },
                  ),
                  const SizedBox(height: 8),
                  const ListAddressWidget(),
                  const SizedBox(height: 8),
                  MaterialButton(
                      disabledColor: Theme.of(context).colorScheme.secondary,
                      focusColor: Theme.of(context).colorScheme.secondary,
                      splashColor: Theme.of(context).colorScheme.secondary,
                      highlightColor: Theme.of(context).colorScheme.secondary,
                      elevation: 0,
                      color: Colors.black26,
                      onPressed: () {
                        ModalComponent.dialogBuilder(context, AddNewAddress());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        child: Text("Agregar Dirección".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                      )),
                ],
              )),
          MaterialButton(
              disabledColor: Theme.of(context).colorScheme.primary,
              focusColor: Theme.of(context).colorScheme.primary,
              splashColor: Theme.of(context).colorScheme.primary,
              highlightColor: Theme.of(context).colorScheme.primary,
              elevation: 0,
              color: Theme.of(context).colorScheme.tertiary,
              onPressed: () {
                var valid = _formKey.currentState?.validate();
                if (valid == true) {
                  context.read<InfoListBloc>().add(AddInfoList(
                      name: _name.text,
                      secondName: _lastname.text,
                      email: _email.text,
                      address: listAddress));
                  _name.clear();
                  _lastname.clear();
                  _email.clear();
                  _dataInputDate.clear();
                  Navigator.pushNamed(context, "/home");
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                child: Text("Crear Usuario".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700)),
              ))
        ]),
      ),
    ));
  }
}

class ListAddressWidget extends StatelessWidget {
  const ListAddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final listAddress = context.watch<AddressListBloc>().state.listAddress;
    return listAddress.isNotEmpty
        ? SizedBox(
            height: 120,
            child: ListView.builder(
                itemCount: listAddress.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    color: Colors.transparent,
                    child: Text(listAddress[index].address,
                        style: Theme.of(context).textTheme.titleSmall),
                  );
                }),
          )
        : const Text("No hay direcciones...");
  }
}

class AddNewAddress extends StatelessWidget {
  late final String addressTxt;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autoValidateMode = AutovalidateMode.always;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            enableSuggestions: false,
            cursorColor: Theme.of(context).colorScheme.primary,
            autocorrect: false,
            decoration: InputDecorations.generalInputDecoration(
                hinText: 'Ingresa la dirección del domicilio',
                labelText: 'Dirección',
                colorInput: colorScheme.secondary),
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return "Ingresa la dirección";
              }
              return null;
            },
            onSaved: (String? value) {
              addressTxt = value!;
            },
          ),
          const SizedBox(
            height: 9,
          ),
          MaterialButton(
              disabledColor: Theme.of(context).colorScheme.primary,
              focusColor: Theme.of(context).colorScheme.primary,
              splashColor: Theme.of(context).colorScheme.primary,
              highlightColor: Theme.of(context).colorScheme.primary,
              elevation: 0,
              color: Theme.of(context).colorScheme.tertiary,
              onPressed: () {
                var valid = _formKey.currentState!.validate();
                if (valid) {
                  _formKey.currentState?.save();
                  context
                      .read<AddressListBloc>()
                      .add(AddAddressEvent(address: addressTxt));
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text("Agregar Nueva Dirección".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700)),
              )),
        ],
      ),
    );
  }
}
