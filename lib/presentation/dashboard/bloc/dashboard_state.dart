import 'package:equatable/equatable.dart';

enum DashboardStatus { initial, loading, success, failure }

final class DashboardState extends Equatable {
  final DashboardStatus status;
  final int tabIndex;

  const DashboardState({
    this.status = DashboardStatus.initial,
    this.tabIndex = 0,
  });

  DashboardState copyWith({
    DashboardStatus? status,
    int? tabIndex,
  }) {
    return DashboardState(
      status: status ?? this.status,
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }

  @override
  List<Object?> get props => [status, tabIndex];
}
