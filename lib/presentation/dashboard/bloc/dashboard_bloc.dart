import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_event.dart';
import 'package:sonora/presentation/dashboard/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState()) {
    on<DashboardPageChanged>((event, emit) {
      emit(state.copyWith(tabIndex: event.tabIndex));
    });
  }
}
