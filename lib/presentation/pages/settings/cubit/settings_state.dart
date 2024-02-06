part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.emailChanged() = _EmailChanged;
  const factory SettingsState.error() = _Error;
}
