import 'package:example/widgets/property_table_widget.dart';
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

  final backgroundGradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      black,     // Black
      darkGrey,  // Dark Gray
      grey,      // Gray
      lightGrey, // Light Gray
      white,     // White
    ],
    stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
    tileMode: TileMode.mirror,
  );

  Shader backgroundStrokeGradientShader = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      blue,
      white,
      red,
      white,
      blue,
    ],
    stops: [0.0, 0.25, 0.5, 0.75, 1.0],
    tileMode: TileMode.repeated,
  ).createShader(Rect.fromCenter(center: const Offset(0.0, 0.0), height: 1.0, width: 100.0));

  Shader foreGroundGradientShader = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      white,     // White
      lightGrey, // Light Gray
      grey,      // Gray
      darkGrey,  // Dark Gray
      black,     // Black
    ],
    stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
    tileMode: TileMode.mirror,
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

  int currentIndex                             = 0;
  bool staticCurve                             = false;
  bool useForeGroundGradient                   = false;
  bool showForeGround                          = true;
  bool useBackgroundShaderStroke               = false;
  bool useForegroundShaderStroke               = false;
  bool underCurve                              = true;
  bool showCircleStaticMidItem                 = true;
  bool showForeGroundStrokeAllSide             = false;
  bool showBackGroundStrokeAllSide             = false;
  bool showMidCircleStatic                     = false; 
  Color backgroundColor                        = blue; 
  Widget? customSelectedItemDecor;
  Widget? customUnSelectedItemDecor;
  Gradient? backgroundGradientColors;
  double backgroundStrokeBorderWidth           = 2.0; 
  double foregroundStrokeBorderWidth           = 2.0;  
  BorderRadiusGeometry? backgroundBorderRadius = BorderRadius.circular(0.0);
  EdgeInsetsGeometry? navBarMargin             = const EdgeInsets.only(left: 0.0,right: 0.0,bottom: 0.0);
  var badgeVal1                                = '5';
  var badgeVal2                                = '55';
  var textDirection                            = TextDirection.ltr;

  final List<String> title = [
    "Favourite",
    "Wallet",
    "Home",
    "Freeze",
    "Alarm"
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
                      const Divider(thickness: 2),
                      // Nav Properties for Icons and margins
                      Text('Nav Properties',style: heading1Style,textAlign: TextAlign.center),
                      const Divider(thickness: 2),
                      //TextDirection LTR / RTL
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
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
                          child: Text(textDirection == TextDirection.ltr?'Text Direction RTL':'Text Direction LTR',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //Add Margin to Bottom Nav
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(navBarMargin==null||navBarMargin==EdgeInsets.zero)
                              {
                                navBarMargin=const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0);
                              }else{
                                navBarMargin=EdgeInsets.zero;
                              }
                            });
                          }, 
                          child: Text(navBarMargin==null||navBarMargin==EdgeInsets.zero?'Add Margin':'Remove Margin',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //Custom Selected Item Decor
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(customSelectedItemDecor == null){
                                customSelectedItemDecor = customSelecteditem();
                              } 
                              else{
                                customSelectedItemDecor = null;
                              }
                            });
                          }, 
                          child: Text('Custom Selected Item Decor',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //Custom Selected Item Decor
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(customUnSelectedItemDecor == null){
                                customUnSelectedItemDecor = customUnselectedItem();
                              } 
                              else{
                                customUnSelectedItemDecor = null;
                              }
                            });
                          }, 
                          child: Text('Custom UnSelected Item Decor',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //Change Badge value 1
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
                          ),
                          onPressed: ()async{
                            setState(() {
                              badgeVal1 = (int.parse(badgeVal1)+1).toString();
                            });
                          }, 
                          child: Text('Change Badge value 1',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //Change Badge value 2
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
                          ),
                          onPressed: ()async{
                            setState(() {
                              badgeVal2 = (int.parse(badgeVal2)+1).toString();
                            });
                          }, 
                          child: Text('Change Badge value 2',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //Reset Badge value 1
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
                          ),
                          onPressed: ()async{
                            setState(() {
                              badgeVal1 = '0';
                            });
                          }, 
                          child: Text('Reset Badge value 1',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //Reset Badge value 2
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
                          ),
                          onPressed: ()async{
                            setState(() {
                              badgeVal2 = '0';
                            });
                          }, 
                          child: Text('Reset Badge value 2',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      const Divider(thickness: 2),
                      //BackGround Properties
                      Text('Back Ground Properties',style: heading1Style,textAlign: TextAlign.center),
                      const Divider(thickness: 2),
                      //Background Gradient or Solid Color
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(backgroundGradientColors == null){
                                backgroundGradientColors = backgroundGradientColor;
                              }
                              else{
                                backgroundGradientColors = null;
                              }
                            });
                          }, 
                          child: Text(backgroundGradientColors==null?'Show Background Gradient Color':'Show Background Solid Color',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //Show Hide Background Stroke
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
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
                          child: Text(backgroundStrokeBorderWidth==0.0?'Show Background Stroke':'Hide Background Stroke',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //Background Shader Stroke or Solid Color Stroke
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(useBackgroundShaderStroke==false)
                              {
                                useBackgroundShaderStroke=true;
                              }else{
                                useBackgroundShaderStroke=false;
                              }
                            });
                          }, 
                          child: Text(useBackgroundShaderStroke?'BackGround Solid Color Stroke':'BackGround Shader Gradient Stroke',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //BackGround show hide all Side Stroke
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(showBackGroundStrokeAllSide==false)
                              {
                                showBackGroundStrokeAllSide=true;
                              }else{
                                showBackGroundStrokeAllSide=false;
                              }
                            });
                          }, 
                          child: Text(showBackGroundStrokeAllSide?'Hide BackGround Stroke AllSide':'Show BackGround Stroke AllSide\n Add Padding to view \n Work only when circular property is Zero',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //BackGround border Radius Stroke
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(backgroundBorderRadius==null||backgroundBorderRadius==BorderRadius.zero)
                              {
                                backgroundBorderRadius=BorderRadius.circular(10.0);
                              }else{
                                backgroundBorderRadius=BorderRadius.zero;
                              }
                            });
                          }, 
                          child: Text(backgroundBorderRadius==null||backgroundBorderRadius==BorderRadius.zero?'Show BackGround Circular Radius Stroke\n for all Sides':'Hide BackGround Circular Radius Stroke',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      const Divider(thickness: 2),
                      //ForeGround Properties
                      Text('Fore Ground Properties',style: heading1Style,textAlign: TextAlign.center),
                      const Divider(thickness: 2),
                      //Show Hide ForeGround
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
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
                          child: Text(showForeGround?'Hide ForeGround':'Show ForeGround',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //ForeGround Gradient / Solod Color
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
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
                          child: Text(useForeGroundGradient?'ForeGround Solid Color':'ForeGround Gradient Color',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //Foreground Shader Stroke
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(useForegroundShaderStroke==false)
                              {
                                useForegroundShaderStroke=true;
                              }else{
                                useForegroundShaderStroke=false;
                              }
                            });
                          }, 
                          child: Text(useForegroundShaderStroke?'ForeGround Solid Color Stroke':'ForeGround Shader Gradient Stroke',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //ForeGround show hide all Side Stroke
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
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
                          child: Text(showForeGroundStrokeAllSide?'Hide ForeGround Stroke AllSide':'Show ForeGround Stroke AllSide\n Add Padding to view',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //Under Upper Curve
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
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
                          child: Text(underCurve?'Upper Curve':'Under Curve',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //Static Dynamic Curve
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
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
                          child: Text(staticCurve?'Dynamic Curve':'Static Curve',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      //Mid Item Decor Static Curves
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical :8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: black,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Set the desired radius here
                            ),
                          ),
                          onPressed: ()async{
                            setState(() {
                              if(showMidCircleStatic==false)
                              {
                                showMidCircleStatic=true;
                              }else{
                                showMidCircleStatic=false;
                              }
                            });
                          }, 
                          child: Text(showMidCircleStatic?'Hide Mid Item Decor For Static Curve':'Show Mid Item Decor For Static Curve\nMust Be Static Curve and Selected,Unselected Decor overrides',style: buttonTextStyle,textAlign: TextAlign.center)
                        ),
                      ),
                      const Divider(thickness: 2),
                      //List Of All Available Properties
                      Text('Available Properties',style: heading1Style,textAlign: TextAlign.center),
                      const Divider(thickness: 2),
                      const PropertyTable(),
                      const SizedBox(
                        height: 100,
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
          foregroundStrokeBorderColor        : red,                                                                         // Nav Stroke Border Color [useForegroundShaderStroke = false , strokeBorderWidth != 0]
          backgroundStrokeBorderColor        : white,                                                                       // nav background stroke color [seems like when border width is 0.0 still shows the color but transparent solves it]
          backgroundStrokeBorderWidth        : backgroundStrokeBorderWidth,                                                 // Nav BackGround Stroke Border Width
          foregroundStrokeBorderWidth        : foregroundStrokeBorderWidth,                                                 // Nav ForeGround Stroke Border Width  
          backgroundGradient                 : backgroundGradientColors,                                                    // Nav background Gradient [No Gradient if Null Overrides backgroundColor if given]
          foreGroundGradientShader           : foreGroundGradientShader,                                                    // Nav ForeGround Gradient Shader [foregroundColor or foreGroundGradientShader determined by Bool useForeGroundGradient]
          foregroundStrokeGradientShader     : foregroundStrokeGradientShader,                                              // ForeGround Stroke border Gradient Shader
          backgroundStrokeGradientShader     : backgroundStrokeGradientShader,                                              // BackGround Stroke border Gradient Shader                       

          navMargin                          : navBarMargin,                                                                // Nav Margin
          backgroundBorderRadius             : backgroundBorderRadius,                                                      // Nav Background Border Radius

          selectedIconColor                  : red,                                                                         // Selected Item Icon Color
          selectedIconSize                   : 25,                                                                          // Selected Item Icon Size
          selectedTextSize                   : 10,                                                                          // Selected Item Text Size
          selectedTextColor                  : red,                                                                         // Selected Item Text Color
          unselectedIconColor                : white,                                                                       // UnSelected Item Icon Color
          unselectedIconSize                 : 25,                                                                          // UnSelected Item Icon Size
          unselectedTextSize                 : 10,                                                                          // UnSelected Item Text Size
          unselectedTextColor                : white,                                                                       // UnSelected Item Text Color

          showForeGroundStrokeAllSide        : showForeGroundStrokeAllSide,                                                 // Show Foreground Strok All Side
          showBackGroundStrokeAllSide        : showBackGroundStrokeAllSide,                                                 // Show BackGround Stroke All Side [works when borderRadius is zero or null]
          useForeGroundGradient              : useForeGroundGradient,                                                       // Gradient for ForeGround or Not
          showForeGround                     : showForeGround,                                                              // Show ForeGround or Not
          useForegroundShaderStroke          : useForegroundShaderStroke,                                                   // Use ForeGround Shadered Stroke Border or Not
          useBackgroundShaderStroke          : useBackgroundShaderStroke,                                                   // Use BackGround Shadered Stroke Border or Not
          underCurve                         : underCurve,                                                                  // Under Curve or Upper Curve
          staticCurve                        : staticCurve,                                                                 // Static Curve or Dynamic Curve
          showCircleStaticMidItemStatic      : showCircleStaticMidItem,                                                     // Show or Not Show Circle for Mid Item If Static Curve

          midItemCircleColorStatic           : black,                                                                       // Color of a Mid item circle for static item  
          midItemCircleBorderColorStatic     : white,                                                                       // Color of a Mid item border circle for static item
          showMidCircleStatic                : showMidCircleStatic,                                                                       // Show/Hide Mid item circle for static item
          midCircleRadiusStatic              : 20.0,                                                                        // Radius for Mid Circle
          midCircleBorderRadiusStatic        : 2.0,                                                                         // Radius for Mid Circle Border
          customSelectedItemDecor            : customSelectedItemDecor,                                                     // Custom Selected Item Decor
          customUnSelectedItemDecor          : customUnSelectedItemDecor,                                                   // Custom UnSelected Item Decor

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
