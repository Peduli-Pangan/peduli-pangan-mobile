import 'package:flutter/material.dart';
import 'package:pedulipangan_v2/pages/main_wrapper.dart';
import 'package:pedulipangan_v2/theme.dart';
import './pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peduli Pangan',
      theme: appTheme,
      // Routing dimulai dari MainWrapper
      home: const MainWrapper(),
    );
  }
}