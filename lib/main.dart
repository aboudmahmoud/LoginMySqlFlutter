import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'Screens/SearchPage.dart';
import 'Screens/SumbatForm.dart';
import 'Screens/Tikepage.dart';
import 'Screens/login.dart';
import 'Servies/MoudleHud.dart';

void main() {

  //here to Stop App From Ratationg
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
   //end
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //we use mutiprovdier in caser we need a provide in other page
    return MultiProvider(
        providers: [

    ChangeNotifierProvider<MoudleHud>(
    create: (context)=>MoudleHud(),
    ),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: login.LoginSceern,
        routes: {
          login.LoginSceern: (context) => login(),
          SumabatForm.sumabatForm:  (context) => SumabatForm(),
          TikePage.tikepage:(context)=>TikePage(),
          SearchPage.searchPage:(context)=>SearchPage(),

        },
      ),
    );
  }

// This widget is the root of your application.
}