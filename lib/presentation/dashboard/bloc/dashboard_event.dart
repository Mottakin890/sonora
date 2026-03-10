import 'package:equatable/equatable.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();
}

final class DashboardPageChanged extends DashboardEvent {
  final int tabIndex;

  const DashboardPageChanged({required this.tabIndex});

  @override
  List<Object?> get props => [tabIndex];
}
