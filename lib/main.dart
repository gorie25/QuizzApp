import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quizzmobileapp/pages/my_app.dart';

void main(List<String> args) {
      HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  
}
class MyHttpOverrides extends HttpOverrides{
  @override
 HttpClient createHttpClient(SecurityContext? context) 
 { return super.createHttpClient(context) ..badCertificateCallback =
  (X509Certificate cert, String host, int port) => true; }
}
