part of 'address_list_bloc.dart';


class AddressListState extends Equatable {
  final List<AddressModel> listAddress;

  const AddressListState({
    required this.listAddress
});

  factory AddressListState.initial(){
    return const AddressListState(listAddress: []);
  }

  @override
  List<Object> get props => [listAddress];

  @override
  String toString() {
    return 'AddressListState{listDates: $listAddress}';
  }

  AddressListState copyWith({
    List<AddressModel>? listAddress
}){
    return AddressListState(listAddress: listAddress ?? this.listAddress);
  }
}


