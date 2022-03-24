import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:worktask/ConstFiles/constdata.dart';
import 'dart:convert';

import 'package:worktask/Moudle/CoustmerMoudle.dart';
import 'package:worktask/Servies/TiketSerives.dart';

import 'Tikepage.dart';

// that page was Canseld to use
class SumabatForm extends StatefulWidget {
  static String sumabatForm = "SumabatForm";
  @override
  SumabatFormState createState() => SumabatFormState();
}

class SumabatFormState extends State<SumabatForm> {
  //dropdownvalue1 & dropdownvalue2 is frist value of ListOfName or phones
  String dropdownvalue1 = '';
  String dropdownvalue2 = '';
  // Names& phones are lists that save the json into it
  List<String> Names = [];
  List<String> phones = [];
  //NamesUnqe&phonesUnqe its to after prooccesing set to names and phones
  List<String> NamesUnqe = [];
  List<String> phonesUnqe = [];
  //we use Future Bulid So that mean we gone use it RealTime , so we have to make shor frie value of dropdownvalue1 by is true or not
  bool Fristvalue = true;
 //Our moudle
  List<CoustemrMoulde>? _courtmer;
  Future<dynamic> generateCoustmerList() async {
    // Give your sever URL of get_employees_details.php file
    var url = Uri.parse("http://192.168.0.193/FlutterApi/AllCoustmer.php");
    final response = await http.get(url);
    var list = json.decode(response.body);
    if (list != "Error") {
      _courtmer = await list
          .map<CoustemrMoulde>((json) => CoustemrMoulde.fromJson(json))
          .toList();
    } else {
      Fluttertoast.showToast(
          msg: "Error in coustmerdata ",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    try {
      for (int i = 0; i < _courtmer!.length; i++) {
        if (_courtmer![i].name.toString() == null ||
            _courtmer![i].phone.toString() == null) {
          continue;
        } else {
          Names.add(_courtmer![i].name.toString());
          phones.add(_courtmer![i].phone.toString());
        }

        //  print(Names);
      }
      var seen = Set<String>();
      // in datapase we have alot of reudanta or null data that cuser error or null exeption
      //so in next line 63 and 64 we remove it but useing Set Structer
      NamesUnqe =
          Names.where((element) => seen.add(element.toString())).toList();
      phonesUnqe =
          phones.where((element) => seen.add(element.toString())).toList();
      /* for (int i=0 ;i<NamesUnqe.length;i++)
        {
          print(NamesUnqe[i]);
        }*/
      if (Fristvalue) {
        dropdownvalue1 = NamesUnqe[0];
        dropdownvalue2 = phonesUnqe[0];
      }
    } catch (Ex) {
      Fluttertoast.showToast(
          msg: Ex.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    Fristvalue = false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          FutureBuilder<dynamic>(
              future: generateCoustmerList(),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    SizedBox(
                      height: heightOfScreen * 0.04,
                    ),// to make space
                    DropdownButton(  // DropdownButton is method that we got to choes
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: NamesUnqe.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        // dropdownvalue1 = value.toString();
                        setState(() {
                          dropdownvalue1 = value.toString();
                        });
                      },
                      value: dropdownvalue1,
                    ),
                    DropdownButton(
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: phonesUnqe.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        dropdownvalue2 = value.toString();
                        setState(() {
                          dropdownvalue2 = value.toString();
                        });
                      },
                      value: dropdownvalue2,
                    ),
                    SizedBox(
                      height: heightOfScreen * 0.04,
                    ),
                    Builder(builder: (context) {
                      return TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: KBackGroundButton,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        onPressed: () {
                          Tiket.CoustmerName = dropdownvalue1;
                          Tiket.numberTiket.add( ++Tiket.numberOfUser);
                          Navigator.pushNamed(context, TikePage.tikepage);
                        },
                        child: Text(
                          ButtonTextTacke,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }),
                  ],
                );
              }),
        ],
      ),
    ));
  }
}
