import 'package:flutter/material.dart';
import 'package:pedulipangan_v2/models/order_history.dart';
import 'package:pedulipangan_v2/theme.dart';
import 'package:intl/intl.dart';

final List<OrderHistoryItem> dummyOrderHistory = [
  OrderHistoryItem(
    invoice: 'ORD-20251126-001',
    orderDescription: 'Weekly Lunch / Dinner (16 Oct)',
    orderDate: DateTime(2025, 11, 26, 10, 30),
    totalAmount: 375850.00,
    status: 'completed',
    reg: 'YFK SURABAYA',
  ),
  OrderHistoryItem(
    invoice: 'ORD-20251125-002',
    orderDescription: 'Weekly Lunch (23 Oct)',
    orderDate: DateTime(2025, 11, 25, 15, 05),
    totalAmount: 180000.00,
    status: 'pending',
    reg: 'YFK SURABAYA',
  ),
  OrderHistoryItem(
    invoice: 'ORD-20251124-003',
    orderDescription: 'Weekly Dinner (30 Oct)',
    orderDate: DateTime(2025, 11, 24, 08, 15),
    totalAmount: 195850.00,
    status: 'cancelled',
    reg: 'YFK JAKARTA',
  ),
];

class RiwayatPesananPage extends StatelessWidget {
  const RiwayatPesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Riwayat Pesanan",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.secondaryGreen,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          // Menggunakan map untuk membuat daftar widget OrderItemCard dari data dummy
          children:
              dummyOrderHistory.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: _buildOrderItemCard(context, item),
                );
              }).toList(),
        ),
      ),
    );
  }

  // --- WIDGET HELPER: KARTU UNTUK SETIAP ITEM PESANAN ---
  Widget _buildOrderItemCard(BuildContext context, OrderHistoryItem item) {
    final formattedTotal = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(item.totalAmount);

    // Tentukan warna status
    Color statusColor;
    switch (item.status.toLowerCase()) {
      case 'completed':
        statusColor = AppColors.primaryGreen;
        break;
      case 'pending':
        statusColor = Colors.orange;
        break;
      case 'cancelled':
        statusColor = const Color(0xFFDC3545); // Merah
        break;
      default:
        statusColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // Pemisah visual yang jelas (menggunakan shadow)
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris 1: Invoice dan Tanggal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Invoice: ${item.invoice}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                DateFormat('dd MMM yyyy, HH:mm').format(item.orderDate),
                style: TextStyle(fontSize: 12, color: AppColors.textGrey),
              ),
            ],
          ),
          const Divider(height: 15), // Pemisah yang lebih jelas
          // Detail Pesanan (seperti tabel/kolom)
          _buildDetailRow("Order", item.orderDescription),
          _buildDetailRow("Reg", item.reg),
          _buildDetailRow("Total", formattedTotal),

          const SizedBox(height: 10),

          // Baris Status dan Tombol Detail
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Status
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item.status.toUpperCase(),
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),

              // Tombol Detail
              SizedBox(
                height: 35,
                child: OutlinedButton(
                  onPressed: () => _handleSeeDetails(context, item.invoice),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primaryGreen),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  child: const Text(
                    "Lihat Detail",
                    style: TextStyle(
                      color: AppColors.primaryGreen,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- WIDGET HELPER: BARIS DETAIL (KEY-VALUE) ---
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80, // Lebar tetap untuk label (seperti kolom tabel)
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
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- FUNGSI Fungsionalitas ---
  void _handleSeeDetails(BuildContext context, String invoice) {
    // Logic untuk menavigasi ke halaman detail transaksi spesifik
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Membuka detail Invoice: $invoice')));
    // Navigator.pushNamed(context, '/order_detail', arguments: invoice);
  }
}
