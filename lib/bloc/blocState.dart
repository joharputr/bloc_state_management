import 'package:flutter/cupertino.dart';

abstract class BlocState {}

class BlocEmpty extends BlocState {}

class BlocError extends BlocState {}

class BlocLoading extends BlocState {}

class BlocLoaded extends BlocState {
  final dynamic data;
  BlocLoaded(@required this.data);
}
