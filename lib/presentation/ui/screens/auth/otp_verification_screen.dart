import 'dart:async';

import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../utility/app_colors.dart';
import '../../utility/image_assets.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  /*late Timer _timer;
  int _start = 120;

  void startTimer() {
    const onSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      onSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
    if (mounted) {
      startTimer();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }*/

  late Timer timer;
  int start = 120;

  void startTimer() {
    const onSec = Duration(seconds: 1);
    timer = Timer.periodic(
      onSec,
      (timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
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
                  'Enter OTP Code',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 32),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'A 4 Digit OTP Code has been Sent',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 45,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: Colors.grey,
                    selectedColor: AppColors.primaryColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(
                        const CompleteProfileScreen(),
                      );
                    },
                    child: const Text('Next'),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      const TextSpan(text: 'This code will expire in '),
                      TextSpan(
                        text: '$start s',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  child: const Text('Resend Code'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
