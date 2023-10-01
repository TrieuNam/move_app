import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/di/get_it.dart';
import 'package:move_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:move_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:move_app/presentation/blocs/movie_carousel/movie_carousel_event.dart';
import 'package:move_app/presentation/blocs/movie_carousel/movie_carousel_state.dart';
import 'package:move_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:move_app/presentation/journeys/home/move_tabbed/movie_tabbed_widget.dart';
import 'package:move_app/presentation/journeys/home/movie_carousel/movie_carousel_widget.dart';

import '../drawer/navigation_drawer.dart';
import '../../widgets/app_error_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;
  late MovieTabbedBloc movieTabbedBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieTabbedBloc = getItInstance<MovieTabbedBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movieCarouselBloc.close();
    movieBackdropBloc.close();
    movieTabbedBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (conext) => movieCarouselBloc),
        BlocProvider(create: (context) => movieBackdropBloc),
        BlocProvider(create: (context) => movieTabbedBloc),
      ],
      child: Scaffold(
        drawer: NavigationDrawer(),
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
                    child: MovieTabbedWidget(),
                  ),
                ],
              );
            } else if (state is MovieCarouselError) {
              return AppErrorWidget(
                onPressed: () => movieCarouselBloc.add(CarouselLoadEvent()),
                errorType: state.errorType,);
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
