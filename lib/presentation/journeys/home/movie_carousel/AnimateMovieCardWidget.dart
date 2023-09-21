import 'package:flutter/material.dart';
import 'package:move_app/common/constants/size_constants.dart';
import 'package:move_app/common/extensions/size_extensions.dart';
import 'package:move_app/common/screenutil/screenutil.dart';
import 'package:move_app/presentation/journeys/home/movie_carousel/movie_card_widget.dart';

class AnimateMovieCardWidget extends StatelessWidget {
  final int index;
  final int movieId;
  final String potserPath;
  final PageController pageController;

  const AnimateMovieCardWidget(
      {Key? key,
      required this.index,
      required this.movieId,
      required this.potserPath,
      required this.pageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = (pageController.page! - index);
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: Curves.easeIn.transform(value) *
                  ScreenUtil.screenHeight *
                  0.35,
              width: Sizes.dimen_230.w.toDouble(),
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                      ScreenUtil.screenHeight *
                      0.35,
              width: Sizes.dimen_230.w.toDouble(),
              child: child,
            ),
          );
        }
      },
      child: MovieCardWidget(
        movieID: movieId,
        posterPath: potserPath,
      ),
    );
  }
}
