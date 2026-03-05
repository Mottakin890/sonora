import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class DashboardPageChanged extends DashboardEvent {
  final int tabIndex;

  const DashboardPageChanged({required this.tabIndex});

  @override
  List<Object?> get props => [tabIndex];
}
