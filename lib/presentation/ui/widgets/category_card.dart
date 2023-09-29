import 'package:crafty_bay/data/models/category_data.dart';
import 'package:flutter/material.dart';
import '../utility/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryData,
  });

  final CategoryData categoryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              categoryData.categoryImg ?? '',
              height: 50,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            categoryData.categoryName ?? '',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
              letterSpacing: 0.4,
            ),
          )
        ],
      ),
    );
  }
}
