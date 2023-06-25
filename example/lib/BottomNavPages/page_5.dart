import 'package:flutter/material.dart';
import '../utils/styles.dart';

class Page5 extends StatefulWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: kBottomNavigationBarHeight+50,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top:kBottomNavigationBarHeight),
      child: const Text("PAGE 5",style: TextStyle(color: black,fontSize: 40.0)),
    );
  }
}