import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Screens/launcher_screen.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen2(),
    ));

class SplashScreen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenWidget();
  }
}

class SplashScreenWidget extends State<SplashScreen2>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    AnimationController controller;
    late Animation<Offset> offset ;

    setState(() {

      controller =
          AnimationController(vsync: this, duration: Duration(seconds: 3));

      offset = Tween<Offset>(begin: Offset(0, 20), end: Offset.zero)
          .animate(controller);

      controller.forward();


    });

    Factory().changeScreenWithDelay(context, () => LauncherScreen(),6);




    return Builder(
      builder: (BuildContext context){
        return Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ConstantManager.bijli4ULogoGif,
                        width: 200,
                        height: 200,
                        alignment: Alignment.center,
                      ),
                      SlideTransition(
                        position: offset,
                        child:
                        Image.asset(ConstantManager.bijli4UNameImg, width: 120,
                          height: 120,
                          alignment: Alignment.center,),)


                    ],
                  ),
                ));
      }
    );
  }
}