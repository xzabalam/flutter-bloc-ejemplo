import 'package:bloc/bloc.dart';
import 'package:estados/models/user.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    // Evento que se activa cuando se setea el usuario activo
    on<ActivateUserEvent>((event, emit) => emit(UserSetState(event.user)));

    // Evento que se activa cuando se cambia la edad.
    on<ChangeUserAgeEvent>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    // Evento para a;adir una profesion
    on<AddUserProfessionEvent>((event, emit) {
      if (!state.existUser) return;
      final profesiones = [...state.user!.profesiones, event.profession];
      emit(UserSetState(state.user!.copyWith(profesiones: profesiones)));
    });

    // Reset estado a inicial
    on<DeleteUserEvent>((event, emit) => emit(const UserInitialState()));
  }
}
