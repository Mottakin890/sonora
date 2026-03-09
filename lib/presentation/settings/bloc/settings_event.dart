import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class LoadSettings extends SettingsEvent {
  const LoadSettings();
}

class ClearStorageCache extends SettingsEvent {
  const ClearStorageCache();
}

class ToggleSetting extends SettingsEvent {
  final String key;
  final bool value;

  const ToggleSetting({required this.key, required this.value});

  @override
  List<Object?> get props => [key, value];
}
