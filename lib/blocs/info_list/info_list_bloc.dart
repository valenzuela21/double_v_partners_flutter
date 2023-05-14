import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/info.model.dart';

part 'info_list_event.dart';
part 'info_list_state.dart';

class InfoListBloc extends Bloc<InfoListEvent, InfoListState> {
  InfoListBloc() : super(InfoListState.initial()) {
    on<AddInfoList>(_addInfo);
  }

  void  _addInfo(AddInfoList event, Emitter<InfoListState> emit){
    final newInfo =  InfoModel(name: event.name, secondName: event.secondName, email: event.email, address: const []);
    final newInfoList = [...state.infoList, newInfo];
    emit(state.copyWith(infoList: newInfoList));
  }
}


