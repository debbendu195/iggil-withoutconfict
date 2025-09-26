// practice_manager_invoice_controller.dart
import 'package:get/get.dart';
import '../invoice_model/invoice_model.dart';

class InvoiceController extends GetxController {
  final RxList<Invoice> invoiceList = <Invoice>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchInvoices();
  }

  void fetchInvoices() {
    invoiceList.value = [
      Invoice(
        clinic: 'Mdc',
        doctor: 'Imral Gill',
        patientRef: 'MU001',
        returnDate: '10/8/2025',
        amount: '€ 51',
      ),
      Invoice(
        clinic: 'Mdc',
        doctor: 'Imral Gill',
        patientRef: 'MU001',
        returnDate: '10/8/2025',
        amount: '€ 51',
      ),
      Invoice(
        clinic: 'Mdc',
        doctor: 'Imral Gill',
        patientRef: 'MU001',
        returnDate: '10/8/2025',
        amount: '€ 51',
      ),
      Invoice(
        clinic: 'Mdc',
        doctor: 'Imral Gill',
        patientRef: 'MU001',
        returnDate: '10/8/2025',
        amount: '€ 51',
      ),
      Invoice(
        clinic: 'Mdc',
        doctor: 'Imral Gill',
        patientRef: 'MU001',
        returnDate: '10/8/2025',
        amount: '€ 51',
      ),
      Invoice(
        clinic: 'Mdc',
        doctor: 'Imral Gill',
        patientRef: 'MU001',
        returnDate: '10/8/2025',
        amount: '€ 51',
      ),
      Invoice(
        clinic: 'Mdc',
        doctor: 'Imral Gill',
        patientRef: 'MU001',
        returnDate: '10/8/2025',
        amount: '€ 51',
      ),
      Invoice(
        clinic: 'Mdc',
        doctor: 'Imral Gill',
        patientRef: 'MU001',
        returnDate: '10/8/2025',
        amount: '€ 51',
      ),
    ];
  }
}
