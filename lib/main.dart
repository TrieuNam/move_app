import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:move_app/domain/entities/app_error.dart';
import 'package:move_app/domain/entities/movies_entity.dart';
import 'package:move_app/domain/entities/no_params.dart';
import 'package:move_app/domain/usecases/get_trending.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;

Future<void> main() async {
  unawaited(getIt.init());
  GetTrending getTrending = getIt.getItInstance<GetTrending>();
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
      home: Container(),
    );
  }
}
