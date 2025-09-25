import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../components/custom_show_popup/custom_show_popup.dart';
import '../invoice_controller/invoice_controller.dart';
import '../invoice_model/invoice_model.dart';

class InvoiceListView extends StatelessWidget {
  InvoiceListView({super.key});

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

          // ===============================

          const SizedBox(height: 10),
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

// widgets section ==================]]===============================================

class InvoiceItem extends StatelessWidget {
  final Invoice invoice;

  const InvoiceItem({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: .5, vertical: 0),
        shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.only(topLeft: Radius.circular(55)),
            ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDetailColumn('Clinic', invoice.clinic),
                  _buildDetailColumn('Doctor', invoice.doctor),
                  _buildDetailColumn('Patient Rfe', invoice.patientRef),
                ],
              ),
              const Divider(height: 20, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDetailColumn('Return Date', invoice.returnDate),
                  _buildDetailColumn('Invoice', '', icon: Icons.description),
                  _buildDetailColumn('Amount', invoice.amount),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailColumn(String title, String value, {IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        if (icon != null)
          InkWell(
            onTap: () {
              showDialog(
                context: Get.context!,
                builder: (context) {
                  return CustomShowDialog(title: 'Show just', discription: 'ewrtwesrt',)  ;
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
