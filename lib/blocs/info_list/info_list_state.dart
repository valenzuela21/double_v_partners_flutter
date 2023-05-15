part of 'info_list_bloc.dart';

class InfoListState extends Equatable {
  final List<InfoModel> infoList;

  const InfoListState({required this.infoList});

  factory InfoListState.initial() {
    return InfoListState(infoList: [
      InfoModel(name: "David Fernando", secondName: "Valenzuela Pardo", email: "vlzdavid2131@outlook.com", address: [AddressModel(address: "cra 45 no.67-90")]),
      InfoModel(name: "Andrea", secondName: "Valenzuela Garzón", email: "andrea4567@outlook.com", address: [AddressModel(address: "cra 56 no.90-90")])
    ]);
  }

  @override
  List<Object> get props => [infoList];

  InfoListState copyWith({
    List<InfoModel>? infoList
  }) {
    return InfoListState(
        infoList: infoList ?? this.infoList
    );
  }
}
