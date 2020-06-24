import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/CategoryPage.dart';
import 'package:flutterapp/util/Res.dart';
import 'package:flutterapp/util/util.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    super.initState();

    FirebaseMessaging().subscribeToTopic("news");

    Future.delayed(Duration(seconds: 2),(){
      openNewPage(context, CategoryPage(),popPreviousPages: true);
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        width: double.infinity,
        child: Image.asset(ImageHelper.SPLASH),
      ),

    );
  }
}
