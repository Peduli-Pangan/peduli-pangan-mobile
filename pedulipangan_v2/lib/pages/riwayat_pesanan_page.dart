import 'package:flutter/material.dart';
import 'package:pedulipangan_v2/theme.dart';
import '../theme.dart';

class RiwayatPesananPage extends StatelessWidget {

  const RiwayatPesananPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Riwayat Pesanan", style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}