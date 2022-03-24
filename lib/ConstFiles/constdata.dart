//Colors
import 'package:flutter/material.dart';

const KMainColor=Color(0xff6c43db);
const KTextBackGroundColor=Color(0xfff6f2f2);
const KBackGroundButton=Color(0xFFe089b4);
const KHintBottomMessgColor=Color(0xFFf8efe6);
const KLikeWhiteColor=Color(0xFFeeeee4);


// this our hint field text we use it in login page
const String HintPasswordMessg="Enter your Password";
// this our hint field text we use it in  login page
const String ButtonTextLogin="Login";
// this our hint field text we use it in  login page
const String HintMessgEmail="Enter your email address";
//Error Message That user wall read if TextField of Email is Empty
const String ErrorEmailMessg="Email is Empty";
const String ErrorPasswordMessg="Password is Empty";
//text button in sumbatForm
const String ButtonTextTacke="get Taket";
// meesgw in tiketpage
const String tiketHader="Queue Tike";
const String tikeCoustmerName="Coustmer Name: ";
const String tikeNumberofWating="Number of waiting is ";
const String ButtonTextPrint="Print The Taket";
const String NumberofUser="your Number is ";

String? ErorrMessg(String ErrorMssg) {
  switch (ErrorMssg) {
    case HintMessgEmail:
      return ErrorEmailMessg;
    case HintPasswordMessg:
      return ErrorPasswordMessg;
  }
}