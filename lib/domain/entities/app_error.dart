import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final AppErrorType appErrorTyp;

  const AppError(this.appErrorTyp);

  @override
  // TODO: implement props
  List<Object> get props => [appErrorTyp];
}


enum AppErrorType { api, network}