import 'package:double_partners/blocs/info_list/info_list_bloc.dart';
import 'package:double_partners/presentation/shared/layout_custom.shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/address_list/address_list_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<AddressListBloc>().add(CleanAddressEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final infos = context.watch<InfoListBloc>().state.infoList;
    return LayoutCustomShared(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (){
                      Navigator.pushNamed(context, '/detail', arguments: infos[index]);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(
                      '${infos[index].name} ${infos[index].secondName}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                       const  SizedBox(height: 5,),
                        Text(infos[index].email,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: infos.length,
            ),
          ),
        ],
      ),
    );
  }
}
