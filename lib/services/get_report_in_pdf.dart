import 'dart:io';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:permission_handler/permission_handler.dart';

Future<void> getReportInPdf(
    {required List<FinancialTransaction> transactions,
    int? month,
    int? year}) async {
  PermissionStatus status = await Permission.manageExternalStorage.status;

  if (!status.isGranted) {
    await Permission.manageExternalStorage.request();
  }

  if (await Permission.manageExternalStorage.isGranted) {
    final pdf = pw.Document();

    //Font for PDF
    // final fontData = await rootBundle.load("assets/fonts/NotoSans-Regular.ttf");
    // final ttf = pw.Font.ttf(fontData);

    List<String> headers = [
      'Action',
      'Category name',
      ' Discriptions',
      'Amount'
    ];

    final String image = String.fromCharCodes(
        (await rootBundle.load(IconsApp.logoKitty)).buffer.asUint8List());

    pdf.addPage(
      pw.MultiPage(build: (pw.Context context) {
        return [
          pw.Row(
            children: [
              pw.SvgImage(svg: image, width: 40, height: 40.0),
              pw.Text(
                'Kitty',
                style: pw.TextStyle(
                  fontSize: 40,
                ),
              ),
            ],
          ),
          pw.SizedBox(
            height: 8.0,
          ),
          if (month != null && year != null)
            pw.Text(
              'Date: $month.$year',
              style: pw.TextStyle(
                fontSize: 20,
              ),
            )
          else
            pw.Text(
              'All transactions',
              style: pw.TextStyle(
                fontSize: 20,
              ),
            ),
          pw.SizedBox(
            height: 8.0,
          ),
          pw.TableHelper.fromTextArray(
            headers: headers,
            headerStyle: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
            ),
            headerCellDecoration: pw.BoxDecoration(
              color: PdfColors.grey200,
            ),
            cellAlignments: {
              3: pw.Alignment.center,
            },
            rowDecoration: pw.BoxDecoration(
              color: PdfColors.white,
            ),
            oddRowDecoration: pw.BoxDecoration(
              color: PdfColors.grey100,
            ),
            data: transactions.map((trns) {
              final PdfColor financialActionColor =
                  trns.financialAction.name == 'expense'
                      ? PdfColors.red900
                      : PdfColors.green900;

              return [
                pw.Text(trns.financialAction.name,
                    style: pw.TextStyle(color: financialActionColor)),
                pw.Text(
                  trns.category.name,
                ),
                pw.Text(
                  trns.description ?? '',
                ),
                pw.Text(
                  trns.amount.toString(),
                ),
              ];
            }).toList(),
          ),
        ];
      }),
    );

    final String dir = "/storage/emulated/0/Download";
    final File file = File("$dir/transactions.pdf");

    await file.writeAsBytes(await pdf.save());
    await OpenFile.open(file.path);
  } else {
    // ignore: avoid_print
    print("Немає дозволу .");
  }
}
