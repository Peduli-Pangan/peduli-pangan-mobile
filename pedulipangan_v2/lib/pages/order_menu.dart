import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk format tanggal
import '../theme.dart';
import '../models/menu.dart'; // Import model data dummy

class OrderMenuPage extends StatefulWidget {
  const OrderMenuPage({super.key});

  @override
  State<OrderMenuPage> createState() => _OrderMenuPageState();
}

class _OrderMenuPageState extends State<OrderMenuPage> {
  // State untuk Stepper
  int _currentStep = 0; // 0=Menu, 1=Day, 2=Request, 3=Cutlery, 4=Confirm

  // State untuk Pemilihan Tanggal
  DateTime _selectedDate = DateTime(
    2025,
    10,
    16,
  ); // Tanggal default dari desain
  DailyMenu? _selectedDailyMenu; // Menu harian yang dipilih berdasarkan tanggal

  @override
  void initState() {
    super.initState();
    // Inisialisasi menu default berdasarkan tanggal terpilih
    _selectedDailyMenu = dummyMenuData.firstWhere(
      (menu) => menu.date.isAtSameMomentAs(_selectedDate),
      orElse:
          () => DailyMenu(
            date: _selectedDate,
            dayName: DateFormat('dd MM yyyy').format(_selectedDate),
          ), // Fallback jika tanggal tidak ditemukan
    );
  }

  // --- Logic: Date Picker ---
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryGreen, // Warna header date picker
              onPrimary: Colors.white, // Warna teks di header date picker
              onSurface: AppColors.textPrimary, // Warna teks tanggal
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    AppColors.primaryGreen, // Warna tombol (OK, CANCEL)
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // Update menu harian berdasarkan tanggal baru
        _selectedDailyMenu = dummyMenuData.firstWhere(
          (menu) => menu.date.isAtSameMomentAs(_selectedDate),
          orElse:
              () => DailyMenu(
                date: picked,
                dayName: DateFormat('dd MMMM yyyy').format(picked),
                lunchOption: null,
                dinnerOption: null,
              ), // Jika tidak ada menu, buat dummy kosong
        );
        // Reset pilihan menu spesifik
        _selectedDailyMenu?.lunchOption?.copyWith(isSelected: false);
        _selectedDailyMenu?.dinnerOption?.copyWith(isSelected: false);
      });
    }
  }

  // --- Widget: Progress Stepper di Atas ---
  Widget _buildStepperIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.background, // Warna latar belakang sesuai desain
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStepItem(0, Icons.list_alt, "Menu"),
          _buildStepItem(1, Icons.calendar_today, "Day"),
          _buildStepItem(2, Icons.sticky_note_2_outlined, "Request"),
          _buildStepItem(3, Icons.restaurant_menu, "Cutlery"),
          _buildStepItem(4, Icons.check_circle_outline, "Confirm"),
        ],
      ),
    );
  }

  Widget _buildStepItem(int index, IconData icon, String label) {
    bool isActive = index == _currentStep;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryGreen : Colors.grey[400],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? AppColors.primaryGreen : AppColors.textGrey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  // --- Widget: Item Pilihan Menu (Lunch/Dinner) ---
  Widget _buildMenuItemCard(OrderableMeal? meal, int mealIndex) {
    if (meal == null)
      return const SizedBox.shrink(); // Jangan tampilkan jika tidak ada menu

    bool isSelected =
        meal.isSelected; // Mengambil status pilihan dari objek meal

    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedDailyMenu != null) {
            if (mealIndex == 0) {
              // LUNCH
              _selectedDailyMenu = _selectedDailyMenu!.copyWith(
                lunchOption: _selectedDailyMenu!.lunchOption!.copyWith(
                  isSelected: !_selectedDailyMenu!.lunchOption!.isSelected,
                ),
              );
            } else {
              // DINNER
              _selectedDailyMenu = _selectedDailyMenu!.copyWith(
                dinnerOption: _selectedDailyMenu!.dinnerOption!.copyWith(
                  isSelected: !_selectedDailyMenu!.dinnerOption!.isSelected,
                ),
              );
            }
          }
        });
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Checkbox(
                value: isSelected,
                onChanged: (bool? newValue) {
                  setState(() {
                    if (_selectedDailyMenu != null) {
                      if (mealIndex == 0) {
                        // Lunch
                        _selectedDailyMenu = _selectedDailyMenu!.copyWith(
                          lunchOption: _selectedDailyMenu!.lunchOption!
                              .copyWith(
                                isSelected:
                                    !_selectedDailyMenu!
                                        .lunchOption!
                                        .isSelected,
                              ),
                        );
                      } else {
                        // Dinner
                        _selectedDailyMenu = _selectedDailyMenu!.copyWith(
                          dinnerOption: _selectedDailyMenu!.lunchOption!
                              .copyWith(
                                isSelected:
                                    !_selectedDailyMenu!
                                        .lunchOption!
                                        .isSelected,
                              ),
                        );
                      }
                    }
                  });
                },
                activeColor: AppColors.primaryGreen,
              ),
            ),
            Image.asset(
              meal.imageUrl ?? "", // Aset gambar matahari/bulan
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 10),
            Text(
              meal.type,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              meal.description,
              style: TextStyle(fontSize: 14, color: AppColors.textGrey),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background, // Match scaffold background
        elevation: 0, // No shadow for AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: Text(
          "Langkah Pemesanan",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Stepper Indicator
          _buildStepperIndicator(),

          // Konten Utama Halaman
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Section Tanggal Pesan ---
                  Text(
                    "Tanggal Pesan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Silahkan pilih tanggal",
                    style: TextStyle(fontSize: 14, color: AppColors.textGrey),
                  ),
                  const SizedBox(height: 15),

                  // Pemilih Tanggal
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[300]!),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('dd MMMM yyyy').format(_selectedDate),
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Icon(
                            Icons.calendar_today,
                            color: AppColors.textGrey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // --- Section Pilihan Menu ---
                  Text(
                    "Pilihan Menu",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Silahkan pilih menu",
                    style: TextStyle(fontSize: 14, color: AppColors.textGrey),
                  ),
                  const SizedBox(height: 15),

                  // Kartu Pilihan Menu (Lunch)
                  _buildMenuItemCard(_selectedDailyMenu?.lunchOption, 0),

                  // Kartu Pilihan Menu (Dinner) - disembunyikan jika tidak ada di desain
                  // Namun jika ingin ada, aktifkan ini
                  _buildMenuItemCard(_selectedDailyMenu?.dinnerOption, 1),
                  // Jika ingin menambahkan tombol "Next" atau "Lanjut", letakkan di sini
                ],
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar akan dikelola oleh MainWrapper
      bottomNavigationBar: Container(height: 0),
    );
  }
}
