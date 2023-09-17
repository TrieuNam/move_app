import 'package:move_app/domain/entities/movies_entity.dart';
import 'package:move_app/domain/repositories/movie_repository.dart';

class GetTrending {
  final MovieRepository repository;

  GetTrending(this.repository);

  Future<List<MovieEntity>?> call() async {
    return await repository.getTrending();
  }

}