import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crafty_bay/application/state_holder_binder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../presentation/ui/screens/splash_screen.dart';
import '../presentation/ui/utility/app_colors.dart';

class CraftyBay extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  const CraftyBay({Key? key}) : super(key: key);

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  late final StreamSubscription _connectivityStatusStream;

  @override
  void initState() {
    checkInitialInternetConnection();
    checkInternetConnectivityStatus();
    super.initState();
  }

  Future<void> checkInitialInternetConnection() async {
    final result = await Connectivity().checkConnectivity();
    handleConnectivityStatus(result);
  }

  void checkInternetConnectivityStatus() {
    _connectivityStatusStream = Connectivity().onConnectivityChanged.listen(
      (status) {
        handleConnectivityStatus(status);
      },
    );
  }

  void handleConnectivityStatus(ConnectivityResult status) {
    if (status != ConnectivityResult.mobile &&
        status != ConnectivityResult.wifi) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'No Internet',
          message: 'Please check your internet connection',
          backgroundColor: Colors.red,
        ),
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeAllSnackbars();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftyBay.globalKey,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialBinding: StateHolderBinder(),
      theme: ThemeData(
        primarySwatch:
            MaterialColor(AppColors.primaryColor.value, AppColors().color),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            textStyle: const TextStyle(
              fontSize: 18,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          disabledBorder: OutlineInputBorder(),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch:
            MaterialColor(AppColors.primaryColor.value, AppColors().color),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            textStyle: const TextStyle(
              fontSize: 18,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          disabledBorder: OutlineInputBorder(),
        ),
      ),
      themeMode: ThemeMode.light,
    );
  }

  @override
  void dispose() {
    _connectivityStatusStream.cancel();
    super.dispose();
  }
}
