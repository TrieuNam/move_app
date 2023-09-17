import 'package:dartz/dartz.dart';
import 'package:move_app/data/data_sources/movie_remote_data_source.dart';
import 'package:move_app/data/models/movie_model.dart';
import 'package:move_app/domain/entities/movies_entity.dart';
import 'package:move_app/domain/repositories/movie_repository.dart';

import '../../domain/entities/app_error.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MovieEntity>?>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on Exception {
      return Left(AppError("Something went wrong"));
    }
  }
}
