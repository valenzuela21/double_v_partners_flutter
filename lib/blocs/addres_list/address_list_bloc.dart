import 'package:double_partners/models/address.model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'address_list_event.dart';

part 'address_list_state.dart';

class AddressListBloc extends Bloc<AddressListEvent, AddressListState> {
  AddressListBloc() : super(AddressListState.initial()) {
    on<AddAddressEvent>(_addDate);
  }

  void  _addDate(AddAddressEvent event, Emitter<AddressListState> emit){
    final newData = AddressModel(address: event.address );

    final newAddress = [...state.listAddress, newData];
    emit(state.copyWith(listAddress: newAddress));
  }
}
