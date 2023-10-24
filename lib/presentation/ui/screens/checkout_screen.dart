import 'package:crafty_bay/data/models/payment_method.dart';
import 'package:crafty_bay/presentation/state_holders/create_invoice_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool isCompleted = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Get.find<CreateInvoiceController>().createInvoice().then(
          (value) {
            isCompleted = value;
            if (mounted) {
              setState(() {});
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Check Out',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: GetBuilder<CreateInvoiceController>(
        builder: (createInvoiceController) {
          if (createInvoiceController.invoiceInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!isCompleted) {
            Get.snackbar('Profile is not Completed',
                'Please complete your profile first.');
          }
          return ListView.separated(
            itemCount: createInvoiceController
                    .invoiceCreateResponseModel?.paymentMethod?.length ??
                0,
            itemBuilder: (context, index) {
              final PaymentMethod paymentMethod = createInvoiceController
                  .invoiceCreateResponseModel!.paymentMethod![index];
              return ListTile(
                leading: Image.network(
                  paymentMethod.logo ?? '',
                  width: 55,
                ),
                title: Text(paymentMethod.name ?? ''),
                onTap: () {
                  Get.off(
                    () => WebViewScreen(
                        paymentUrl: paymentMethod.redirectGatewayURL!),
                  );
                },
              );
            },
            separatorBuilder: (_, __) =>
                const Divider(),
          );
        },
      ),
    );
  }
}
