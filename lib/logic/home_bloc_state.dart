part of 'home_bloc_bloc.dart';

class HomeBlocState {
  final bool isApiFetching;
  final String? apiResult;

  HomeBlocState({
    required this.isApiFetching,
    this.apiResult,
  });
}

class HomeBlocInitial extends HomeBlocState {
  HomeBlocInitial({required super.isApiFetching});
}
