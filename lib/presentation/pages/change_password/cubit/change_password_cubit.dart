import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listify/domain/models/firebase_auth_model.dart';

part 'change_password_cubit.freezed.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final AuthService authService;

  ChangePasswordCubit(this.authService)
      : super(const ChangePasswordState.initial());

  Future<void> changeUserPassword({email, newPassword, oldPassword}) async {
    final x = authService.firebaseAuth.currentUser;
    print(x);
    var cred =
        EmailAuthProvider.credential(email: email, password: oldPassword);
    await x!.reauthenticateWithCredential(cred).then(
          (value) => x.updatePassword(newPassword),
        );
    emit(const ChangePasswordState.successChangePassword());
  }
}
