import 'package:flutter/material.dart';
import 'package:move_app/domain/entities/movies_entity.dart';
import 'package:move_app/presentation/widgets/movie_app.dart';
import 'package:move_app/presentation/widgets/movie_app_bar.dart';

import 'movie_backdrop_widget.dart';
import 'movie_page_view.dart';

class MovieCarouseWidget extends StatelessWidget {
  final List<MovieEntity>? movies;
  final int defaultIndex;

  const MovieCarouseWidget({
    Key? key,
    required this.movies,
    required this.defaultIndex,
  })  : assert(defaultIndex >= 0, 'defaultIndex can not be less than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialPage: defaultIndex,
            ),
          ],
        )
      ],
    );
  }
}
