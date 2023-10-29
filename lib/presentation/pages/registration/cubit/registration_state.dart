part of 'registration_cubit.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial() = _Initial;
  const factory RegistrationState.successRegistration() = _SuccessRegistration;
  const factory RegistrationState.error() = _Error;
}
