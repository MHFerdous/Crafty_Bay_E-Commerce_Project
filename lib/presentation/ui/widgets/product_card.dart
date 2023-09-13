import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import '../utility/image_assets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.primaryColor.withOpacity(0.2),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: const DecorationImage(
                  image: AssetImage(ImageAssets.phonePng),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  Text(
                    'Infinix Hot 10S',
                    maxLines: 1,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey.shade600,
                        fontSize: 13),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$99',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          Text('4.5',
                              style: TextStyle(
                                color: Colors.blueGrey.shade500,
                              )),
                        ],
                      ),
                      Card(
                        color: AppColors.primaryColor,
                        child: const Padding(
                          padding: EdgeInsets.all(2),
                          child: Icon(
                            Icons.favorite_outline,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
