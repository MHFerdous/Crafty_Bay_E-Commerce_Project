import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utility/image_assets.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: SvgPicture.asset(
                    ImageAssets.craftyBayLogoSVG,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Complete Profile',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 32),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Get started with us with your details',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 36,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Phone Number',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'City',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Shipping Address',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Complete'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
