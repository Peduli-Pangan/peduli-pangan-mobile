import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'components/pickup_status_card.dart';
import 'components/location_section.dart';
import 'components/menu_item_card.dart';
import 'components/recommendations_section.dart';
import 'components/need_anything_else_card.dart';
import 'components/payment_summary_card.dart';
import 'components/sticky_footer.dart';

class TransaksiPickupPage extends StatefulWidget {
  const TransaksiPickupPage({super.key});

  @override
  State<TransaksiPickupPage> createState() => _TransaksiPickupPageState();
}

class _TransaksiPickupPageState extends State<TransaksiPickupPage> {
  int quantity = 1;
  final double basePrice = 33500;
  final double packagingFee = 4000;

  String formatIDR(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: '',
      decimalDigits: 0,
    );
    return formatter.format(amount).trim();
  }

  void updateQty(int change) {
    if (quantity + change < 1) return;
    setState(() {
      quantity += change;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6), // #f3f4f6
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 100,
                  ), // Space for footer
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PickupStatusCard(),
                      const LocationSection(),
                      MenuItemCard(
                        quantity: quantity,
                        basePrice: basePrice,
                        onUpdateQty: updateQty,
                        formatIDR: formatIDR(basePrice),
                      ),
                      const RecommendationsSection(),
                      const NeedAnythingElseCard(),
                      PaymentSummaryCard(
                        quantity: quantity,
                        basePrice: basePrice,
                        packagingFee: packagingFee,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: const StickyFooter(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Colors.black54),
          ),
          const SizedBox(width: 16),
          const Text(
            "McDonald's, Rungkut",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937), // text-gray-800
            ),
          ),
        ],
      ),
    );
  }
}
