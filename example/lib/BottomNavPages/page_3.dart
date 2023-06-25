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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: kBottomNavigationBarHeight+50,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top:kBottomNavigationBarHeight),
      child: const Text("PAGE 3",style: TextStyle(color: black,fontSize: 40.0)),
    );
  }
}