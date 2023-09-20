import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:move_app/di/get_it.dart' as GetIt;
import 'package:move_app/presentation/widgets/movie_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(GetIt.init());
  runApp(MovieApp());
}
