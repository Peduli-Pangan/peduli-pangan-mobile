import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // Package untuk lokasi
import 'package:pedulipangan_v2/pages/catering_menu.dart';
import '../theme.dart'; // Pastikan path ini benar

class CateringPage extends StatefulWidget {
  const CateringPage({super.key});

  @override
  State<CateringPage> createState() => _CateringPageState();
}

class _CateringPageState extends State<CateringPage> {
  // State untuk Lokasi
  String _currentLocationText = "Memuat lokasi...";
  String _selectedLocation = "Pilih Lokasi";

  // State untuk Countdown Timer
  late Timer _timer;
  Duration _remainingTime = const Duration();
  final DateTime _closeOrderTime = DateTime(
    2025,
    7,
    31,
    10,
    0,
    0,
  ); // Contoh target waktu

  // Controller untuk Voucher
  final TextEditingController _voucherController = TextEditingController();

  // Daftar Lokasi (Dropdown items)
  final List<String> _locations = [
    "Pilih Lokasi",
    "Lokasi Terkini",
    "Kantor A",
    "Rumah B",
    "Apartemen C",
  ];

  @override
  void initState() {
    super.initState();
    _determinePosition(); // Panggil fungsi lokasi saat inisialisasi
    _startTimer(); // Panggil fungsi countdown
  }

  @override
  void dispose() {
    _timer.cancel();
    _voucherController.dispose();
    super.dispose();
  }

  // --- LOGIC: Lokasi Terkini (GPS) ---
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _currentLocationText = 'Layanan Lokasi dinonaktifkan.';
      setState(() {});
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _currentLocationText = 'Izin lokasi ditolak.';
        setState(() {});
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _currentLocationText = 'Izin lokasi ditolak selamanya.';
      setState(() {});
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      // Simulasikan konversi koordinat ke nama lokasi (biasanya menggunakan geocoding)
      _currentLocationText =
          '(${position.latitude.toStringAsFixed(2)}, ${position.longitude.toStringAsFixed(2)})';
    } catch (e) {
      _currentLocationText = 'Gagal mendapatkan lokasi.';
    }
    setState(() {});
  }

  // --- LOGIC: Countdown Timer ---
  void _startTimer() {
    // Hitung sisa waktu awal
    _remainingTime = _closeOrderTime.difference(DateTime.now());

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime = _closeOrderTime.difference(DateTime.now());
        if (_remainingTime.isNegative) {
          _remainingTime = Duration.zero;
          _timer.cancel();
        }
      });
    });
  }

  // Format Durasi menjadi Dd Hh Mm Ss
  String _formatDuration(Duration d) {
    if (d.inDays > 0) {
      return "${d.inDays}d ${d.inHours.remainder(24)}h ${d.inMinutes.remainder(60)}m ${d.inSeconds.remainder(60)}s";
    }
    return "${d.inHours.remainder(24)}h ${d.inMinutes.remainder(60)}m ${d.inSeconds.remainder(60)}s";
  }

  @override
  Widget build(BuildContext context) {
    // Perlu padding horizontal 24.0 untuk konsistensi, tapi elemen spesifik
    // seperti divider dan footer harus full width

    return Scaffold(
      // Tidak perlu AppBar karena ini adalah Child Widget dari MainWrapper
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0), // Memberi ruang di bawah status bar
              // --- SECTION 1: Header & Countdown ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "OPEN ORDER BATCH 30",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      "28 July 2025 - 3 August 2025",
                      style: TextStyle(fontSize: 14, color: AppColors.textGrey),
                    ),
                    const SizedBox(height: 15),

                    // --- Countdown Waktu ---
                    Row(
                      children: [
                        Text(
                          "Close Order In :",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.primaryGreen,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatDuration(_remainingTime),
                          style: TextStyle(
                            color: AppColors.primaryGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // --- Dropdown Lokasi ---
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.primaryGreen,
                          size: 20,
                        ),
                        const SizedBox(width: 5),

                        // Dropdown Lokasi
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedLocation,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedLocation = newValue!;
                                // Jika memilih 'Lokasi Terkini', update state teks
                                if (newValue == "Lokasi Terkini") {
                                  _currentLocationText = "Memuat lokasi...";
                                  _determinePosition();
                                }
                              });
                            },
                            items:
                                _locations.map<DropdownMenuItem<String>>((
                                  String value,
                                ) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                          ),
                        ),
                      ],
                    ),
                    // Teks lokasi terkini (within 5 mi)
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        _selectedLocation == "Lokasi Terkini"
                            ? "Jarak: within 5 mi (GPS: $_currentLocationText)"
                            : "Jarak: within 5 mi (Fixed)",
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // --- Tombol Lihat Menu Minggu Depan ---
                    SizedBox(
                      width: double.infinity,
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
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Lihat Menu Minggu Depan",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),

              // --- SECTION 2: Divider ---
              Divider(color: Colors.grey[300], thickness: 1),
              const SizedBox(height: 20),

              // --- SECTION 3: Peduli Pangan Package & Voucher ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Peduli Pangan Package",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // --- Form Kode Voucher ---
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _voucherController,
                            decoration: InputDecoration(
                              hintText: "Masukkan kode voucher jika ada",
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              print(
                                "Kode Voucher Applied: ${_voucherController.text}",
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Voucher ${_voucherController.text} diterapkan.',
                                  ),
                                ),
                              );
                              // Logika API untuk memvalidasi voucher di sini
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryGreen,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                            ),
                            child: const Text("Apply"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Tambahkan konten Package di sini (e.g., GridView/ListView)
              const SizedBox(height: 100), // Memberi ruang di bawah
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(height: 0),
    );
  }
}
