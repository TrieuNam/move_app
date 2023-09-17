import 'package:dartz/dartz.dart';
import 'package:move_app/domain/entities/movies_entity.dart';
import 'package:move_app/domain/repositories/movie_repository.dart';

import '../entities/app_error.dart';

class GetTrending {
  final MovieRepository repository;

  GetTrending(this.repository);

  Future<Either<AppError, List<MovieEntity>?>> call() async {
    return await repository.getTrending();
  }
}
