import 'package:flutter/material.dart';
import 'package:worktask/ConstFiles/constdata.dart';

class CustomTextField extends StatelessWidget {
  //the hint Meesg that will show in background of text Field
  final String hint;

  final IconData icon;
  bool CheckHintIsPassord=false;
  bool chechIFisMessh=false;
  var onClick;

  CustomTextField({   required this.onClick,required this.hint, required  this.icon})
  {


   if(this.hint==HintPasswordMessg)
     {
   CheckHintIsPassord=true;
     }
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        obscureText:CheckHintIsPassord,
        validator:(value){
          if(value!.isEmpty)
          {
            return ErorrMessg(hint);
          }

          return null;
        },
        onSaved:onClick,
        cursorColor: KMainColor,
        decoration: InputDecoration(
          hintText: hint,


          prefixIcon: Icon(icon,
            color: KMainColor,),
          filled: true,
          fillColor: KTextBackGroundColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.red,
              )
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              )
          ),
        ),
      ),
    );
  }
}
