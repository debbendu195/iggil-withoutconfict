// invoice_model.dart

class Invoice {
  final String clinic;
  final String doctor;
  final String patientRef;
  final String returnDate;
  final String amount;

  Invoice({
    required this.clinic,
    required this.doctor,
    required this.patientRef,
    required this.returnDate,
    required this.amount,
  });
}