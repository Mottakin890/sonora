import 'package:equatable/equatable.dart';
import 'package:sonora/domain/entities/storage_entity.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final List<Map<String, dynamic>> sections;
  final Map<String, bool> toggles;
  final StorageEntity storageInfo;

  const SettingsLoaded({
    required this.sections,
    required this.toggles,
    required this.storageInfo,
  });

  @override
  List<Object?> get props => [sections, toggles, storageInfo];

  SettingsLoaded copyWith({
    List<Map<String, dynamic>>? sections,
    Map<String, bool>? toggles,
    StorageEntity? storageInfo,
  }) {
    return SettingsLoaded(
      sections: sections ?? this.sections,
      toggles: toggles ?? this.toggles,
      storageInfo: storageInfo ?? this.storageInfo,
    );
  }
}

class SettingsError extends SettingsState {
  final String message;

  const SettingsError(this.message);

  @override
  List<Object?> get props => [message];
}
