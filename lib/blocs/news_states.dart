import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
@immutable
abstract class NewsState extends Equatable {}
///News loading state
class NewsLoadingState extends NewsState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
///News Loaded state





/// Data Error state