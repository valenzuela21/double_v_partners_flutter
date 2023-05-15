import 'package:double_partners/blocs/address_list/address_list_bloc.dart';
import 'package:double_partners/blocs/info_list/info_list_bloc.dart';
import 'package:double_partners/presentation/routes/route.dart';
import 'package:double_partners/presentation/themes/app.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InfoListBloc>(create: (context) => InfoListBloc()),
        BlocProvider<AddressListBloc>(create: (context) => AddressListBloc())
      ],
      child: MaterialApp(
        title: 'Double V Partners',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.initial,
        theme: AppTheme.theme(context),
        routes: AppRoute.routes,
      ),
    );
  }
}


