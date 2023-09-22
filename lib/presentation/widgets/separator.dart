import 'package:flutter/material.dart';
import 'package:move_app/common/constants/size_constants.dart';
import 'package:move_app/common/extensions/size_extensions.dart';
import 'package:move_app/presentation/themes/theme_color.dart';

class Separtor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_1.h.toDouble(),
      width: Sizes.dimen_80.w.toDouble(),
      padding: EdgeInsets.only(
        top: Sizes.dimen_2.h.toDouble(),
        bottom: Sizes.dimen_6.h.toDouble(),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              Sizes.dimen_1.h.toDouble(),
            ),
          ),
          gradient: LinearGradient(
            colors: [
              ThemeColor.violet,
              ThemeColor.royalBlue,
            ],
          )),
    );
  }
}
