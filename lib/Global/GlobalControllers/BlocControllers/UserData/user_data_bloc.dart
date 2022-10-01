

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  UserDataBloc() : super(UserDataInitial()) {
    on<UserDataEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
