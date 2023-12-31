import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:move_app/domain/entities/app_error.dart';
import 'package:move_app/domain/entities/movies_entity.dart';
import 'package:move_app/domain/entities/no_params.dart';
import 'package:move_app/domain/usecases/get_coming_soon.dart';
import 'package:move_app/domain/usecases/get_playing_now.dart';
import 'package:move_app/domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';

part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabbedBloc({
    required this.getPopular,
    required this.getPlayingNow,
    required this.getComingSoon,
  }) : super(MovieTabbedInitial(0));

  @override
  Stream<MovieTabbedState?> mapEventToState(
    MovieTabbedEvent event,
  ) async* {
    if (event is MovieTableChangeEvent) {
      Either<AppError, List<MovieEntity>?>? moviesEither;
      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getPopular(NoParams());
          break;
        case 1:
          moviesEither = await getPlayingNow(NoParams());
          break;
        case 2:
          moviesEither = await getComingSoon(NoParams());
          break;
      }
      // yield MovieTabLoadError(
      //   currentTabIndex: event.currentTabIndex,
      //   errorType: AppErrorType.network,
      // );
      yield moviesEither?.fold(
        (l) => MovieTabLoadError(
            currentTabIndex: event.currentTabIndex, errorType: l.appErrorTyp),
        (movies) {
          return MovieTabChanged(
            movies: movies!,
            currentTabIndex: event.currentTabIndex,
          );
        },
      );
    }
  }
}
