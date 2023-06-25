import 'package:flutter/material.dart';
import '../utils/styles.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  bool isListenerOn = false;

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return const Text("PAGE 3",style: TextStyle(color: black,fontSize: 40.0));
  }
}