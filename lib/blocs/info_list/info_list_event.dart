part of 'info_list_bloc.dart';

abstract class InfoListEvent extends Equatable {
  const InfoListEvent();

  @override
  List<Object> get props => [];
}

class AddInfoList extends InfoListEvent {
  final String name;
  final String secondName;
  final String email;

  const AddInfoList(
      {required this.name, required this.secondName, required this.email});

  @override
  List<Object> get props => [name, secondName, email];
}
