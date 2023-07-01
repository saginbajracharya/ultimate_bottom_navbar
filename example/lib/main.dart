import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ultimate_bottom_navbar/ultimate_bottom_navbar.dart';
import 'BottomNavPages/page_1.dart';
import 'BottomNavPages/page_2.dart';
import 'BottomNavPages/page_3.dart';
import 'BottomNavPages/page_4.dart';
import 'BottomNavPages/page_5.dart';
import 'utils/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationPage(),
    );
  }
}

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key, }) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  Random random                      = Random();
  int currentIndex                   = 0;
  bool staticCurve                   = false;
  bool useForeGroundGradient         = false;
  bool showForeGround                = true;
  bool useShaderStroke               = false;
  bool underCurve                    = true;
  bool showCircleStaticMidItem       = true;
  bool showForeGroundStrokeAllSide   = false;
  Color backgroundColor              = transparent; 
  double backgroundStrokeBorderWidth = 0.0;  
  var badgeVal1                      = '5';
  var badgeVal2                      = '55';
  var textDirection                  = TextDirection.ltr;

  final List<String> title = [
    "",
    "",
    "",
    "",
    ""
  ];

  final List<IconData> icons = [
    Icons.favorite, 
    Icons.wallet_giftcard_sharp, 
    Icons.home, 
    Icons.ac_unit_outlined, 
    Icons.access_alarm_rounded, 
  ];

  final List pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
  ];
  
  Gradient backgroundGradientColor = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      green,
      green,
      green,
      green,
      red,
    ],
    stops: [0.1, 0.3, 0.5, 0.7, 1.0],
  );

  Shader foreGroundGradientShader = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      blue,
      white,
      blue,
      white,
      red,
    ],
    stops: [0.2, 0.4, 0.5, 0.6, 2.0],
  ).createShader(Rect.fromCenter(center: const Offset(0.0,0.0), height: 200, width: 100));

  Shader foregroundStrokeGradientShader = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      blue,
      blue,
      red,
      blue,
      blue,
    ],
    stops: [0.2, 0.4, 0.5, 0.6, 2.0],
  ).createShader(Rect.fromCenter(center: const Offset(0.0,0.0), height: 200, width: 100));
  
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: false,
        backgroundColor: grey,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: kBottomNavigationBarHeight+50,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top:kBottomNavigationBarHeight),
                child: pages[currentIndex],
              ),
              Container(
                height: MediaQuery.of(context).size.height-kBottomNavigationBarHeight-kBottomNavigationBarHeight,
                padding: const EdgeInsets.only(left:10.0,right:10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //TextDirection LTR / RTL
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(textDirection==TextDirection.ltr){
                                textDirection = TextDirection.rtl;
                              }
                              else
                              {
                                textDirection = TextDirection.ltr;
                              }
                            });
                          }, 
                          child: Text(textDirection == TextDirection.ltr?'RTL Text Direction':'LTR Text Direction',style: const TextStyle(color: white))
                        ),
                      ),
                      //Random Background Color
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: ()async{
                            setState(() {
                              backgroundColor = Color.fromARGB(
                                255,
                                random.nextInt(256),
                                random.nextInt(256),
                                random.nextInt(256),
                              );
                            });
                          }, 
                          child: const Text('Random Background Color',style: TextStyle(color: white))
                        ),
                      ),
                      //Show Hide Background Stroke
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(backgroundStrokeBorderWidth==0.0){
                                backgroundStrokeBorderWidth=2.0;
                              }else{
                                backgroundStrokeBorderWidth=0.0;
                              }
                            });
                          }, 
                          child: Text(backgroundStrokeBorderWidth==0.0?'Show Background Stroke':'Hide Background Stroke',style: const TextStyle(color: white))
                        ),
                      ),
                      //ForeGround Gradient / Solod Color
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(useForeGroundGradient==false)
                              {
                                useForeGroundGradient=true;
                              }else{
                                useForeGroundGradient=false;
                              }
                            });
                          }, 
                          child: Text(useForeGroundGradient?'ForeGround Solid Color':'ForeGround Gradient Color',style: const TextStyle(color: white))
                        ),
                      ),
                      //ForeGround show hide all Side Stroke
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(showForeGroundStrokeAllSide==false)
                              {
                                showForeGroundStrokeAllSide=true;
                              }else{
                                showForeGroundStrokeAllSide=false;
                              }
                            });
                          }, 
                          child: Text(showForeGroundStrokeAllSide?'hide ForeGround Stroke AllSide':'show ForeGround Stroke AllSide',style: const TextStyle(color: white))
                        ),
                      ),
                      //Show Hide ForeGround
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(showForeGround==false)
                              {
                                showForeGround=true;
                              }else{
                                showForeGround=false;
                              }
                            });
                          }, 
                          child: Text(showForeGround?'Hide ForeGround':'Show ForeGround',style: const TextStyle(color: white))
                        ),
                      ),
                      //Foreground Shader Stroke
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(useShaderStroke==false)
                              {
                                useShaderStroke=true;
                              }else{
                                useShaderStroke=false;
                              }
                            });
                          }, 
                          child: Text(useShaderStroke?'ForeGround Solid Color Stroke':'ForeGround Shader Gradient Stroke',style: const TextStyle(color: white))
                        ),
                      ),
                      //Under Upper Curve
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(underCurve==false)
                              {
                                underCurve=true;
                              }else{
                                underCurve=false;
                              }
                            });
                          }, 
                          child: Text(underCurve?'Upper Curve':'Under Curve',style: const TextStyle(color: white))
                        ),
                      ),
                      //Static Dynamic Curve
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(staticCurve==false)
                              {
                                staticCurve=true;
                              }else{
                                staticCurve=false;
                              }
                            });
                          }, 
                          child: Text(staticCurve?'Dynamic Curve':'Static Curve',style: const TextStyle(color: white))
                        ),
                      ),
                      //Change Badge value 1
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: ()async{
                            setState(() {
                              badgeVal1 = (int.parse(badgeVal1)+1).toString();
                            });
                          }, 
                          child: const Text('Change Badge value 1',style: TextStyle(color: white))
                        ),
                      ),
                      //Change Badge value 2
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: ()async{
                            setState(() {
                              badgeVal2 = (int.parse(badgeVal2)+1).toString();
                            });
                          }, 
                          child: const Text('Change Badge value 2',style: TextStyle(color: white))
                        ),
                      ),
                      //Reset Badge value 1
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: ()async{
                            setState(() {
                              badgeVal1 = '0';
                            });
                          }, 
                          child: const Text('Reset Badge value 1',style: TextStyle(color: white))
                        ),
                      ),
                      //Reset Badge value 2
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: ()async{
                            setState(() {
                              badgeVal2 = '0';
                            });
                          }, 
                          child: const Text('Reset Badge value 2',style: TextStyle(color: white))
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: UltimateBottomNavBar(
          icons                              : icons,                                                                       // Icon list<Widget>
          titles                             : title,                                                                       // Title list<String>
          currentIndex                       : currentIndex,                                                                // Current selected index
          backgroundColor                    : backgroundColor,                                                             // NavBar BackGround Color [backgroundGradient ovrerides color]
          foregroundColor                    : black,                                                                       // NavBar ForeGround Color with Curve 
          foregroundStrokeBorderColor        : red,                                                                         // Nav Stroke Border Color [useShaderStroke = false , strokeBorderWidth != 0]
          backgroundStrokeBorderColor        : black,                                                                       // nav background stroke color [seems like when border width is 0.0 still shows the color but transparent solves it]
          backgroundStrokeBorderWidth        : backgroundStrokeBorderWidth,                                                 // Nav BackGround Stroke Border Width
          foregroundStrokeBorderWidth        : 2.0,                                                                         // Nav ForeGround Stroke Border Width  
          backgroundGradient                 : backgroundGradientColor,                                                     // Nav background Gradient [No Gradient if Null Overrides backgroundColor if given]
          foreGroundGradientShader           : foreGroundGradientShader,                                                    // Nav ForeGround Gradient Shader [foregroundColor or foreGroundGradientShader determined by Bool useForeGroundGradient]
          foregroundStrokeGradientShader     : foregroundStrokeGradientShader,                                              // ForeGround Stroke border Gradient Shader
          
          backgroundMargin                   : const EdgeInsets.only(left: 0.0,right: 0.0,bottom: 0.0),                  // Nav Background Margin
          backgroundBorderRadius             : BorderRadius.circular(10.0),                                                 // Nav Background Border Radius

          selectedIconColor                  : red,                                                                         // Selected Item Icon Color
          selectedIconSize                   : 25,                                                                          // Selected Item Icon Size
          selectedTextSize                   : 10,                                                                          // Selected Item Text Size
          selectedTextColor                  : red,                                                                         // Selected Item Text Color
          unselectedIconColor                : white,                                                                       // UnSelected Item Icon Color
          unselectedIconSize                 : 25,                                                                          // UnSelected Item Icon Size
          unselectedTextSize                 : 10,                                                                          // UnSelected Item Text Size
          unselectedTextColor                : white,                                                                       // UnSelected Item Text Color

          showForeGroundStrokeAllSide        : showForeGroundStrokeAllSide,                                                 //
          useForeGroundGradient              : useForeGroundGradient,                                                       // Gradient for ForeGround or Not
          showForeGround                     : showForeGround,                                                              // Show ForeGround or Not
          useShaderStroke                    : useShaderStroke,                                                             // Use Shadered Stroke Border or Not
          underCurve                         : underCurve,                                                                  // Under Curve or Upper Curve
          staticCurve                        : staticCurve,                                                                 // Static Curve or Dynamic Curve
          showCircleStaticMidItemStatic      : showCircleStaticMidItem,                                                     // Show or Not Show Circle for Mid Item If Static Curve

          midItemCircleColorStatic           : white,                                                                       // Color of a Mid item circle for static item  
          midItemCircleBorderColorStatic     : black,                                                                       // Color of a Mid item border circle for static item
          showMidCircleStatic                : true,                                                                        // Show/Hide Mid item circle for static item
          midCircleRadiusStatic              : 20.0,                                                                        // Radius for Mid Circle
          midCircleBorderRadiusStatic        : 2.0,                                                                         // Radius for Mid Circle Border
          customSelectedItemDecor            : customSelecteditem(),                                                        // Custom Selected Item Decor
          customUnSelectedItemDecor          : customUnselectedItem(),                                                      // Custom UnSelected Item Decor

          badgeData                          : [{'index': 1, 'value': badgeVal1},{'index': 4, 'value': badgeVal2}],         //Badge Data for Each Index with value
          badgeColor                         : red,                                                                         // Badge Color 
          badgeTextStyle                     : const TextStyle(color: white,fontSize: 8.0,overflow: TextOverflow.ellipsis), // Badge Text Style
          badgeCircleRadius                  : 8.0,                                                                         // Badge Circle Radius
          badgeTopPosition                   : 10.0,                                                                        // Badge Top Position
          badgeRightPosition                 : 16.0,                                                                        // Badge Right Position
          badgeBottomPosition                : null,                                                                        // Badge Bottom Position
          badgeLeftPosition                  : null,                                                                        // Badge Left Position

          animationType                      : Curves.ease,                                                                 // Index change animation curves
          animationDuration                  : const Duration(milliseconds: 500),                                           // Index Change Animation duration for curve only
          onTap                              : (index) async => onItemTapped(index),                                        // Custom OnTap CallBacks
        ),
      ),
    );
  }

  customSelecteditem() {
    return const CircleAvatar(
      backgroundColor: red,
      radius: 22.0,
      child: CircleAvatar(
        backgroundColor: black,
        radius: 20.0,
        child: SizedBox()
      )
    );
  }

  customUnselectedItem() {
    return const CircleAvatar(
      backgroundColor: white,
      radius: 22.0,
      child: CircleAvatar(
        backgroundColor: black,
        radius: 20.0,
        child: SizedBox()
      )
    );
  }

  void onItemTapped(int index) async{
    setState(() {
      currentIndex = index;
      //reset on Tap Badge Value
      // if(index==1){
      //   badgeVal1='0';
      // }
    });
  }
}
