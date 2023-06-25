import 'package:flutter/material.dart';
import '../utils/styles.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key, }) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: kBottomNavigationBarHeight+50,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top:kBottomNavigationBarHeight),
      child: const Text("PAGE 4",style: TextStyle(color: black,fontSize: 40.0)),
    );
  }
}