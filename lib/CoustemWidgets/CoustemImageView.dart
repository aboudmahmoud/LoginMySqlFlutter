import 'package:flutter/material.dart';
import 'package:worktask/animtaifolder/Anmationpart.dart';

//that is coustem image to use it on any page
class CoustomIMageVeiw extends StatelessWidget {

//'Images/background.png'
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(),
      child: Container(
        //height: MediaQuery.of(context).size.height * 0.3,
        child: Stack(

          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Images/background.png'),
                      fit: BoxFit.fill
                  )
              ),
              child: Stack(
                children: <Widget>[
                Positioned(
                left: 30,
                width: 80,
                height: 200,
                child: FadeAnimation(1, Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Images/light-1.png')
                      )
                  ),
                )),
              ),Positioned(
              left: 140,
              width: 80,
              height: 150,
              child: FadeAnimation(1.3, Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('Images/light-2.png')
                    )
                ),
              )),
            ),
              Positioned(
                right: 20,
                top: 40,
                width: 80,
                height: 150,
                child: FadeAnimation(1.5, Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Images/clock.png')
                      )
                  ),
                )),
              ),
              Positioned(
                  left: 140,
                top:120,
                width: 80,
                child: FadeAnimation(1.6, Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Opacity(opacity: 0.5,
                    child: Image(image: AssetImage('Images/unnamed.png'),)),),
                  ),
                )),
        ],),

            )

          ],
        ),
      ),
    );
  }
}