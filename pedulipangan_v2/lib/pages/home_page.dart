import 'package:flutter/material.dart';
import 'package:pedulipangan_v2/pages/catering_menu.dart';
import 'package:pedulipangan_v2/pages/restaurant_detail_page.dart';
import 'package:pedulipangan_v2/models/restaurant.dart';

import '../theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // TODO: Implement authentication check here.
  // Example logic:
  // void checkLoginStatus(BuildContext context) {
  //   final session = Supabase.instance.client.auth.currentSession;
  //   if (session == null) {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const LoginPage()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                "assets/img/logo peduli-pangan-official.png",
                height: 120,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Spacer(),
                //     Image.asset(
                //       'assets/images/logo peduli-pangan-official.png',
                //       height:
                //           120,
                //     ),
                //   ],
                // ),
              ),

              const SizedBox(height: 10),

              // --- SUBTITLE SECTION ---
              const Text(
                "Diet & Healthy Catering",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 40),

              // --- BUTTON SECTION ---
              SizedBox(
                width: 200, // Lebar tombol disesuaikan
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CateringMenuPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    foregroundColor: Colors.white, // Warna teks tombol
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Sudut membulat
                    ),
                  ),
                  child: const Text(
                    "ORDER NOW",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing:
                          1.0, // Memberi jarak antar huruf agar tegas
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              
              // --- TEMPORARY BUTTON FOR RESTAURANT DETAIL ---
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantDetailPage(restaurant: dummyRestaurant),
                      ),
                    );
                  }, 
                  child: const Text("Detail Resto (Dev)"),
                ),
              ),

              const Spacer(), // Penyeimbang bawah
            ],
          ),
        ),
      ),
    );
  }
}
