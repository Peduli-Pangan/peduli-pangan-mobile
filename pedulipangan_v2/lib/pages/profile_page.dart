import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pedulipangan_v2/pages/catering_menu.dart';
import 'package:pedulipangan_v2/pages/riwayat_pesanan_page.dart';
import 'package:pedulipangan_v2/services/mock_auth_service.dart';
import 'package:pedulipangan_v2/pages/login_page.dart';
import '../theme.dart'; // Asumsikan file theme.dart ada

class ProfilePage extends StatelessWidget {
  // Data dummy untuk simulasi
  final String nama = "Alvin";
  final String phone = "082123456789";
  final String email = "alvin@gmail.com";
  final String dateOfBirth = "10 Feb 2002";
  final bool isPhoneVerified = false; // Simulasi belum terverifikasi
  final bool isEmailVerified = false; // Simulasi sudah terverifikasi

  // Data Transaksi Dummy
  final Map<String, dynamic> latestTransaction = {
    'tanggalPemesanan': DateTime(2025, 9, 2, 9, 41, 23),
    'tanggalMulai': DateTime(2025, 9, 3),
    'invoice': 'ORDER-2507003000085',
    'order': 'Weekly Lunch / Dinner',
    'total': 375850.00,
    'reg': 'YFK SURABAYA',
    'status': 'pending',
  };

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Account",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian 1: Informasi Akun
            _buildAccountInfo(context),
            const SizedBox(height: 30),

            // Bagian 2: Aksi Akun
            _buildAccountActions(context),
            const SizedBox(height: 40),

            // Bagian 3: Riwayat Transaksi Terbaru (7 hari terakhir)
            _buildLatestTransaction(context),
          ],
        ),
      ),
      // Bottom Navigation Bar biasanya ada di widget induk (MainPage/HomePage)
    );
  }

  // --- WIDGET HELPER ---

  Widget _buildAccountInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nama
        _buildInfoRow("Nama", nama, null, null),
        const SizedBox(height: 10),

        // Phone
        _buildInfoRow(
          "Phone",
          phone,
          'Verify',
          isPhoneVerified,
          onTapVerify: () => _handlePhoneVerification(context),
        ),
        const SizedBox(height: 10),

        // Email
        _buildInfoRow(
          "Email",
          email,
          'Verify',
          isEmailVerified,
          onTapVerify: () => _handleEmailVerification(context),
        ),
        const SizedBox(height: 10),

        // Tanggal Lahir
        _buildInfoRow("Date of Birth", dateOfBirth, null, null),
      ],
    );
  }

  Widget _buildInfoRow(
    String label,
    String value,
    String? verifyText,
    bool? isVerified, {
    VoidCallback? onTapVerify,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: Text(label, style: const TextStyle(fontSize: 15)),
        ),
        const Text(" : ", style: TextStyle(fontSize: 15)),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (verifyText != null)
                GestureDetector(
                  onTap: isVerified == false ? onTapVerify : null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isVerified == true
                              ? AppColors.primaryGreen
                              : Colors.lightBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text(
                          isVerified == true ? 'Verified' : verifyText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          isVerified == true ? Icons.check : Icons.create,
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAccountActions(BuildContext context) {
    return Column(
      children: [
        // Tombol Continue Shopping
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CateringMenuPage(),
                    ),
                  ),
                },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Continue Shopping",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        const SizedBox(height: 15),

        // Tombol Log Out
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: () => _handleLogout(context),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.primaryGreen, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Log Out",
              style: TextStyle(color: AppColors.primaryGreen, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLatestTransaction(BuildContext context) {
    // Memastikan total adalah string yang diformat
    String formattedTotal = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 2,
    ).format(latestTransaction['total']);

    // Asumsi: Menampilkan hanya 1 transaksi terbaru sebagai contoh

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Latest Transaction",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),

        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTransactionRow(
                "Tanggal Pemesanan",
                DateFormat(
                  'd MMM yyyy H:mm:ss',
                ).format(latestTransaction['tanggalPemesanan']),
              ),
              _buildTransactionRow(
                "Tanggal Mulai",
                DateFormat(
                  'd MMM yyyy',
                ).format(latestTransaction['tanggalMulai']),
              ),
              _buildTransactionRow("Invoice", latestTransaction['invoice']),
              _buildTransactionRow("Order", latestTransaction['order']),
              _buildTransactionRow("Total", formattedTotal),
              _buildTransactionRow("Reg", latestTransaction['reg']),
              _buildTransactionRow(
                "Status",
                latestTransaction['status'],
                isStatus: true,
              ),

              const SizedBox(height: 20),

              // Tombol See details
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed:
                      () => _handleSeeDetails(
                        context,
                        latestTransaction['invoice'],
                      ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "See details",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Untuk menampilkan riwayat transaksi lengkap 7 hari terakhir,
        // Anda bisa menggunakan ListView.builder atau Column lagi di bawah ini
        // yang mengambil data list dari API.
        const SizedBox(height: 20),
        Center(
          child: TextButton(
            onPressed:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RiwayatPesananPage(),
                    ),
                  ),
                },
            child: const Text(
              "Lihat Semua Riwayat Transaksi",
              style: TextStyle(
                color: AppColors.primaryGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionRow(
    String label,
    String value, {
    bool isStatus = false,
  }) {
    Color statusColor = Colors.black;
    if (isStatus) {
      if (value.toLowerCase() == 'pending') {
        statusColor = Colors.orange;
      } else if (value.toLowerCase() == 'completed') {
        statusColor = AppColors.primaryGreen;
      } else if (value.toLowerCase() == 'cancelled') {
        statusColor = const Color(0xFFDC3545);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(label, style: const TextStyle(fontSize: 14)),
          ),
          const Text(" : ", style: TextStyle(fontSize: 14)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isStatus ? statusColor : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- FUNGSI FUNGSIONALITAS ---

  void _handlePhoneVerification(BuildContext context) {
    // Logic untuk memicu proses verifikasi telepon (misalnya kirim OTP)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Proses Verifikasi Nomor Telepon dimulai...'),
      ),
    );
    // Di sini Anda akan menavigasi ke halaman OTP atau menampilkan dialog verifikasi
  }

  void _handleEmailVerification(BuildContext context) {
    // Logic untuk memicu proses verifikasi email (misalnya kirim link verifikasi)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Proses Verifikasi Email dimulai...')),
    );
  }

  // void _handleContinueShopping(BuildContext context) {
  //   // Logic untuk kembali ke halaman utama atau halaman Catering
  //   Navigator.pushNamed(context, '/home'); // Contoh navigasi
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text('Melanjutkan Belanja...'))
  //   );
  // }

  Future<void> _handleLogout(BuildContext context) async {
    // Logic untuk menghapus token otentikasi dan kembali ke halaman Login
    await MockAuthService().logout();

    if (!context.mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Anda telah Log Out.')));

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  void _handleSeeDetails(BuildContext context, String invoice) {
    // Logic untuk menavigasi ke halaman detail transaksi spesifik
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Melihat detail Invoice: $invoice')));
    // Navigator.pushNamed(context, '/transaction_detail', arguments: invoice);
  }

  void _handleViewAllTransactions(BuildContext context) {
    // Logic untuk menavigasi ke halaman yang menampilkan semua riwayat transaksi
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Menampilkan semua Riwayat Transaksi...')),
    );
    // Navigator.pushNamed(context, '/all_transactions');
  }
}
