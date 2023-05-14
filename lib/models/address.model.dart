import 'package:double_partners/models/info.model.dart';
import 'package:equatable/equatable.dart';

class  AddressModel extends Equatable{
  final String id;
  final String address;

  AddressModel({
    String? id,
    required this.address
}): id =  id ?? uuid.v4();

  @override
  List<Object> get props => [address];

  @override
  String toString() {
    return 'AddressModel{id: $id, address: $address}';
  }
}