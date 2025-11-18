import 'dart:async';

import 'package:ecommerceapp/Login/Loginpage.dart';
import 'package:ecommerceapp/Session/Sessionmanager.dart';
import 'package:ecommerceapp/home/Homepage.dart';
import 'package:flutter/material.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}


class _SplashscreenState extends State<Splashscreen> {
@override 
void initState() { 
  
  super.initState();
  checkLoginStatus();
   } 
  
    
      
Future<void> checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3)); 
    bool isLoggedIn = await SessionManager.isLoggedin();

    if (!mounted) return;

    if (isLoggedIn) {
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    } else {
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loginpage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color.fromARGB(255, 255, 123, 0),body: Center(child: Image.network('https://dynamic.design.com/preview/logodraft/077f5b67-ba26-4a6e-ac7e-e171d4d7ddea/image/large.png',width: 260,),),);
  }
}