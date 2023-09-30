import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/common/constants/languages.dart';
import 'package:move_app/di/get_it.dart';
import 'package:move_app/presentation/app_lacalizations.dart';
import 'package:move_app/presentation/blocs/language/language_bloc.dart';
import 'package:move_app/presentation/themes/theme_text.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../common/screenutil/screenutil.dart';
import '../journeys/home/home_screen.dart';
import '../themes/theme_color.dart';

class MovieApp extends StatefulWidget {
  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  late LanguageBloc _languageBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider<LanguageBloc>.value(
      value: _languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Movie App',
              theme: ThemeData(
                primaryColor: ThemeColor.vulcan,
                scaffoldBackgroundColor: ThemeColor.vulcan,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                textTheme: ThemeText.getTextTheme(),
                appBarTheme: const AppBarTheme(elevation: 0),
                colorScheme: ColorScheme.fromSwatch()
                    .copyWith(secondary: ThemeColor.royalBlue),
              ),
              supportedLocales:
                  Languages.languages.map((e) => Locale(e.code)).toList(),
              locale: state.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              home: HomeScreen(),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
