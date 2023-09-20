import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/domain/entities/no_params.dart';
import 'package:move_app/domain/usecases/get_trending.dart';

import 'movie_carousel_event.dart';
import 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;

  MovieCarouselBloc({required this.getTrending})
      : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(MovieCarouselEvent event) async* {
    if (event is CarouselLoadEvent) {
      final movesEither = await getTrending(NoParams());
      yield movesEither.fold((l) => MovieCarouselError(), (movies)  {
        return MovieCarouselLoaded(
        movies: movies,
        defaultIndex: event.defaultIndex,
      );
    },
    );
  }
  }


}