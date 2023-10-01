import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/domain/entities/no_params.dart';
import 'package:move_app/domain/usecases/get_trending.dart';
import 'package:move_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:move_app/presentation/blocs/movie_backdrop/movie_backdrop_event.dart';

import 'movie_carousel_event.dart';
import 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;


  MovieCarouselBloc({required this.getTrending,required this.movieBackdropBloc})
      : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(MovieCarouselEvent event) async* {
    if (event is CarouselLoadEvent) {
      final movesEither = await getTrending(NoParams());
      yield movesEither.fold((l) => MovieCarouselError(
        l.appErrorTyp
      ), (movies)  {
        movieBackdropBloc.add(MovieBackdropChangedEvent(movies![event.defaultIndex]));
        return MovieCarouselLoaded(
        movies: movies,
        defaultIndex: event.defaultIndex,
      );
    },
    );
  }
  }


}