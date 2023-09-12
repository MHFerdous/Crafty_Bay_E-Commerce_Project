import 'package:flutter/material.dart';
import '../utility/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.add,
              size: 32,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Electronics',
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
