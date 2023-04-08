import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
@immutable
abstract class NewsEvent extends Equatable {
  const NewsEvent();
}
class LoadNewsEvent extends NewsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}