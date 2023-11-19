import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listify/domain/models/firebase_auth_model.dart';

part 'sign_in_cubit.freezed.dart';
part 'sign_in_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService authService;
  LoginCubit(this.authService) : super(const LoginState.initial());

  Future<void> signIn(String email, String password) async {
    try {
      await authService.firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      emit(const LoginState.goToList());
    } catch (e) {
      emit(const LoginState.error());
    }
  }
}
