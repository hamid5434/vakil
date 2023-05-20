import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vakil_0098/common/exceptions.dart';
import 'package:vakil_0098/data/repository/home/baner_repository.dart';
import 'package:vakil_0098/models/home/baner.dart';


part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBanerRepositoy banerRepositoy;

  HomeBloc(this.banerRepositoy) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted || event is HomeRefresh) {
        try {
          emit(HomeLoading());
          //throw Exception('error');
          print('Start');
          final banners = await bannerRepository.getAll();

          emit(
            HomeSuccess(
              banners: banners,
            ),
          );
        } catch (ex) {
          print('error');
          emit(
            HomeError(
              exception: ex is AppException
                  ? ex
                  : AppException(message: ex.toString(), statusCode: 1),
            ),
          );
        }
      }
    });
  }
}
