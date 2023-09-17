import 'package:move_app/domain/entities/movies_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>?> getTrending();
}
