import 'package:flutter/material.dart';
import '../utils/styles.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key, }) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return const Text("PAGE 2",style: TextStyle(color: black,fontSize: 40.0));
  }
}