import 'dart:async';
import 'package:ecommerceapp/Login/Loginpage.dart';
import 'package:ecommerceapp/Session/Sessionmanager.dart';
import 'package:ecommerceapp/data/AppData.dart';
import 'package:ecommerceapp/home/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    bool isLoggedIn = await SessionManager.isLoggedInFully();

    if (!mounted) return;

    
    

    if (isLoggedIn) {
      
      final appData = AppData.instance;
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => ChangeNotifierProvider<AppData>.value(
      value: appData,
      child: const Homepage(),
    ),
  ),
);

    } else {
      
      final appData = AppData.instance;
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => ChangeNotifierProvider<AppData>.value(
      value: appData,
      child: const Loginpage(),
    ),
  ),
);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 123, 0),
      body: const Center(
        child: Image(
          image: NetworkImage(
            'https://dynamic.design.com/preview/logodraft/077f5b67-ba26-4a6e-ac7e-e171d4d7ddea/image/large.png',
          ),
          width: 260,
        ),
      ),
    );
  }
}
