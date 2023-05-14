import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'address_list_event.dart';
part 'address_list_state.dart';

class AddressListBloc extends Bloc<AddressListEvent, AddressListState> {
  AddressListBloc() : super(AddressListInitial()) {
    on<AddressListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
