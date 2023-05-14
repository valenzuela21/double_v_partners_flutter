import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/info_model.dart';

part 'info_list_event.dart';
part 'info_list_state.dart';

class InfoListBloc extends Bloc<InfoListEvent, InfoListState> {
  InfoListBloc() : super(InfoListState.initial()) {
    on<InfoListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
