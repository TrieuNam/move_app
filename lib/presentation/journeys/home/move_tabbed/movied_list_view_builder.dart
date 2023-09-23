import 'package:flutter/material.dart';
import 'package:move_app/common/extensions/size_extensions.dart';
import 'package:move_app/domain/entities/movies_entity.dart';
import 'package:move_app/presentation/journeys/home/move_tabbed/movie_tab_card_widget.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({Key? key, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final MovieEntity movie = movies[index];
          return MovieTabCardWidget(
              moviedId: movie.id,
              title: movie.title,
              posterPath: movie.posterPath);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 14.w.toDouble(),
          );
        },
        itemCount: movies.length);
  }
}
