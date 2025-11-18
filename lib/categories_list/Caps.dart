import 'package:flutter/material.dart';

class Caps extends StatefulWidget {
  const Caps({super.key});

  @override
  State<Caps> createState() => _CapsState();
}

class _CapsState extends State<Caps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Caps'),),);
  }
}