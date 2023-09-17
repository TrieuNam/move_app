import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:move_app/data/core/api_client.dart';
import 'package:move_app/data/data_sources/movie_remote_data_source.dart';
import 'package:move_app/data/repositories/movie_repository_impl.dart';
import 'package:move_app/domain/entities/app_error.dart';
import 'package:move_app/domain/entities/movies_entity.dart';
import 'package:move_app/domain/entities/no_params.dart';
import 'package:move_app/domain/repositories/movie_repository.dart';
import 'package:move_app/domain/usecases/get_trending.dart';

void main() async {
  ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  GetTrending getTrending = GetTrending(movieRepository);
  final Either<AppError, List<MovieEntity>?> eitherResponse =
      await getTrending(NoParams());
  eitherResponse.fold((l) {
    print('error');
    print(l);
  }, (r) {
    print('List of movies');
    print(r);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Container(),
    );
  }
}


