import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:worktask/ConstFiles/constdata.dart';
import 'package:worktask/Servies/TiketSerives.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
class TikePage extends StatelessWidget {
  static String tikepage="TikePage";
  double? heightOfScreen;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //here we git height of screeen
    heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(

        children: [
          SizedBox(
            height: heightOfScreen! * 0.04,
          ),
          Center(child: Text(tiketHader)),
          SizedBox(
            height: heightOfScreen! * 0.04,
          ),
          Center(child: Text("Phone Number "  +  Tiket.PhoneNumber)),
          SizedBox(
            height: heightOfScreen! * 0.02,
          ),
          Center(child: Text(NumberofUser + Tiket.numberTiket[Tiket.numberOfUser-1].toString())),
          SizedBox(
            height: heightOfScreen! * 0.02,
          ),
          Center(child: Text(tikeNumberofWating + Tiket.numberOfUser.toString())),
          Divider(color: Colors.black),
          SizedBox(
            height: heightOfScreen! * 0.02,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: KBackGroundButton,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            onPressed: pdfmethod,
            child: Text(
              ButtonTextPrint,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  //here to print the page into pdf
  void pdfmethod() async  {
            try {
              Directory tempDir = await getTemporaryDirectory();
              String tempPath = tempDir.path;
  
              Directory appDocDir = await getApplicationDocumentsDirectory();
              String appDocPath = appDocDir.path;
  
              final pdf = pw.Document();
  
              pdf.addPage(pw.Page(
                  pageFormat: PdfPageFormat.a4,
                  build: (pw.Context context) {
                    return pw.ListView(
                      children: [
                        pw.SizedBox(
                        height: heightOfScreen! * 0.04,
                      ),
                        pw.Center(child: pw.Text(tikeCoustmerName + Tiket.CoustmerName)),
                        pw.SizedBox(
                          height: heightOfScreen! * 0.02,
                        ),
                        pw.Center(child: pw.Text(tiketHader)),
                        pw.SizedBox(
                          height: heightOfScreen! * 0.02,
                        ),
                        pw.Center(child: pw.Text(NumberofUser + Tiket.numberTiket[Tiket.numberOfUser-1].toString())),
                        pw.SizedBox(
                          height: heightOfScreen! * 0.02,
                        ),
                        pw.Center(child: pw.Text(tikeNumberofWating + Tiket.numberOfUser.toString())),

                      ],
  
                    ); // Center
                  })); // Page
  
              final file = File('${appDocPath}/tiket.pdf');
              await file.writeAsBytes(await pdf.save());
              print(appDocPath);
              Fluttertoast.showToast(
                  msg: 'done',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
            catch(exeption)
            {
              print(exeption.toString());
            }
  
          }
}
