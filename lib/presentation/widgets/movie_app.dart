import 'package:flutter/material.dart';
import 'package:move_app/presentation/themes/theme_text.dart';

import '../../common/screenutil/screenutil.dart';
import '../journeys/home/home_screen.dart';
import '../themes/theme_color.dart';

class MovieApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primaryColor: ThemeColor.vulcan,
        scaffoldBackgroundColor: ThemeColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: HomeScreen(),
    );
  }
}
