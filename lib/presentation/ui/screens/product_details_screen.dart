import 'package:flutter/material.dart';
import '../widgets/home/product_image_slider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                const ProductImageSlider(),
                AppBar(
                  leading: const BackButton(
                    color: Colors.black,
                  ),
                  title: Text(
                    'Product Details',
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
