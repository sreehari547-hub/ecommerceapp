import 'package:flutter/material.dart';

class Tablets extends StatefulWidget {
  const Tablets({super.key});

  @override
  State<Tablets> createState() => _TabletsState();
}

class _TabletsState extends State<Tablets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Tablets'),),);
  }
}