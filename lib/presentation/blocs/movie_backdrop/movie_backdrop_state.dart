
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movies_entity.dart';

abstract class MovieBackdropState extends Equatable {
  const MovieBackdropState();

  @override
  List<Object> get props => [];
}

class MovieBackdropInitial extends MovieBackdropState {}

class MovieBackdropChanged extends MovieBackdropState {
  final MovieEntity movie;

  const MovieBackdropChanged(this.movie) ;

  @override
  List<Object> get props => [movie];
}