import 'package:equatable/equatable.dart';
import 'package:sonora/domain/entities/storage_entity.dart';

enum SettingsStatus { initial, loading, success, failure }

final class SettingsState extends Equatable {
  final SettingsStatus status;
  final List<Map<String, dynamic>> sections;
  final Map<String, bool> toggles;
  final StorageEntity? storageInfo;
  final String? errorMessage;

  const SettingsState({
    this.status = SettingsStatus.initial,
    this.sections = const [],
    this.toggles = const {},
    this.storageInfo,
    this.errorMessage,
  });

  SettingsState copyWith({
    SettingsStatus? status,
    List<Map<String, dynamic>>? sections,
    Map<String, bool>? toggles,
    StorageEntity? storageInfo,
    String? errorMessage,
  }) {
    return SettingsState(
      status: status ?? this.status,
      sections: sections ?? this.sections,
      toggles: toggles ?? this.toggles,
      storageInfo: storageInfo ?? this.storageInfo,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        sections,
        toggles,
        storageInfo,
        errorMessage,
      ];
}
