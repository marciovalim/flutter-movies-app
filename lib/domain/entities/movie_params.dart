import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class MovieParams extends Equatable {
  final int id;

  const MovieParams(this.id);

  @override
  List<Object> get props => [id];
}
