import 'package:equatable/equatable.dart';

class DashboardState extends Equatable {
  final int tabIndex;

  const DashboardState({this.tabIndex = 0});

  DashboardState copyWith({int? tabIndex}) {
    return DashboardState(
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }

  @override
  List<Object?> get props => [tabIndex];
}
