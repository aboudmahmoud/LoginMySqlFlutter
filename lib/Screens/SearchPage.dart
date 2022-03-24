import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:worktask/ConstFiles/constdata.dart';
import 'package:worktask/CoustemWidgets/CoustemImageWaclome.dart';
import 'package:http/http.dart' as http;
import 'package:worktask/Servies/MoudleHud.dart';
import 'package:worktask/Servies/TiketSerives.dart';

import 'Tikepage.dart';
class SearchPage extends StatelessWidget {
static String searchPage="SearchPage";
String? phoneNumbera;
final GlobalKey<FormState> _globalKey =
GlobalKey<FormState>();
Future SerchByPhone(BuildContext ConText,String PhoneNumber)async
{
  var url = Uri.parse("http://192.168.0.193/FlutterApi/serchbyphone.php");
  var Response = await http.post(url, body: {
    "phone": PhoneNumber,});
  var data = json.decode(Response.body);
  if (data == "Succes") {

    Tiket.numberTiket.add( ++Tiket.numberOfUser);
    Navigator.pushNamed(ConText, TikePage.tikepage);
  } else {
    Fluttertoast.showToast(
        msg: "Error There no Match with that Number ",
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
    double heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black38.withAlpha(10),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: ListView(
            children: [
              CoustemWalcome(),
              SizedBox(
                height: heightOfScreen * 0.02,
              ),
              Column(
                children: [
      
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator:(value){
                              if(value!.isEmpty)
                              {
                                return "error";
                              }

                              return null;
                            },

                            decoration: InputDecoration(
                              prefixIcon: Icon( Icons.search,
                                color: Colors.black.withAlpha(120),),
                              hintText: "Serach by Mobile Number",
                              hintStyle: TextStyle(
                                color: Colors.black.withAlpha(120),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.purple,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  )
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                  ),
                            ),),


                            onSaved: (value){
                              phoneNumbera=value;
                              Tiket.PhoneNumber=value!;
                            },

                          ),
                        ),

                      ),

                    ],
                  ),
                  TextButton(
                  style: TextButton.styleFrom(
                  backgroundColor: KBackGroundButton,
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    ),
                      onPressed: () async{



                      _Valdite(context);





                  },
                      child: Text(ButtonTextTacke)
                  )
                ],
              ),
      
            ],
          ),
        ),
      ),
    );

  }

_Valdite(BuildContext ConText) async {
  final moudelhub = Provider.of<MoudleHud>(ConText, listen: false);
  moudelhub.changeIsLoading(true);
  if (_globalKey.currentState!.validate()) {
    _globalKey.currentState!.save();

    try {
      await SerchByPhone(ConText, phoneNumbera!);
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

