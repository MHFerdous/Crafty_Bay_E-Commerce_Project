import 'package:crafty_bay/data/models/category_data.dart';
import 'package:flutter/material.dart';
import '../utility/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryData,
    required this.onTap,
  });

  final CategoryData categoryData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                categoryData.categoryImg ?? '',
                // height: 10,
              ),
            ),
            const SizedBox(
              height: 0,
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
      ),
    );
  }
}
