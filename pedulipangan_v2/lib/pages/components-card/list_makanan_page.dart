import 'package:flutter/material.dart';
import 'package:pedulipangan_v2/pages/components-card/restaurant_card.dart';

class ListMakananPage extends StatefulWidget {
  const ListMakananPage({super.key});

  @override
  State<ListMakananPage> createState() => _ListMakananPageState();
}

class _ListMakananPageState extends State<ListMakananPage> {
  final List<String> _filters = [
    'Terdekat',
    'Paling Laris',
    'Rating 4.5+',
    'Promo',
    '24 Jam',
  ];

  int _selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Aneka kuliner menarik',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: List.generate(_filters.length, (index) {
                final isSelected = _selectedFilterIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(
                      _filters[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedFilterIndex = index;
                      });
                    },
                    backgroundColor: Colors.white,
                    selectedColor: const Color(0xFF00880C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color:
                            isSelected
                                ? Colors.transparent
                                : Colors.grey.shade300,
                      ),
                    ),
                    showCheckmark: false,
                  ),
                );
              }),
            ),
          ),

          // Restaurant List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                RestaurantCard(
                  name: 'Raja Geprek Arjuna, Lidah Wetan',
                  imageUrl:
                      'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=200&q=80',
                  rating: 4.5,
                  ratingCount: '500+ ratings',
                  tags: '30rb-40rb • Aneka nasi, Ayam & bebek',
                  deliveryInfo: '20-30 min • Ongkir 18.3rb',
                  originalDeliveryFee: '29.3rb',
                  discount: 'Diskon 45%, maks. 117rb',
                  isAd: true,
                ),
                RestaurantCard(
                  name: 'Moon Chicken (Hangry Fried Chicken)',
                  imageUrl:
                      'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=200&q=80',
                  rating: 4.9,
                  ratingCount: '100+ ratings',
                  tags: '45rb-55rb • Ayam & bebek, Aneka nasi',
                  deliveryInfo: '20-30 min • Ongkir 11.8rb',
                  originalDeliveryFee: '22.8rb',
                  discount: 'Diskon 44%, maks. 171rb',
                  isClosingSoon: true,
                  closingTime: '13 min',
                  isAd: true,
                ),
                RestaurantCard(
                  name: 'McDonald\'s, Wiyung Surabaya',
                  imageUrl:
                      'https://images.unsplash.com/photo-1550547660-d9450f859349?w=200&q=80',
                  rating: 4.8,
                  ratingCount: '51rb+ ratings',
                  tags: '40rb-50rb • Cepat saji, Sweets, Jajanan',
                  deliveryInfo: '20-30 min • Ongkir 13.1rb',
                  originalDeliveryFee: '24.1rb',
                  discount: 'Diskon ongkir s.d. 11rb',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
