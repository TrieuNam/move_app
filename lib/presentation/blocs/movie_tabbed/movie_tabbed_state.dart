part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabIndex;

  MovieTabbedState(this.currentTabIndex);
  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState {
  MovieTabbedInitial(int currentTabIndex) : super(currentTabIndex);

}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntity> movies;

  MovieTabChanged({required int currentTabIndex, required this.movies}) : super(currentTabIndex);


  @override
  List<Object> get props => [currentTabIndex, movies];
}

class MovieTabLoadError extends MovieTabbedState {
  MovieTabLoadError({required int currentTabIndex}) : super(currentTabIndex);

}
