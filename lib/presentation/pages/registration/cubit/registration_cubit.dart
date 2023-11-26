import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listify/domain/models/firebase_auth_model.dart';

part 'registration_cubit.freezed.dart';
part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthService authService;

  RegistrationCubit(this.authService)
      : super(const RegistrationState.initial());

  CollectionReference usersDb = FirebaseFirestore.instance.collection('users');

  Future<void> register(String email, String password) async {
    try {
      await authService.firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      emit(const RegistrationState.successRegistration());
    } catch (e) {
      emit(const RegistrationState.error());
    }
  }
}
