part of 'address_list_bloc.dart';

abstract class AddressListState extends Equatable {
  const AddressListState();
}

class AddressListInitial extends AddressListState {
  @override
  List<Object> get props => [];
}
