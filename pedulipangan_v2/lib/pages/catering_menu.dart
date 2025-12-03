import '../models/cart.dart';
import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/menu.dart'; // Import model data dummy
import 'product_detail_page.dart';

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

  // --- Helper Widget: Kartu Menu Makanan ---
  Widget _buildMealCard(OrderableMealModel meal, DateTime date) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(meal: meal, date: date),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Makanan
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child:
                  meal.imageUrl != null && meal.imageUrl!.isNotEmpty
                      ? Image.network(
                        meal.imageUrl!,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/img/logo peduli-pangan-official.png',
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                      : Image.asset(
                        'assets/img/logo peduli-pangan-official.png',
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meal.type, // "Lunch" or "Dinner"
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          meal.description,
                          style: const TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 12,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Action Button (Add)
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.primaryGreen,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Tambahkan item ke keranjang global
                        globalCart.addItem(meal, date);

                        // Tampilkan feedback ke pengguna
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${meal.description} ditambahkan ke keranjang.',
                            ),
                            duration: const Duration(seconds: 1),
                            backgroundColor: AppColors.primaryGreen,
                          ),
                        );
                      },
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.all(8),
                      iconSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
            _buildMealCard(menu.lunchOption!, menu.date),

          // Menu Dinner
          if (menu.dinnerOption != null)
            _buildMealCard(menu.dinnerOption!, menu.date),
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