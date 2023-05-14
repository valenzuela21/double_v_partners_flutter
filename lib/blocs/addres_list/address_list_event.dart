part of 'address_list_bloc.dart';

abstract class AddressListEvent extends Equatable {
  const AddressListEvent();

  @override
  List<Object> get props => [];
}

class AddAddressEvent extends AddressListEvent {
  final String address;

  const AddAddressEvent({required this.address});

  @override
  List<Object> get props => [address];

  @override
  String toString() {
    return 'AddDateEvent{address: $address}';
  }
}
