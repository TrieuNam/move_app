import 'package:flutter/cupertino.dart';
import 'package:move_app/presentation/app_lacalizations.dart';

extension StringExtension on String {
  String intelliTrim(){
    return this.length > 15 ? '${this.substring(0,15)}...' : this;
  }
  String t(BuildContext context){
    return AppLocalizations.of(context)!.translate(this).toString();
  }
}