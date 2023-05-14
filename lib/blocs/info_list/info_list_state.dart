part of 'info_list_bloc.dart';

class InfoListState extends Equatable {
  final List<InfoModel> info_list;

  InfoListState({required this.info_list});

  factory InfoListState.initial() {
    return InfoListState(info_list: [
      InfoModel(name: "David Fernando", secondName: "Valenzuela Pardo", email: "vlzdavid2131@outlook.com", address: ["cra 45 no.67-90"]),
      InfoModel(name: "Andrea", secondName: "Valenzuela Garzón", email: "andrea4567@outlook.com", address: ["cra 56 -90 no - 90"])
    ]);
  }

  @override
  List<Object> get props => [info_list];

  InfoListState copyWith({
    List<InfoModel>? info_list
  }) {
    return InfoListState(
        info_list: info_list ?? this.info_list
    );
  }
}
