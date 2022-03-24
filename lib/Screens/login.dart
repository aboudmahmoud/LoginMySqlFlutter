import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:worktask/ConstFiles/constdata.dart';
import 'package:worktask/CoustemWidgets/CoustemImageView.dart';
import 'package:worktask/CoustemWidgets/coustem_text.dart';
import 'package:worktask/Servies/MoudleHud.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'SearchPage.dart';
import 'SumbatForm.dart';

class login extends StatelessWidget {
  static String LoginSceern = "LoginSceern"; //name of class
  final GlobalKey<FormState> _globalKey =
      GlobalKey<FormState>(); //we use globlas key to valdute our data we send
  String? _emaile, _passWOrd; // that to store our input that user entared

//that meathod to connect api
  Future logine(BuildContext ConText, String mail, String Pss) async {
    var url = Uri.parse("http://192.168.0.193/FlutterApi/logiN.php");
    var Response = await http.post(url, body: {
      "email": mail,
      "password": Pss,
    });

    var data = json.decode(Response.body);
    if (data == "Succes") {
      /*  Fluttertoast.showToast(
            msg: "Succes",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );*/
      Navigator.pushNamed(ConText, SearchPage.searchPage);
    } else {
      Fluttertoast.showToast(
          msg: "Error in userdata ",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Form(
      key: _globalKey,
      child: ListView(
        children: [
          CoustomIMageVeiw(),
          SizedBox(
            height: heightOfScreen * 0.02,
          ),
          CustomTextField(
              onClick: (value) {
                _emaile = value;
              },
              hint: HintMessgEmail, //value Get from Constans
              icon: Icons.email),
          SizedBox(
            height: heightOfScreen * 0.02,
          ),
          CustomTextField(
              onClick: (value) {
                _passWOrd = value;
              },
              hint: HintPasswordMessg, //value Get from Constans
              icon: Icons.lock),
          SizedBox(
            height: heightOfScreen * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: Builder(builder: (context) {
              return TextButton(

                style: TextButton.styleFrom(
                  backgroundColor: KBackGroundButton,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                onPressed: () async {
                  _Valdite(context);
                },
                child: Text(
                  ButtonTextLogin,
                  style: TextStyle(color: Colors.white),
                ),
              );
            }),
          ),
        ],
      ),
    ));
  } // to Get error

  _Valdite(BuildContext ConText) async {
    final moudelhub = Provider.of<MoudleHud>(ConText, listen: false);
    moudelhub.changeIsLoading(true);
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();

      try {
        logine(ConText, _emaile!, _passWOrd!);
      } catch (Exeption) {
        moudelhub.changeIsLoading(false);

        print(Exeption.toString());
        ScaffoldMessenger.of(ConText).showSnackBar(SnackBar(
            content: Text(
          Exeption.toString(),
        )));
      }
    }
    moudelhub.changeIsLoading(false);
  }
}
