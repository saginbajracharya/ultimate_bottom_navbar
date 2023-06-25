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
  bool staticCurve             = false;
  bool useForeGroundGradient   = false;
  bool showForeGround          = true;
  bool useShaderStroke         = false;
  bool underCurve              = true;
  bool showCircleStaticMidItem = true;   
  int currentIndex             = 0;

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
      Colors.white,
      Colors.grey,
      Colors.green,
      Colors.grey,
      Colors.white,
    ],
    stops: [0.1, 0.3, 0.5, 0.7, 1.0],
  );

  Shader foreGroundGradientShader = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      blue,
      red,
      yellow,
      green,
      red,
    ],
    stops: [0.2, 0.4, 0.5, 0.6, 2.0],
  ).createShader(Rect.fromCenter(center: const Offset(0.0,0.0), height: 200, width: 100));

  Shader strokeGradientShader = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.red,
      Colors.purple,
      Colors.green,
      Colors.yellow,
      Colors.blue,
    ],
    stops: [0.2, 0.4, 0.5, 0.6, 2.0],
  ).createShader(Rect.fromCenter(center: const Offset(0.0,0.0), height: 200, width: 100));
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: pages[currentIndex]
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:10.0,right:10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical:40.0),
                    child: Text('Check out Additional Properties for Additional Customization',textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0),),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
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
                      child: Text(useForeGroundGradient?'Use ForeGround Solid Colors':'Use ForeGround Gradient',style: const TextStyle(color: white))
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
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
                  const SizedBox(height: 10),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
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
                      child: Text(useShaderStroke?'Dont Use Shader Stroke Foreground':'Use Shader Stroke Foreground',style: const TextStyle(color: white))
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
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
                  const SizedBox(height: 10),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
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
                  const SizedBox(height: 10),
                ],
              ),
            )
          ),
        ],
      ),
      bottomNavigationBar: UltimateBottomNavBar(
        icons                              : icons,                                // Icon list<Widget>
        titles                             : title,                                // Title list<String>
        currentIndex                       : currentIndex,                         // Current selected index
        backgroundColor                    : transparent,                          // NavBar BackGround Color [backgroundGradient ovrerides color]
        foregroundColor                    : white,                                // NavBar ForeGround Color with Curve 
        foregroundStrokeBorderColor        : black,                                // Nav Stroke Border Color [useShaderStroke = false , strokeBorderWidth != 0]
        backgroundStrokeBorderColor        : black,                                // nav background stroke color [seems like when border width is 0.0 still shows the color but transparent solves it]
        backgroundStrokeBorderWidth        : 0.0,                                  // Nav BackGround Stroke Border Width
        foregroundStrokeBorderWidth        : 2.0,                                  // Nav ForeGround Stroke Border Width  
        backgroundGradient                 : null,                                 // Nav background Gradient [No Gradient if Null Overrides backgroundColor if given]
        foreGroundGradientShader           : foreGroundGradientShader,             // Nav ForeGround Gradient Shader [foregroundColor or foreGroundGradientShader determined by Bool useForeGroundGradient]
        
        selectedIconColor                  : red,                                  // Selected Item Icon Color
        selectedIconSize                   : 25,                                   // Selected Item Icon Size
        selectedTextSize                   : 10,                                   // Selected Item Text Size
        selectedTextColor                  : red,                                  // Selected Item Text Color
        unselectedIconColor                : black,                                // UnSelected Item Icon Color
        unselectedIconSize                 : 25,                                   // UnSelected Item Icon Size
        unselectedTextSize                 : 10,                                   // UnSelected Item Text Size
        unselectedTextColor                : black,                                // UnSelected Item Text Color

        strokeGradientShader               : strokeGradientShader,                 // ForeGround Stroke border Gradient Shader
        useForeGroundGradient              : useForeGroundGradient,                // Gradient for ForeGround or Not
        showForeGround                     : showForeGround,                       // Show ForeGround or Not
        useShaderStroke                    : useShaderStroke,                      // Use Shadered Stroke Border or Not
        underCurve                         : underCurve,                           // Under Curve or Upper Curve
        staticCurve                        : staticCurve,                          // Static Curve or Dynamic Curve
        showCircleStaticMidItemStatic      : showCircleStaticMidItem,              // Show or Not Show Circle for Mid Item If Static Curve

        midItemCircleColorStatic           : white,                                // Color of a Mid item circle for static item  
        midItemCircleBorderColorStatic     : black,                                // Color of a Mid item border circle for static item
        showMidCircleStatic                : false,                                 // Show/Hide Mid item circle for static item
        midCircleRadiusStatic              : 20.0,                                 // Radius for Mid Circle
        midCircleBorderRadiusStatic        : 2.0,                                  // Radius for Mid Circle Border
        customSelectedItemDecor            : customSelecteditem(),                 // Custom Selected Item Decor
        customUnSelectedItemDecor          : customUnselectedItem(),               // Custom UnSelected Item Decor

        animationType                      : Curves.ease,                          // Index change animation curves
        animationDuration                  : const Duration(milliseconds: 500),    // Index Change Animation duration for curve only
        onTap                              : (index) async => onItemTapped(index), // Custom OnTap CallBacks
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
      backgroundColor: black,
      radius: 22.0,
      child: CircleAvatar(
        backgroundColor: white,
        radius: 20.0,
        child: SizedBox()
      )
    );
  }

  void onItemTapped(int index) async{
    setState(() {
      currentIndex = index;
    });
  }
}
