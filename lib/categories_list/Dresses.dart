import 'package:flutter/material.dart';


class Dresses extends StatefulWidget {
  const Dresses({super.key});

  @override
  State<Dresses> createState() => _DressesState();
}

class _DressesState extends State<Dresses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Dresses'),),);
  }
}