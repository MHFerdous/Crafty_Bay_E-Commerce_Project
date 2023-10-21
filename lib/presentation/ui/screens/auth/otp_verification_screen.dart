import 'dart:async';
import 'package:crafty_bay/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../state_holders/email_verification_controller.dart';
import '../../utility/app_colors.dart';
import '../../utility/image_assets.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  const OtpVerificationScreen({Key? key, required this.email})
      : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Timer timer;
  int start = 120;
  bool isButtonDisabled = true;

  void startTimer() {
    if (mounted) {
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
  }

  @override
  void initState() {
    startTimer();
    Timer(const Duration(seconds: 120), () {
      isButtonDisabled = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
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
                    height: 26,
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
                    height: 26,
                  ),
                  PinCodeTextField(
                    controller: _otpTEController,
                    length: 6,
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
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter pin code';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<OtpVerificationController>(
                      builder: (otpVerificationController) {
                        {
                          if (otpVerificationController
                              .otpVerificationInProgress) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }
                        return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              verifyOtp(otpVerificationController);
                            }
                          },
                          child: const Text('Next'),
                        );
                      },
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
                  GetBuilder<EmailVerificationController>(
                    builder: (emailVerificationController) {
                      return TextButton(
                        onPressed: isButtonDisabled
                            ? null
                            : () {
                                verifyEmail(emailVerificationController);
                              },
                        style: TextButton.styleFrom(
                            foregroundColor: AppColors.primaryColor,
                            disabledForegroundColor: Colors.grey),
                        child: const Text('Resend Code'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyOtp(
      OtpVerificationController otpVerificationController) async {
    final response = await otpVerificationController.verifyOtp(
      widget.email,
      _otpTEController.text.trim(),
    );
    if (response) {
      Get.snackbar('Successful', 'Welcome to Crafty Bay');

      Get.offAll(
        () => const MainBottomNavScreen(),
      );
    } else {
      Get.snackbar('Failed', 'OTP verification failed, try again.');
    }
  }

  Future<void> verifyEmail(
      EmailVerificationController emailVerificationController) async {
    final response = await emailVerificationController.verifyEmail(
      widget.email,
    );
    if (response) {
      Get.snackbar('Successful', emailVerificationController.message);
      Get.offAll(
        () => OtpVerificationScreen(
          email: widget.email,
        ),
      );
    } else {
      Get.snackbar('Failed', emailVerificationController.message,
          backgroundColor: Colors.red);
    }
  }

  @override
  void dispose() {
    startTimer();
    super.dispose();
  }
}
