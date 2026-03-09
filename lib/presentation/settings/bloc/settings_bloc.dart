import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/domain/usecases/clear_cache_usecase.dart';
import 'package:sonora/domain/usecases/get_storage_info_usecase.dart';
import 'package:sonora/global/resources/mock_data.dart';
import 'package:sonora/presentation/settings/bloc/settings_event.dart';
import 'package:sonora/presentation/settings/bloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetStorageInfoUseCase getStorageInfoUseCase;
  final ClearCacheUseCase clearCacheUseCase;

  SettingsBloc({
    required this.getStorageInfoUseCase,
    required this.clearCacheUseCase,
  }) : super(SettingsInitial()) {
    on<LoadSettings>(_onLoadSettings);
    on<ToggleSetting>(_onToggleSetting);
    on<ClearStorageCache>(_onClearStorageCache);
  }

  Future<void> _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    emit(SettingsLoading());
    try {
      final storageInfo = await getStorageInfoUseCase();
      final sections = MockData.settingsSections;
      const toggles = <String, bool>{
        'data_saver': false,
        'audio_normalization': true,
        'mono_audio': false,
      };
      emit(SettingsLoaded(
        sections: sections,
        toggles: toggles,
        storageInfo: storageInfo,
      ));
    } on Exception catch (e) {
      emit(SettingsError(e.toString()));
    }
  }

  void _onToggleSetting(ToggleSetting event, Emitter<SettingsState> emit) {
    if (state is SettingsLoaded) {
      final current = state as SettingsLoaded;
      final newToggles = Map<String, bool>.from(current.toggles)
        ..[event.key] = event.value;
      emit(current.copyWith(toggles: newToggles));
    }
  }

  Future<void> _onClearStorageCache(
    ClearStorageCache event,
    Emitter<SettingsState> emit,
  ) async {
    if (state is SettingsLoaded) {
      final current = state as SettingsLoaded;
      try {
        await clearCacheUseCase();
        final newStorage = await getStorageInfoUseCase();
        emit(current.copyWith(storageInfo: newStorage));
      } on Exception catch (e) {
        emit(SettingsError('Failed to clear cache: $e'));
      }
    }
  }
}
