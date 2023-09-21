import 'package:equatable/equatable.dart';
import 'package:move_app/domain/entities/movies_entity.dart';

abstract class MovieBackdropEvent extends Equatable{
  const  MovieBackdropEvent();
  @override
  List<Object>get props => [];
}

class MovieBackdropChangedEvent extends MovieBackdropEvent{
  final MovieEntity movie;

  const MovieBackdropChangedEvent(this.movie);

  @override
  List<Object>get props => [movie];
}