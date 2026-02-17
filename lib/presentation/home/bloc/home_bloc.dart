import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonora/domain/entities/user_entities.dart';

import 'package:sonora/presentation/home/bloc/home_event.dart';
import 'package:sonora/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(UserEntities userEntities)
    : super(HomeInitialState(userData: userEntities)) {
    on<HomeDataInitEvent>((event, emit) {
      // Logic to fetch other home data can go here
    });
    on<HomeSearchEvent>(
      (event, emit) {
        // Logics for searching
      }
    );
  }
}
