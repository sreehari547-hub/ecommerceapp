import 'package:flutter/material.dart';

class Mobiles extends StatefulWidget {
  const Mobiles({super.key});

  @override
  State<Mobiles> createState() => _MobilesState();
}

class _MobilesState extends State<Mobiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Mboiles'),),);
  }
}