import 'package:flutter/material.dart';
import '../widgets/coffee_card.dart';
import '../widgets/category_chip.dart';
import '../widgets/food_card.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  final List<Map<String, dynamic>> coffeeList = [
    {
      'name': 'Cappuccino Latte',
      'price': 7000,
      'image': 'assets/images/coffee1.jpg',
      'description': 'Cappuccino dengan busa susu lembut dan rasa seimbang.'
    },
    {
      'name': 'Cappuccino Cokelat',
      'price': 7000,
      'image': 'assets/images/coffee2.jpg',
      'description': 'Espresso dan cokelat dengan cita rasa manis nan lembut.'
    },
    {
      'name': 'Espresso Shot',
      'price': 8000,
      'image': 'assets/images/coffee3.jpg',
      'description': 'Kopi espresso murni yang kuat dan aromatik.'
    },
    {
      'name': 'Mochaccino',
      'price': 7000,
      'image': 'assets/images/coffee4.jpg',
      'description': 'Campuran espresso, cokelat, dan susu panas yang creamy.'
    },
  ];

  final List<Map<String, dynamic>> foodList = [
    {
      'name': 'Croissant',
      'price': 12000,
      'image': 'assets/images/food1.webp',
      'description': 'Roti khas Prancis yang lembut dan buttery.'
    },
    {
      'name': 'Sandwich',
      'price': 14000,
      'image': 'assets/images/food2.jpeg',
      'description': 'Roti isi dengan sayur segar dan daging pilihan.'
    },
    {
      'name': '8000',
      'price': 18,
      'image': 'assets/images/food3.jpg',
      'description': 'Waffle renyah di luar, lembut di dalam.'
    },
    {
      'name': '5000',
      'price': 10,
      'image': 'assets/images/food4.webp',
      'description': 'Donat klasik dengan lapisan gula manis.'
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        color: Colors.grey.shade100,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: [
            // 🏷️ Judul
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 24, color: Colors.black87),
                children: [
                  TextSpan(text: 'Temukan kopi favoritmu\n'),
                  TextSpan(
                    text: 'hanya di ',
                    style: TextStyle(color: Colors.black87),
                  ),
                  TextSpan(
                    text: 'Go Caffee',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari kopi kesukaanmu...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryChip(label: 'Cappuccino', selected: true),
                  CategoryChip(label: 'Espresso'),
                  CategoryChip(label: 'Mochaccino'),
                  CategoryChip(label: 'Non-coffee'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Menu Kopi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 260,
              child: PageView.builder(
                controller: _pageController,
                itemCount: coffeeList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final item = coffeeList[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          name: item['name'],
                          price: item['price'],
                          imagePath: item['image'],
                          description: item['description'],
                        ),
                      ),
                    ),
                    child: CoffeeCard(
                      name: item['name'],
                      price: item['price'],
                      imagePath: item['image'],
                      width: width * 0.7,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 28),

            // 🍰 Daftar Makanan
            const Text(
              'Menu Makanan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 240,
              child: PageView.builder(
                itemCount: foodList.length,
                controller: PageController(viewportFraction: 0.8),
                itemBuilder: (context, index) {
                  final item = foodList[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          name: item['name'],
                          price: item['price'],
                          imagePath: item['image'],
                          description: item['description'],
                        ),
                      ),
                    ),
                    child: FoodCard(
                      name: item['name'],
                      price: item['price'],
                      imagePath: item['image'],
                      width: width * 0.7,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
