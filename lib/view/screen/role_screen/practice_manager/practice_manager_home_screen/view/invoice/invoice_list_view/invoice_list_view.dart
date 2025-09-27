import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../invoice_controller/invoice_controller.dart';
import '../invoice_model/invoice_model.dart';
import 'invoice_dialog.dart';

class PracticeManagerInvoiceListView extends StatelessWidget {
  PracticeManagerInvoiceListView({super.key});

  final InvoiceController controller = Get.put(InvoiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRoyelAppbar(
        leftIcon: true,
        titleName: 'Invoice',
        color: AppColors.primary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔍 Search Field
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by Patient ID or Case No.',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),

          // 📋 Invoice List Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Invoice List',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 📑 Invoice List
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: controller.invoiceList.length,
                itemBuilder: (context, index) {
                  final invoice = controller.invoiceList[index];
                  return InvoiceItem(invoice: invoice);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= INVOICE ITEM =================
class InvoiceItem extends StatelessWidget {
  final Invoice invoice;

  const InvoiceItem({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
      decoration: BoxDecoration(

        border: Border(
            top:BorderSide(color:Colors.black),
            right: BorderSide(color:Colors.black),
            left: BorderSide(color:Colors.black),

        ),


        // border: Border.all(color: AppColors.black),
      ),
      child: Card(
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 🔹 First Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _buildDetailColumn(context, 'Clinic', invoice.clinic)),
                  Expanded(child: _buildDetailColumn(context, 'Doctor', invoice.doctor)),
                  Expanded(child: _buildDetailColumn(context, 'Patient Ref', invoice.patientRef)),
                ],
              ),

              const Divider(color: Colors.black12, thickness: 1),

              // 🔹 Second Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _buildDetailColumn(context, 'Return Date', invoice.returnDate)),
                  Expanded(child: _buildDetailColumn(context, 'Invoice', '', icon: Icons.description)),
                  Expanded(child: _buildDetailColumn(context, 'Amount', invoice.amount)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= COLUMN BUILDER =================
  Widget _buildDetailColumn(
      BuildContext context,
      String title,
      String value, {
        IconData? icon,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),

        // 👇 If icon present => clickable popup
        if (icon != null)
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Invoice_dialog_Screen();
                },
              );
            },
            child: Icon(icon, color: Colors.blue),
          )
        else
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
      ],
    );
  }
}
