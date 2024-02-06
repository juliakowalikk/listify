import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listify/domain/models/firebase_auth_model.dart';

part 'settings_cubit.freezed.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final AuthService authService;

  SettingsCubit(this.authService) : super(const SettingsState.initial());

  Future<void> changeUserEmail({newEmail}) async {
    try {
      final x = authService.firebaseAuth.currentUser;
      x?.updateEmail(newEmail);
      emit(const SettingsState.emailChanged());
    } catch (e) {
      emit(const SettingsState.error());
    }
  }
}
