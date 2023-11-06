import 'package:crafty_bay/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../state_holders/auth_controller.dart';
import '../utility/image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoNextScreen();
  }

  Future<void> gotoNextScreen() async {
    await AuthController.getAccessToken();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Get.offAll(
          () => AuthController.isLoggedIn
              ? const MainBottomNavScreen()
              : const EmailVerificationScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: SvgPicture.asset(
              ImageAssets.craftyBayLogoSVG,
              width: 100,
            ),
          ),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 8,
          ),
          const Text('Version 1.0.0'),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
