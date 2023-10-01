import 'package:flutter/material.dart';
import 'package:move_app/common/constants/size_constants.dart';
import 'package:move_app/common/constants/translation_constants.dart';
import 'package:move_app/common/extensions/size_extensions.dart';
import 'package:move_app/common/extensions/string_extensions.dart';
import 'package:move_app/domain/entities/app_error.dart';
import 'package:move_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:move_app/presentation/blocs/movie_carousel/movie_carousel_event.dart';
import 'package:wiredash/wiredash.dart';

import 'buttion.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final VoidCallback onPressed;

  const AppErrorWidget(
      {Key? key, required this.errorType, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w.toDouble()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            errorType == AppErrorType.api
                ? TranslationConstants.somethingWentWrong.t(context)
                : TranslationConstants.checkNetwork.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ButtonBar(
            children: [
              Button(
                onPressed:onPressed,
                text: TranslationConstants.retry,
              ),
              Button(
                onPressed: () => Wiredash.of(context).show(),
                text: TranslationConstants.feedback,
              ),
            ],
          )
        ],
      ),
    );
  }
}
