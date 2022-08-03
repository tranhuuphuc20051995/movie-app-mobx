import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/di/di_inject.dart';

void main() {
  mainApp();
}

Future<void> mainApp() async {
  await initDI();
  runApp(const MyApp());
}
