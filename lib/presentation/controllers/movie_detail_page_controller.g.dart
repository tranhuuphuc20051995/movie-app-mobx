// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieDetailPageController on _MovieDetailPageController, Store {
  late final _$movieDetailAtom =
      Atom(name: '_MovieDetailPageController.movieDetail', context: context);

  @override
  MovieDetailResponse? get movieDetail {
    _$movieDetailAtom.reportRead();
    return super.movieDetail;
  }

  @override
  set movieDetail(MovieDetailResponse? value) {
    _$movieDetailAtom.reportWrite(value, super.movieDetail, () {
      super.movieDetail = value;
    });
  }

  late final _$_MovieDetailPageControllerActionController =
      ActionController(name: '_MovieDetailPageController', context: context);

  @override
  void fetchMovieDetail(int movieId) {
    final _$actionInfo = _$_MovieDetailPageControllerActionController
        .startAction(name: '_MovieDetailPageController.fetchMovieDetail');
    try {
      return super.fetchMovieDetail(movieId);
    } finally {
      _$_MovieDetailPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movieDetail: ${movieDetail}
    ''';
  }
}
