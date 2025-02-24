import 'dart:io';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:permission_handler/permission_handler.dart';

Future<void> getReportInPdf({
  required List<FinancialTransaction> transactions,
  int? month,
  int? year
}) async {
  PermissionStatus status = await Permission.manageExternalStorage.status;

  if (!status.isGranted) {
    await Permission.manageExternalStorage.request();
  }

  if (await Permission.manageExternalStorage.isGranted) {
    final pdf = pw.Document();

    //Font for PDF
    final fontData = await rootBundle.load("assets/fonts/NotoSans-Regular.ttf");
    final ttf = pw.Font.ttf(fontData);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            month != null
                ? pw.Text(
                    'Month - $month',
                    style: pw.TextStyle(
                      fontSize: 32,
                      font: ttf,
                    ),
                  )
                : pw.Text(
                    'All Transactions',
                    style: pw.TextStyle(
                      fontSize: 32,
                      font: ttf,
                    ),
                  ),
            pw.SizedBox(height: 10),
            ...transactions.map((trns) {
              String nameCategory = trns.category.name;
              String? discriptions = trns.description;
              String amount = trns.amount.toString();
              String financialAction = trns.financialAction.name;
              return pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    financialAction,
                    style: pw.TextStyle(
                      font: ttf,
                    ),
                  ),
                  pw.Text(
                    discriptions ?? 'Without discriptions',
                    style: pw.TextStyle(
                      font: ttf,
                    ),
                  ),
                  pw.Text(
                    nameCategory,
                    style: pw.TextStyle(
                      font: ttf,
                    ),
                  ),
                  pw.Text(
                    amount,
                    style: pw.TextStyle(
                      font: ttf,
                    ),
                  ),
                ],
              );
            }),
          ];
        },
      ),
    );

    // pdf.addPage(
    //   pw.Page(
    //     pageFormat: PdfPageFormat.a4,
    //     build: (pw.Context context) {
    //       return pw.ListView.builder(
    //         spacing: 8.0,
    //         itemCount: transactions.length,
    //         itemBuilder: (context, index) {
    //           String nameCategory = transactions[index].category.name;
    //           String? discriptions = transactions[index].description;
    //           String amount = transactions[index].amount.toString();
    //           String financialAction = transactions[index].financialAction.name;
    //           return pw.Row(
    //             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    //             children: [
    //               pw.Text(
    //                 financialAction,
    //                 style: pw.TextStyle(
    //                   font: ttf,
    //                 ),
    //               ),
    //               pw.Text(
    //                 discriptions ?? 'Without discriptions',
    //                 style: pw.TextStyle(
    //                   font: ttf,
    //                 ),
    //               ),
    //               pw.Text(
    //                 nameCategory,
    //                 style: pw.TextStyle(
    //                   font: ttf,
    //                 ),
    //               ),
    //               pw.Text(
    //                 amount,
    //                 style: pw.TextStyle(
    //                   font: ttf,
    //                 ),
    //               ),
    //             ],
    //           );
    //         },
    //       );
    //     },
    //   ),
    // );

    final String dir = "/storage/emulated/0/Download";
    final File file = File("$dir/transactions3.pdf");

    await file.writeAsBytes(await pdf.save());
    print('PDF saved: ${file.path}');

    final result = await OpenFile.open(file.path);
    print('OpenFile result: ${result.message}');
  } else {
    print("Немає дозволу .");
  }
}
