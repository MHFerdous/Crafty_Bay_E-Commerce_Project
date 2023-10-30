import 'package:crafty_bay/data/models/invoice_create_response_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class CreateInvoiceController extends GetxController {
  bool _invoiceInProgress = false;
  String _message = '';
  InvoiceCreateResponseModel _invoiceCreateResponseModel =
      InvoiceCreateResponseModel();

  bool get invoiceInProgress => _invoiceInProgress;
  String get message => _message;
  InvoiceCreateResponseData? get invoiceCreateResponseModel =>
      _invoiceCreateResponseModel.data?.first;

  Future<bool> createInvoice() async {
    _invoiceInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.createInvoice);
    _invoiceInProgress = false;
    update();
    if (response.isSuccess && response.responseJson!['msg'] == 'success') {
      _invoiceCreateResponseModel =
          InvoiceCreateResponseModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = 'Failed to create invoice! Try again';
      return false;
    }
  }
}
