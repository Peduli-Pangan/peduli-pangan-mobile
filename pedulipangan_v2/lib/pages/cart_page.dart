import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pedulipangan_v2/pages/catering_menu.dart';
import 'package:pedulipangan_v2/pages/order_menu.dart';
import '../theme.dart';
import '../models/cart.dart';
import '../models/menu.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // --- Widget: Tampilan Keranjang Kosong ---
  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ganti dengan Image.asset('assets/images/empty_cart_icon.png')
          Icon(
            Icons.add_shopping_cart,
            size: 100,
            color: Colors.black.withOpacity(0.7),
          ),
          const SizedBox(height: 20),
          const Text(
            "Oops, your cart is empty :(",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 200,
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
                "ORDER NOW",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Widget: Kartu Item Keranjang (Saat Ada Isi) ---
  Widget _buildCartItemCard(CartItems item) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Gambar Menu
            if (item.meal.imageUrl != null)
              Image.asset(
                item.meal.imageUrl!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            const SizedBox(width: 16),
            // Detail Item
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.meal.description,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${item.meal.type} - ${DateFormat('dd MMM yyyy').format(item.date)}",
                    style: const TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            // Kontrol Kuantitas
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: AppColors.textGrey,
                  ),
                  onPressed: () {
                    setState(() {
                      globalCart.decrementItem(item);
                    });
                  },
                ),
                Text(
                  item.quantity.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: AppColors.primaryGreen,
                  ),
                  onPressed: () {
                    setState(() {
                      item.quantity++;
                    });
                  },
                ),
              ],
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
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          "Shopping Cart",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        // Logika: Tampilkan keranjang kosong jika items kosong
        child:
            globalCart.items.isEmpty
                ? _buildEmptyCart()
                : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: globalCart.items.length,
                        itemBuilder: (context, index) {
                          return _buildCartItemCard(globalCart.items[index]);
                        },
                      ),
                    ),
                    // Area Total & Tombol Checkout
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Items:",
                                style: TextStyle(color: AppColors.textGrey),
                              ),
                              Text(
                                globalCart.totalItems.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Lanjut ke Pembayaran...'),
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => OrderMenuPage(
                                        preSelectedItems:
                                            globalCart
                                                .items, // Mengirim data items
                                      ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryGreen,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                            ),
                            child: const Text(
                              "Checkout",
                              style: TextStyle(color: AppColors.background),
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
}
