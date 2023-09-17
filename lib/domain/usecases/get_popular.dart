import 'package:dartz/dartz.dart';
import 'package:move_app/domain/usecases/usecase.dart';

import '../entities/app_error.dart';
import '../entities/movies_entity.dart';
import '../entities/no_params.dart';
import '../repositories/movie_repository.dart';

class GetPopular extends UseCase<List<MovieEntity>, NoParams>{
  final MovieRepository repository;

  GetPopular(this.repository);

  Future<Either<AppError, List<MovieEntity>?>> call(NoParams noParams) async {
    return await repository.getPopular();
  }
}
