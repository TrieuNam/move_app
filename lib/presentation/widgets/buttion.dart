import 'package:flutter/material.dart';
import 'package:move_app/common/extensions/size_extensions.dart';
import 'package:move_app/common/extensions/string_extensions.dart';

import '../../common/constants/size_constants.dart';
import '../themes/theme_color.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ThemeColor.royalBlue,
            ThemeColor.violet,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_20.w.toDouble()),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w.toDouble()),
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h.toDouble()),
      height: Sizes.dimen_16.h.toDouble(),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text.t(context),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}