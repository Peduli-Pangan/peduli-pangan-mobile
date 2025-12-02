import 'package:flutter/material.dart';
import 'package:pedulipangan_v2/pages/main_wrapper.dart';
import 'package:pedulipangan_v2/theme.dart';
import './pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://kttusitwmhdpnjwtqfgn.supabase.co',
    anonKey: 'sb_publishable_l7bUvCpymXmhQj3VEYd3rg_1S8iU42Q',
  );
  runApp(MyApp());
}
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peduli Pangan',
      theme: ThemeData(
        primaryColor: AppColors.primaryGreen,
        scaffoldBackgroundColor: AppColors.background,
        // Kita gunakan font default dulu, nanti bisa diganti Google Fonts (Poppins)
        fontFamily: 'Inter',
      ),
      // Routing dimulai dari MainWrapper
      home: const MainWrapper(),
    );
  }
}
