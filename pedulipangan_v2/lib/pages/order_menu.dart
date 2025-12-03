import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme.dart';
import '../models/menu.dart';
import '../models/cart.dart';

class OrderMenuPage extends StatefulWidget {
  final List<CartItems>? preSelectedItems;

  const OrderMenuPage({super.key, this.preSelectedItems});

  @override
  State<OrderMenuPage> createState() => _OrderMenuPageState();
}

class _OrderMenuPageState extends State<OrderMenuPage> {
  // 0 = Menu, 1 = Day, 2 = Request, 3 = Cutlery, 4 = Confirm
  int _currentStep = 0;

  DateTime _selectedDate = DateTime(2025, 10, 16);
  DailyMenu? _selectedDailyMenu;

  // --- STATE UNTUK STEP 3 (REQUEST) ---
  bool _isSpecialRequest = true; // Default 'Ya' sesuai gambar
  String _selectedFlavor = "Balado"; // Default selection

  String _cutleryOption = "Tidak"; // Default pilihan

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    // Logika inisialisasi data dari keranjang
    if (widget.preSelectedItems != null &&
        widget.preSelectedItems!.isNotEmpty) {
      _selectedDate = widget.preSelectedItems!.first.date;
    }

    _selectedDailyMenu = dummyMenuData.firstWhere(
      (menu) => menu.date.isAtSameMomentAs(_selectedDate),
      orElse:
          () => DailyMenu(
            date: _selectedDate,
            dayName: DateFormat('dd MMMM yyyy').format(_selectedDate),
          ),
    );

