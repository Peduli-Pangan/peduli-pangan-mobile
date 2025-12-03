import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/restaurant.dart';
import '../models/product.dart';
import 'product_detail_page.dart';

class RestaurantDetailPage extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image (Restaurant Interior/Atmosphere)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 250,
            child: Image.network(
              'https://picsum.photos/800/400', // Placeholder for restaurant background
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey),
            ),
          ),
          
          // Custom App Bar
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const Text(
                  "Detail Restaurant",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black, blurRadius: 2)],
                  ),
                ),
                 CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset("assets/img/logo peduli-pangan-official.png", width: 24, errorBuilder: (c,e,s) => Icon(Icons.store, color: AppColors.primaryGreen)), // Placeholder for brand logo if needed
                ),
              ],
            ),
          ),

          // Main Content Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.75,
            minChildSize: 0.75,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Restaurant Logo & Name
                      Transform.translate(
                        offset: const Offset(0, -60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
                              ),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage("https://picsum.photos/100"), // Placeholder logo
                                // child: Image.asset(restaurant.imageUrl), // Use this if asset exists
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              restaurant.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Address & Rating
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on, color: AppColors.primaryGreen, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              restaurant.address,
                              style: const TextStyle(color: AppColors.textPrimary),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.star, color: Colors.orange, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            restaurant.rating.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Map Section
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey[200],
                          image: const DecorationImage(
                             image: NetworkImage("https://picsum.photos/800/300"), // Placeholder map
                             fit: BoxFit.cover,
                          )
                        ),
                        child: Stack(
                          children: [
                             Center(
                               child: Icon(Icons.location_on, color: Colors.red, size: 40),
                             ),
                             Positioned(
                               bottom: 10,
                               right: 10,
                               child: Container(
                                 padding: EdgeInsets.all(4),
                                 decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                                 child: Icon(Icons.add, size: 20),
                               )
                             )
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Food Available Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Food Available",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Row(
                              children: [
                                Text("See All", style: TextStyle(color: Colors.grey)),
                                Icon(Icons.chevron_right, color: Colors.grey, size: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Food List
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dummyProducts.length,
                        itemBuilder: (context, index) {
                          final product = dummyProducts[index];
                          return _buildFoodItem(context, product);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/200"), // Placeholder
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "Pick up today ",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${product.pickupTimeStart} - ${product.pickupTimeEnd}",
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "${product.quantityLeft} left",
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 16, color: AppColors.primaryGreen),
                      const SizedBox(width: 4),
                      Text(
                        "${product.distance.toInt()}m",
                        style: const TextStyle(fontSize: 12, color: AppColors.primaryGreen),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.money, size: 16, color: AppColors.primaryGreen),
                      const SizedBox(width: 4),
                      Text(
                        "Rp ${product.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
                        style: const TextStyle(fontSize: 12, color: AppColors.primaryGreen, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
             // Leaf Icon
             Container(
               padding: EdgeInsets.all(4),
               decoration: BoxDecoration(
                 color: AppColors.secondaryGreen,
                 shape: BoxShape.circle
               ),
               child: Icon(Icons.eco, color: Colors.white, size: 16),
             )
          ],
        ),
      ),
    );
  }
}
