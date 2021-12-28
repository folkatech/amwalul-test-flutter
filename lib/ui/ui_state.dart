import 'package:equatable/equatable.dart';

class UiState<T> extends Equatable {
  const UiState();

  @override
  List<dynamic> get props => [];
}

class Loading<T> extends UiState<T> {}

class Success<T> extends UiState<T> {
  final T data;

  const Success({required this.data});

  @override
  List<dynamic> get props => [data];
}

class Failure<T> extends UiState<T> {
  final String message;

  const Failure({required this.message});

  @override
  List<dynamic> get props => [message];
}