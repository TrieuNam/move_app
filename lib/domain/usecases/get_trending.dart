import 'package:dartz/dartz.dart';
import 'package:move_app/domain/entities/movies_entity.dart';
import 'package:move_app/domain/entities/no_params.dart';
import 'package:move_app/domain/repositories/movie_repository.dart';
import 'package:move_app/domain/usecases/usecase.dart';

import '../entities/app_error.dart';

class GetTrending extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetTrending(this.repository);

  Future<Either<AppError, List<MovieEntity>?>> call(NoParams noParams) async {
    return await repository.getTrending();
  }
}
