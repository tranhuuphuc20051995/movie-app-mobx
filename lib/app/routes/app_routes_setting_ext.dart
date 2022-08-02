import 'package:flutter/material.dart';
import '../../app/routes/app_routes.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/movie_detail/detail_page.dart';
import '../../presentation/widgets/not_found_page.dart';

extension GenerateRoute on RouteSettings {
  //Define screen for route setting
  PageRoute<void> get generateRoute {
    switch (name) {
      case AppRoute.homePage:
        return _getPageRoute<void>(
          child: const HomePage(),
          routeSettings: this,
        );
      case AppRoute.movieDetailPage:
        return _getPageRoute<void>(
          child: const MovieDetailPage(),
          routeSettings: this,
        );
      default:
        return _getPageRoute<void>(
          child: const NotFoundPage(),
          routeSettings: this,
        );
    }
  }
}

PageRoute<R> _getPageRoute<R>({
  required Widget child,
  RouteSettings? routeSettings,
  bool maintainState = true,
}) =>
    MaterialPageRoute<R>(
      maintainState: maintainState,
      settings: routeSettings,
      builder: (_) => child,
    );
