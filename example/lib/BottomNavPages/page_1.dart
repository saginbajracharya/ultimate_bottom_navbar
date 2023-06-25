import 'package:flutter/material.dart';
import '../utils/styles.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key, }) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();   
}

class _Page1State extends State<Page1> {

  @override
  Widget build(BuildContext context) {
    return const Text("PAGE 1",style: TextStyle(color: black,fontSize: 40.0));
  }
}