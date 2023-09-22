import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/di/get_it.dart';
import 'package:move_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:move_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:move_app/presentation/blocs/movie_carousel/movie_carousel_event.dart';
import 'package:move_app/presentation/blocs/movie_carousel/movie_carousel_state.dart';
import 'package:move_app/presentation/journeys/home/movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movieCarouselBloc.close();
    movieBackdropBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (conext) => movieCarouselBloc),
        BlocProvider(create: (context) => movieBackdropBloc),
      ],
      child: Scaffold(
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          bloc: movieCarouselBloc,
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.6,
                      child: MovieCarouseWidget(
                        movies: state.movies,
                        defaultIndex: state.defaultIndex,
                      )),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: Placeholder(
                      color: Colors.white,
                    ),
                  )
                ],
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
