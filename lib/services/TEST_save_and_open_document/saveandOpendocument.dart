import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class SaveAndOpenDocument {
  static Future<File> savePdf({
    required String name,
    required pw.Document pdf,
  }) async {
    final dir = Platform.isAndroid // ЗАМІСТЬ ROOT
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    final root = "/storage/emulated/0/Download";

    final file = File('${root}/$name');
    await file.writeAsBytes(await pdf.save());
    print('${root}/$name');
    return file;
  }

  static Future<void> openPdf(File file) async {
    final path = file.path;

//    
//     if (await file.exists()) {
//       print('Файл збережено успішно: ${file.path}');
//       await Future.delayed(Duration(seconds: 1));
//       // OpenFile.open(file.path);
//       final result = await OpenFile.open(file.path);
// print('результат  файлу: ${result.message}');
//     } else {
//       print('Не вдалося зберегти файл.');
//     }

    await OpenFile.open(path);
  }
}

class SimplePdfApi {
  static Future<File> generateSimpleTextPdf(
    String text,
    String text2,
  ) async {
    final pdf = pw.Document();

    final fontData = await rootBundle.load("assets/fonts/NotoSans-Regular.ttf");
    final ttf = pw.Font.ttf(fontData);

    pdf.addPage(
      pw.Page(
        build: (_) => pw.Center(
          child: pw.Text(
            text,
            style: pw.TextStyle(fontSize: 48, font: ttf),
          ),
        ),
      ),
    );

    return SaveAndOpenDocument.savePdf(name: 'simple_pdf.pdf2', pdf: pdf);
  }
}
