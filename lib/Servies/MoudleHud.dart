import 'package:flutter/cupertino.dart';
//MoudleHud servies is use to make screen loading  ( aka stop the screen we use in it )
class MoudleHud extends ChangeNotifier{
  bool isLoading=false;
  changeIsLoading(bool stats)
  {
    isLoading=stats;
    notifyListeners();
  }
}