import 'package:ecommerceapp/Splashscreen/Splashscreen.dart';
import 'package:ecommerceapp/data/Appdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main(){
  runApp(ChangeNotifierProvider(create: (_) => AppData(),child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}