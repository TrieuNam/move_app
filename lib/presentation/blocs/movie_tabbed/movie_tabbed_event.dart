part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();

  @override
  List<Object> get props => [];
}

class MovieTableChangeEvent extends MovieTabbedEvent {
  final int currentTabIndex;

  const MovieTableChangeEvent({this.currentTabIndex = 0});

  @override
  List<Object> get props => [currentTabIndex];
}
