import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  final String? name;
  final int? price;
  final String? imagePath;
  final bool isSkeleton;
  final double width;

  const CoffeeCard({
    super.key,
    this.name,
    this.price,
    this.imagePath,
    this.isSkeleton = false,
    this.width = 90, 
  });

  const CoffeeCard.skeleton({super.key})
      : name = null,
        price = null,
        imagePath = null,
        isSkeleton = true,
        width = 110;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: width,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: isSkeleton
          ? _buildSkeleton()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(18)),
                  child: Image.asset(
                    imagePath!,
                    fit: BoxFit.cover,
                    height: 110,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    name!,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[700],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.brown[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    child: Text(
                      "Rp ${price ?? 0}",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.brown[800],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildSkeleton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 110,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18)),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: 14, color: Colors.grey[300]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(height: 12, width: 40, color: Colors.grey[300]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: 20, width: 60, color: Colors.grey[300]),
        ),
      ],
    );
  }
}
