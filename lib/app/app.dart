import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app/routes/app_routes.dart';
import '../app/routes/app_routes_setting_ext.dart';
import '../presentation/widgets/not_found_page.dart';
import '../presentation/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// support portrait orientation.
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.homePage,
      onGenerateRoute: (RouteSettings settings) => settings.generateRoute,
      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => const NotFoundPage()),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
