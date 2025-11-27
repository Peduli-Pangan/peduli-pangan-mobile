import '../models/cart.dart';
import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/menu.dart'; // Import model data dummy

class CateringMenuPage extends StatefulWidget {
  const CateringMenuPage({super.key});

  @override
  State<CateringMenuPage> createState() => _CateringMenuPageState();
}

class _CateringMenuPageState extends State<CateringMenuPage> {
  final String _batchInfo = "OPEN ORDER BATCH 30";
  final String _dateRange = "28 July 2025 - 3 August 2025";
  final String _countdownText = "4d 15h 42m 28s";
  final String _locationText = "Chosen location";
  final String _locationDetail = "within 5 mi";

  Widget _buildAddToCartButton(OrderableMeal meal, DateTime date) {
    return IconButton(
      icon: Icon(Icons.add_shopping_cart, color: AppColors.primaryGreen),
      onPressed: () {
        // Tambahkan item ke keranjang global
        globalCart.addItem(meal, date);

        // Tampilkan feedback ke pengguna
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${meal.description} ditambahkan ke keranjang.'),
            duration: const Duration(seconds: 1),
            backgroundColor: AppColors.primaryGreen,
          ),
        );
      },
    );
  }

  // --- Helper Widget: Item Menu Harian ---
  Widget _buildDailyMenuItem(DailyMenu menu) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Hari (Tombol Hijau)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              menu.dayName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Menu Lunch
          if (menu.lunchOption != null)
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lunch :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          fontSize: 14,
                        ),
                      ),
                      _buildAddToCartButton(menu.lunchOption!, menu.date),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    menu.lunchOption!.description,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 15),

          // Menu Dinner
          if (menu.dinnerOption != null)
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dinner :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          fontSize: 14,
                        ),
                      ),
                      // Tombol Add to Cart
                      _buildAddToCartButton(menu.dinnerOption!, menu.date),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    menu.dinnerOption!.description,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea digunakan untuk menghindari notch/status bar
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0), // Padding atas yang nyaman
              // --- HEADER SECTION (Persisten) ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _batchInfo,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      _dateRange,
                      style: TextStyle(fontSize: 14, color: AppColors.textGrey),
                    ),
                    const SizedBox(height: 15),

                    // Countdown Waktu
                    Row(
                      children: [
                        const Text(
                          "Close Order In : ",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.primaryGreen,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _countdownText,
                          style: TextStyle(
                            color: AppColors.primaryGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Lokasi
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.primaryGreen,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          _locationText,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.textPrimary,
                        ),
                      ],
                    ),
                    // Detail Lokasi
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        _locationDetail,
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // --- Tombol Kembali ---
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                          ); // Kembali ke halaman CateringPage
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGreen,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Kembali",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // --- Divider ---
              Divider(color: Colors.grey[300], thickness: 1),
              const SizedBox(height: 20),

              // --- DAFTAR MENU HARIAN (Menggunakan List View Builder) ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children:
                      dummyMenuData.map((menu) {
                        return _buildDailyMenuItem(menu);
                      }).toList(),
                ),
              ),
              const SizedBox(height: 100), // Memberi ruang di bawah navbar
            ],
          ),
        ),
      ),
    );
  }
}
