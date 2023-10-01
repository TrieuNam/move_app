import 'package:flutter/material.dart';
import 'package:move_app/common/extensions/size_extensions.dart';
import 'package:move_app/common/extensions/string_extensions.dart';
import 'package:move_app/presentation/themes/theme_color.dart';

import '../../common/constants/size_constants.dart';
import '../../common/constants/translation_constants.dart';
import 'buttion.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget? image;

  const AppDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ThemeColor.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(Sizes.dimen_32.w.toDouble()),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_8.w.toDouble()),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: Sizes.dimen_4.h.toDouble(),
          left: Sizes.dimen_16.w.toDouble(),
          right: Sizes.dimen_16.w.toDouble(),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ThemeColor.vulcan,
              blurRadius: Sizes.dimen_16,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.t(context),
              style: Theme.of(context).textTheme.headline5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h.toDouble()),
              child: Text(
                description.t(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            if (image != null) image!,
            Button(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: TranslationConstants.okay,
            ),
          ],
        ),
      ),
    );
  }
}