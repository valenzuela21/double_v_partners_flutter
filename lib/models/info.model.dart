import 'package:double_partners/models/address.model.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class InfoModel extends Equatable {
  final String id;
  final String name;
  final String secondName;
  final String email;
  final List<AddressModel> address;


  InfoModel({String? id, required this.name, required this.secondName, required  this.email, required this.address}): id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, name, secondName, address];

  @override
  String toString() => 'InfoModel{id: $id, name: $name, secondName: $secondName, email: $email, address: $address}';

}