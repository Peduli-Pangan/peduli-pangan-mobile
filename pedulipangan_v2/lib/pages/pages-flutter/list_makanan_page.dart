import 'package:flutter/material.dart';
import 'package:pedulipangan_v2/pages/pages-flutter/restaurant_card.dart';

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
                  name: 'Nasi Goreng Mafia, Tebet',
                  imageUrl:
                      'https://images.unsplash.com/photo-1603133872878-684f208fb84b?q=80&w=400&auto=format&fit=crop',
                  rating: 4.7,
                  tags: 'Nasi Goreng, Indonesia',
                  priceRange: '16rb-40rb',
                  distance: '0.8 km',
                  time: '25 min',
                  discount: 'Diskon 40%',
                  originalPrice: 12000,
                  discountedPrice: 3000,
                  isAd: true,
                ),
                RestaurantCard(
                  name: 'Burger King, Cilandak Town Square',
                  imageUrl:
                      'https://images.unsplash.com/photo-1571091718767-18b5b1457add?q=80&w=400&auto=format&fit=crop',
                  rating: 4.9,
                  tags: 'Burger, Fast Food',
                  priceRange: '25rb-80rb',
                  distance: '2.1 km',
                  time: '35 min',
                  discount: 'Diskon 60%',
                  originalPrice: 15000,
                  discountedPrice: 6000,
                ),
                RestaurantCard(
                  name: 'Kopi Kenangan, Pejaten Village',
                  imageUrl:
                      'https://images.unsplash.com/photo-1509042239860-f550ce710b93?q=80&w=400&auto=format&fit=crop',
                  rating: 4.8,
                  tags: 'Kopi, Minuman',
                  priceRange: '18rb-35rb',
                  distance: '1.5 km',
                  time: '20 min',
                  discount: 'Diskon 35%',
                  originalPrice: 10000,
                  discountedPrice: 2000,
                  isClosingSoon: true,
                ),
                RestaurantCard(
                  name: 'Martabak Orins, Kalibata',
                  imageUrl:
                      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=400&auto=format&fit=crop',
                  rating: 4.6,
                  tags: 'Martabak, Jajanan',
                  priceRange: '20rb-100rb',
                  distance: '3.2 km',
                  time: '45 min',
                  originalPrice: 15000,
                  discountedPrice: 5000,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
