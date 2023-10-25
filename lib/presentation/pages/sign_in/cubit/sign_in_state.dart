part of 'sign_in_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.goToList() = _GoToList;
  const factory LoginState.error() = _Error;
}