    // Sinkronisasi checkbox
    if (widget.preSelectedItems != null) {
      if (_selectedDailyMenu?.lunchOption != null) {
        bool isLunchInCart = widget.preSelectedItems!.any(
          (item) =>
              item.meal.description ==
                  _selectedDailyMenu!.lunchOption!.description &&
              item.date.isAtSameMomentAs(_selectedDate),
        );
        if (isLunchInCart) {
          _selectedDailyMenu = _selectedDailyMenu!.copyWith(
            lunchOption: _selectedDailyMenu!.lunchOption!.copyWith(
              isSelected: true,
            ),
          );
        }
      }
      // logic dinner
      if (_selectedDailyMenu?.dinnerOption != null) {
        bool isDinnerInCart = widget.preSelectedItems!.any(
          (item) =>
              item.meal.description ==
                  _selectedDailyMenu!.dinnerOption!.description &&
              item.date.isAtSameMomentAs(_selectedDate),
        );
        if (isDinnerInCart) {
          _selectedDailyMenu = _selectedDailyMenu!.copyWith(
            dinnerOption: _selectedDailyMenu!.dinnerOption!.copyWith(
              isSelected: true,
            ),
          );
        }
      }
    }
  }

  // --- LOGIC NAVIGATION ---
  void _nextStep() {
    if (_currentStep < 4) {
      setState(() {
        _currentStep++;
      });
    } else {
      print("Order Confirmed!");
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    } else {
      Navigator.pop(context);
    }
  }

  void _finalizeOrder() {
    print("--- ORDER FINALIZED ---");
    print(
      "Tanggal Pengambilan: ${DateFormat('dd MMMM yyyy').format(_selectedDate)}",
    );
    print("Pilihan Menu: $_orderDescription");
    print("Alat Makan: $_cutleryOption");
    print(
      "Permintaan Khusus: ${_isSpecialRequest ? _selectedFlavor : 'Tidak Ada'}",
    );

    // Tampilkan notifikasi atau navigasi ke halaman sukses
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pesanan berhasil dikonfirmasi!'),
        backgroundColor: AppColors.primaryGreen,
      ),
    );

    // Navigasi kembali ke Home (contoh)
    // Navigator.popUntil(context, (route) => route.isFirst);
  }

  // --- WIDGETS STEPPER ---
  Widget _buildStepperIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.background,
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
          _buildStepItem(1, Icons.access_time_filled, "Day"),
          _buildStepItem(2, Icons.inbox, "Request"), // Icon Request
          _buildStepItem(3, Icons.shopping_basket, "Cutlery"),
          _buildStepItem(4, Icons.check_box, "Confirm"),
        ],
      ),
    );
  }

  Widget _buildStepItem(int index, IconData icon, String label) {
    bool isActive = index == _currentStep;
    bool isPassed = index < _currentStep;
    Color color = (isActive || isPassed) ? AppColors.primaryGreen : Colors.grey;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight:
                (isActive || isPassed) ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  // --- Helper: Order Description Getter ---
  String get _orderDescription {
    final lunchSelected = _selectedDailyMenu?.lunchOption?.isSelected ?? false;
    final dinnerSelected =
        _selectedDailyMenu?.dinnerOption?.isSelected ?? false;

    if (lunchSelected && dinnerSelected) {
      return "Weekly Lunch & Dinner";
    } else if (lunchSelected) {
      return "Weekly Lunch";
    } else if (dinnerSelected) {
      return "Weekly Dinner";
    } else {
      return "Tidak Ada Menu Dipilih";
    }
  }

  // ==========================================
  // CONTENT STEP 1: MENU
  // ==========================================
  Widget _buildStep1MenuContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tanggal Pesan",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat('dd MMMM yyyy').format(_selectedDate)),
                const Icon(Icons.calendar_today),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Pilihan Menu",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          _buildMenuItemCard(_selectedDailyMenu?.lunchOption, 0),
          _buildMenuItemCard(_selectedDailyMenu?.dinnerOption, 1),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _nextStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Lanjut",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // CONTENT STEP 2: DAY
  // ==========================================
  Widget _buildStep2DayContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            const Text(
              "Hari Pengambilan",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                const Icon(
                  Icons.check_box_outlined,
                  color: Colors.amber,
                  size: 24,
                ),
                const SizedBox(width: 15),
                Text(
                  DateFormat('EEEE, dd MMMM yyyy').format(_selectedDate),
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.amber, size: 24),
                const SizedBox(width: 15),
                const Text(
                  "12:00 - 13:00",
                  style: TextStyle(fontSize: 14, color: AppColors.textPrimary),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.amber,
                  size: 24,
                ),
                const SizedBox(width: 15),
                const Text(
                  "Kantin Bela Negara",
                  style: TextStyle(fontSize: 14, color: AppColors.textPrimary),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Divider(color: Colors.grey[300], thickness: 1),
            const SizedBox(height: 20),
            _buildNavigationButtons(), // Menggunakan helper button
          ],
        ),
      ),
    );
  }

  // ==========================================
  // CONTENT STEP 3: REQUEST (BARU)
  // ==========================================
  Widget _buildStep3RequestContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            const Text(
              "Apakah memiliki permintaan khusus?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // --- Toggle Button Ya / Tidak ---
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _isSpecialRequest = true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color:
                            _isSpecialRequest ? Colors.blue[50] : Colors.white,
                        border: Border.all(
                          color:
                              _isSpecialRequest
                                  ? AppColors.primaryGreen
                                  : Colors.grey[300]!,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Ya",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                _isSpecialRequest
                                    ? AppColors.textPrimary
                                    : AppColors.textGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _isSpecialRequest = false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color:
                            !_isSpecialRequest ? Colors.blue[50] : Colors.white,
                        border: Border.all(
                          color:
                              !_isSpecialRequest
                                  ? AppColors.primaryGreen
                                  : Colors.grey[300]!,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Tidak",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                !_isSpecialRequest
                                    ? AppColors.textPrimary
                                    : AppColors.textGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),
            Divider(color: Colors.grey[300], thickness: 1),
            const SizedBox(height: 20),

            // --- Request Rasa Section ---
            // Hanya tampil/aktif jika user memilih "Ya"
            Opacity(
              opacity: _isSpecialRequest ? 1.0 : 0.5, // Redupkan jika "Tidak"
              child: IgnorePointer(
                ignoring: !_isSpecialRequest, // Nonaktifkan klik jika "Tidak"
                child: Column(
                  children: [
                    const Text(
                      "Request Rasa",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 15),

                    _buildFlavorOption("Keju"),
                    const SizedBox(height: 10),
                    _buildFlavorOption("Balado"),
                    const SizedBox(height: 10),
                    _buildFlavorOption("Mix"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),
            Divider(color: Colors.grey[300], thickness: 1),
            const SizedBox(height: 20),

            _buildNavigationButtons(), // Tombol Back & Next
          ],
        ),
      ),
    );
  }

  Widget _buildStep4CutleryContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            const Text(
              "Apakah dengan tambahan alat makan?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Keterangan",
              style: TextStyle(fontSize: 14, color: AppColors.textGrey),
            ),
            const SizedBox(height: 25),

            // Card Option 1: Tambah
            _buildCutleryCard(
              label: "Tambah",
              // GANTI Icon INI DENGAN Image.asset JIKA ADA GAMBARNYA
              // child: Image.asset('assets/images/cutlery_yes.png', height: 100),
              child: const Icon(
                Icons.restaurant,
                size: 80,
                color: Colors.black,
              ),
              value: "Tambah",
            ),
            const SizedBox(height: 20),

            // Card Option 2: Tidak
            _buildCutleryCard(
              label: "Tidak",
              // GANTI Icon INI DENGAN Image.asset JIKA ADA GAMBARNYA
              // child: Image.asset('assets/images/cutlery_no.png', height: 100),
              child: Stack(
                alignment: Alignment.center,
                children: const [
                  Icon(Icons.restaurant, size: 80, color: Colors.black),
                  Icon(
                    Icons.block,
                    size: 100,
                    color: Colors.red,
                  ), // Ikon silang merah
                ],
              ),
              value: "Tidak",
            ),

            const SizedBox(height: 25),
            Divider(color: Colors.grey[300], thickness: 1),
            const SizedBox(height: 20),

            _buildNavigationButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons({
    String backText = "Back",
    String nextText = "Next",
    VoidCallback? onNextPressed,
  }) {
    return Row(
      children: [
        // Back Button
        Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: _previousStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC3545), // Merah
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                backText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        // Next Button
        Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: onNextPressed ?? _nextStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen, // Hijau
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                nextText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStep5ConfirmContent() {
    final String orderDate = DateFormat(
      'dd MMM yyyy HH:mm:ss',
    ).format(DateTime.now());
    // Menggunakan waktu tetap 12:41:23 seperti di gambar untuk Tanggal Pengambilan
    final String pickupDate =
        DateFormat('dd MMM yyyy').format(_selectedDate) + ' 12:41:23';

    final String cutleryText =
        _cutleryOption == "Tambah" ? "Ya Pakai" : "Tidak Pakai";
    final String requestText =
        _isSpecialRequest ? "Rasa: $_selectedFlavor" : "Tidak Ada";

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Apakah pesanan sudah sesuai?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),

            // Judul Menu
            Text(
              _orderDescription.contains('Dinner')
                  ? "Weekly Lunch & Dinner"
                  : "Weekly Lunch",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreen,
              ),
            ),
            const SizedBox(height: 15),

            // Detail Pesanan
            _buildDetailRow("Tanggal Pemesanan", orderDate),
            _buildDetailRow("Tanggal Pengambilan", pickupDate),
            _buildDetailRow("Order", _orderDescription),
            _buildDetailRow("Alat Makan", cutleryText),
            _buildDetailRow("Permintaan", requestText),

            const SizedBox(height: 30),

            // Tombol Konfirmasi (Tidak / Ya)
            _buildNavigationButtons(
              backText: "Tidak",
              nextText: "Ya",
              onNextPressed: _finalizeOrder, // Panggil logika finalisasi
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper: Detail Row for Confirmation ---
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130, // Lebar untuk label
            child: Text(
              label,
              style: TextStyle(color: AppColors.textGrey, fontSize: 14),
            ),
          ),
          const Text(
            " : ",
            style: TextStyle(color: AppColors.textGrey, fontSize: 14),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper: Flavor Option Item (Radio Button Lookalike) ---
  Widget _buildFlavorOption(String label) {
    bool isSelected = _selectedFlavor == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFlavor = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white, // Di gambar backgroundnya putih/abu sangat muda
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : Colors.grey[300]!,
          ),
          // Jika ingin efek shadow seperti card:
          // boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.05), spreadRadius: 1, blurRadius: 3)],
        ),
        child: Row(
          children: [
            // Custom Radio Button
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      isSelected ? AppColors.primaryGreen : Colors.grey[400]!,
                  width: 2,
                ),
              ),
              child:
                  isSelected
                      ? Center(
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryGreen,
                          ),
                        ),
                      )
                      : null,
            ),
            const SizedBox(width: 15),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper: Menu Item Card (Step 1) ---
  Widget _buildMenuItemCard(OrderableMealModel? meal, int mealIndex) {
    if (meal == null) return const SizedBox.shrink();
    bool isSelected = meal.isSelected;

    void toggleSelection(bool? newValue) {
      if (_selectedDailyMenu != null) {
        setState(() {
          final newMeal = meal.copyWith(isSelected: newValue);
          if (mealIndex == 0) {
            _selectedDailyMenu = _selectedDailyMenu!.copyWith(
              lunchOption: newMeal,
            );
          } else {
            _selectedDailyMenu = _selectedDailyMenu!.copyWith(
              dinnerOption: newMeal,
            );
          }
        });
      }
    }

    return GestureDetector(
      onTap: () => toggleSelection(!isSelected),
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
            ),
          ],
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Checkbox(
                value: isSelected,
                onChanged: toggleSelection,
                activeColor: AppColors.primaryGreen,
              ),
            ),
            Image.asset(meal.imageUrl!, height: 80, width: 80),
            Text(
              meal.type,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              meal.description,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCutleryCard({
    required String label,
    required Widget child,
    required String value,
  }) {
    bool isSelected = _cutleryOption == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _cutleryOption = value;
        });
      },
      child: Container(
        width: double.infinity,
        height: 200, // Tinggi kartu disesuaikan agar besar seperti desain
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: AppColors.primaryGreen.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ]
                  : [],
        ),
        child: Stack(
          children: [
            // Checkbox di pojok kanan atas
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey[400]!),
                ),
                child:
                    isSelected
                        ? Icon(
                          Icons.check,
                          size: 16,
                          color: AppColors.primaryGreen,
                        )
                        : const SizedBox(width: 16, height: 16),
              ),
            ),

            // Konten Tengah (Gambar/Ikon)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 30.0,
                ), // Beri ruang untuk label bawah
                child: child,
              ),
            ),

            // Label di Bawah
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[50], // Warna background label biru muda
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.blue[100]!),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
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
        title: const Text(
          "Langkah Pemesanan",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: _previousStep,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildStepperIndicator(),
          Expanded(
            child:
                _currentStep == 0
                    ? _buildStep1MenuContent()
                    : _currentStep == 1
                    ? _buildStep2DayContent()
                    : _currentStep == 2
                    ? _buildStep3RequestContent()
                    : _currentStep == 3
                    ? _buildStep4CutleryContent()
                    : _currentStep == 4
                    ? _buildStep5ConfirmContent() // Tampilkan Step 5
                    : const Center(child: Text("Halaman tidak ditemukan")),
          ),
        ],
      ),
    );
  }
}
