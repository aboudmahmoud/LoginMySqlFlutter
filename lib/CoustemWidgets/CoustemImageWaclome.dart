import 'package:flutter/material.dart';
import 'package:worktask/animtaifolder/Anmationpart.dart';

class CoustemWalcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(),
      child: Container(
        //height: MediaQuery.of(context).size.height * 0.3,
        child: Stack(

          children: [
            Container(
              height: 200,

              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Images/Walcome.png'),
                      fit: BoxFit.fill
                  )
              ),
            )

          ],
        ),
      ),
    );
  }
}
