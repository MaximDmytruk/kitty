import 'dart:io';
import 'package:flutter/services.dart' show Uint8List, rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> generatePDF() async {
  PermissionStatus status = await Permission.manageExternalStorage.status;
  if (!status.isGranted) {
    await Permission.manageExternalStorage.request();
  }

  if (await Permission.manageExternalStorage.isGranted) {
    final pdf = pw.Document();

    final fontData = await rootBundle.load("assets/fonts/NotoSans-Regular.ttf");
    final ttf = pw.Font.ttf(fontData);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            // child: pw.Text(
            //   "HELOOOOOOOO",
            //   style: pw.TextStyle(font: ttf, fontSize: 40),
            // ),
          );
        },
      ),
    );

    final String dir = "/storage/emulated/0/Download";
    final File file = File("$dir/transactions2.pdf");

    await file.writeAsBytes(await pdf.save());
    print('PDF saved: ${file.path}');

    final result = await OpenFile.open(file.path);
    print('OpenFile result: ${result.message}');
  } else {
    print("Немає дозволу .");
  }
}
