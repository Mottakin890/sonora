import 'package:equatable/equatable.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

final class LoadSettings extends SettingsEvent {
  const LoadSettings();
}

final class ClearStorageCache extends SettingsEvent {
  const ClearStorageCache();
}

final class ToggleSetting extends SettingsEvent {
  final String key;
  final bool value;

  const ToggleSetting({required this.key, required this.value});

  @override
  List<Object?> get props => [key, value];
}
