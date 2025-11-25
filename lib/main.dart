import 'package:ecommerceapp/Splashscreen/Splashscreen.dart';
import 'package:ecommerceapp/data/AppData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async{
  runApp(
   MyApp()
  
    );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (_) => AppData()
    )],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}
