import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/movies_entity.dart';
import '../repositories/movie_repository.dart';

class GetPopular {
  final MovieRepository repository;

  GetPopular(this.repository);

  Future<Either<AppError, List<MovieEntity>?>> call() async {
    return await repository.getPopular();
  }
}
