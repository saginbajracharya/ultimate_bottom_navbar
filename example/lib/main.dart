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

  int currentIndex                             = 2;
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
  Color backgroundColor                        = black.withOpacity(0.5); 
  double backgroundStrokeBorderWidth           = 2.0; 
  double foregroundStrokeBorderWidth           = 2.0;  
  BorderRadiusGeometry? backgroundBorderRadius = BorderRadius.circular(0.0);
  EdgeInsetsGeometry? navBarMargin             = const EdgeInsets.only(left: 0.0,right: 0.0,bottom: 0.0);
  var badgeVal1                                = '5';
  var badgeVal2                                = '55';
  var textDirection                            = TextDirection.ltr;
  Widget? customSelectedItemDecor;
  Widget? customUnSelectedItemDecor;
  Gradient? backgroundGradientColors;
  
  TextEditingController backgroundStrokeBorderWidthTxtCtrl = TextEditingController(text:'2.0');
  TextEditingController foregroundStrokeBorderWidthTxtCtrl = TextEditingController(text:'2.0');
  TextEditingController stepTxtCtrl                        = TextEditingController(text:'0.1');

  TextEditingController upperCurveWidthTxtCtrl             = TextEditingController(text:'0.16');
  TextEditingController leftX1UpperCurveCtrl               = TextEditingController(text:'0.20');
  TextEditingController leftY1UpperCurveCtrl               = TextEditingController(text:'0.0');
  TextEditingController leftX2UpperCurveCtrl               = TextEditingController(text:'10');
  TextEditingController leftY2UpperCurveCtrl               = TextEditingController(text:'0.12');
  TextEditingController leftX3UpperCurveCtrl               = TextEditingController(text:'0.5');
  TextEditingController leftY3UpperCurveCtrl               = TextEditingController(text:'0.12');
  TextEditingController rightX1UpperCurveCtrl              = TextEditingController(text:'10');
  TextEditingController rightY1UpperCurveCtrl              = TextEditingController(text:'0.12');
  TextEditingController rightX2UpperCurveCtrl              = TextEditingController(text:'0.20');
  TextEditingController rightY2UpperCurveCtrl              = TextEditingController(text:'0.0');
  TextEditingController rightX3UpperCurveCtrl              = TextEditingController(text:'0');
  TextEditingController rightY3UpperCurveCtrl              = TextEditingController(text:'0');

  TextEditingController upperStrokeCurveWidthTxtCtrl       = TextEditingController(text:'0.16');
  TextEditingController leftStrokeX1UpperCurveCtrl         = TextEditingController(text:'0.20');
  TextEditingController leftStrokeY1UpperCurveCtrl         = TextEditingController(text:'0.0');
  TextEditingController leftStrokeX2UpperCurveCtrl         = TextEditingController(text:'10');
  TextEditingController leftStrokeY2UpperCurveCtrl         = TextEditingController(text:'0.12');
  TextEditingController leftStrokeX3UpperCurveCtrl         = TextEditingController(text:'0.5');
  TextEditingController leftStrokeY3UpperCurveCtrl         = TextEditingController(text:'0.12');
  TextEditingController rightStrokeX1UpperCurveCtrl        = TextEditingController(text:'10');
  TextEditingController rightStrokeY1UpperCurveCtrl        = TextEditingController(text:'0.12');
  TextEditingController rightStrokeX2UpperCurveCtrl        = TextEditingController(text:'0.20');
  TextEditingController rightStrokeY2UpperCurveCtrl        = TextEditingController(text:'0.0');
  TextEditingController rightStrokeX3UpperCurveCtrl        = TextEditingController(text:'0');
  TextEditingController rightStrokeY3UpperCurveCtrl        = TextEditingController(text:'0');

  TextEditingController underCurveWidthTxtCtrl             = TextEditingController(text:'0.18');
  TextEditingController leftX1UnderCurveCtrl               = TextEditingController(text:'0.50');
  TextEditingController leftY1UnderCurveCtrl               = TextEditingController(text:'0.05');
  TextEditingController leftX2UnderCurveCtrl               = TextEditingController(text:'8');
  TextEditingController leftY2UnderCurveCtrl               = TextEditingController(text:'0.66');
  TextEditingController leftX3UnderCurveCtrl               = TextEditingController(text:'0.50');
  TextEditingController leftY3UnderCurveCtrl               = TextEditingController(text:'0.66');
  TextEditingController rightX1UnderCurveCtrl              = TextEditingController(text:'8');
  TextEditingController rightY1UnderCurveCtrl              = TextEditingController(text:'0.66');
  TextEditingController rightX2UnderCurveCtrl              = TextEditingController(text:'0.50');
  TextEditingController rightY2UnderCurveCtrl              = TextEditingController(text:'0.05');
  TextEditingController rightX3UnderCurveCtrl              = TextEditingController(text:'0');
  TextEditingController rightY3UnderCurveCtrl              = TextEditingController(text:'0');

  TextEditingController underStrokeCurveWidthTxtCtrl       = TextEditingController(text:'0.18');
  TextEditingController leftStrokeX1UnderCurveCtrl         = TextEditingController(text:'0.50');
  TextEditingController leftStrokeY1UnderCurveCtrl         = TextEditingController(text:'0.05');
  TextEditingController leftStrokeX2UnderCurveCtrl         = TextEditingController(text:'8');
  TextEditingController leftStrokeY2UnderCurveCtrl         = TextEditingController(text:'0.66');
  TextEditingController leftStrokeX3UnderCurveCtrl         = TextEditingController(text:'0.50');
  TextEditingController leftStrokeY3UnderCurveCtrl         = TextEditingController(text:'0.66');
  TextEditingController rightStrokeX1UnderCurveCtrl        = TextEditingController(text:'8');
  TextEditingController rightStrokeY1UnderCurveCtrl        = TextEditingController(text:'0.66');
  TextEditingController rightStrokeX2UnderCurveCtrl        = TextEditingController(text:'0.50');
  TextEditingController rightStrokeY2UnderCurveCtrl        = TextEditingController(text:'0.05');
  TextEditingController rightStrokeX3UnderCurveCtrl        = TextEditingController(text:'0');
  TextEditingController rightStrokeY3UnderCurveCtrl        = TextEditingController(text:'0');


  @override
  void initState() {
    super.initState();
    setData();
  }

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
  
  List<Map<String, dynamic>> upperCurveData = [];

  List<Map<String, dynamic>> underCurveData = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child:Directionality(
        textDirection: textDirection,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          resizeToAvoidBottomInset:false,
          backgroundColor: grey,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: kBottomNavigationBarHeight+50,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top:kBottomNavigationBarHeight),
                  child: pages[currentIndex],
                ),
                Container(
                  height: MediaQuery.of(context).size.height-kBottomNavigationBarHeight-kBottomNavigationBarHeight+10,
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
                        //Background Stroke Border Width
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              color: white.withOpacity(0.6),
                              child: Stack(
                                alignment : Alignment.center,
                                children: [
                                  Container(
                                    padding:const EdgeInsets.symmetric(horizontal:40.0,vertical:5.0),
                                    width: double.infinity,
                                    child: const Text(
                                      'Background Stroke Border Width',
                                      style: TextStyle(color: black,fontSize:18),
                                      textAlign: TextAlign.center,
                                    )
                                  ),
                                  Align(
                                    alignment : Alignment.centerRight,
                                    child:IconButton(
                                      padding : EdgeInsets.zero,
                                      icon: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: red
                                        ),
                                        child: const Icon(Icons.refresh)
                                      ),
                                      onPressed : (){
                                        setState(() {
                                          backgroundStrokeBorderWidthTxtCtrl.text = '2.0';
                                        });
                                      }
                                    )
                                  )
                                ],
                              )
                            ),
                            Card(
                              child: Stack(
                                children: [
                                  TextField(
                                    // readOnly: true,
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    controller: backgroundStrokeBorderWidthTxtCtrl,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20),
                                    decoration: const InputDecoration(
                                      hintText: 'Background Stroke Border Width',
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        double currentValue = double.tryParse(backgroundStrokeBorderWidthTxtCtrl.text) ?? 0.0;
                                        double newValue = currentValue - (double.tryParse(stepTxtCtrl.text)??0.0);
                                        // Update the TextField with the new value
                                        backgroundStrokeBorderWidthTxtCtrl.text = newValue.toStringAsFixed(2);
                                        // Optionally, you can also update the state if needed
                                        setState(() {
                                        });
                                      },
                                      icon: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: red
                                        ),
                                        child: const Icon(Icons.remove)
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        double currentValue = double.tryParse(backgroundStrokeBorderWidthTxtCtrl.text) ?? 0.0;
                                        double newValue = currentValue + (double.tryParse(stepTxtCtrl.text)??0.0);
                                        // Update the TextField with the new value
                                        backgroundStrokeBorderWidthTxtCtrl.text = newValue.toStringAsFixed(2);
                                        // Optionally, you can also update the state if needed
                                        setState(() {
                                        });
                                      },
                                      icon: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: red
                                        ),
                                        child: const Icon(Icons.add)
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                        //Foreground Stroke Border Width
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              color: white.withOpacity(0.6),
                              child: Stack(
                                alignment : Alignment.center,
                                children: [
                                  Container(
                                    padding:const EdgeInsets.symmetric(horizontal:40.0,vertical:5.0),
                                    width: double.infinity,
                                    child: const Text(
                                      'Foreground Stroke Border Width',
                                      style: TextStyle(color: black,fontSize:18),
                                      textAlign: TextAlign.center,
                                    )
                                  ),
                                  Align(
                                    alignment : Alignment.centerRight,
                                    child:IconButton(
                                      padding : EdgeInsets.zero,
                                      icon: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: red
                                        ),
                                        child: const Icon(Icons.refresh)
                                      ),
                                      onPressed : (){
                                        setState(() {
                                          foregroundStrokeBorderWidthTxtCtrl.text = '2.0';
                                        });
                                      }
                                    )
                                  )
                                ],
                              )
                            ),
                            Card(
                              child: Stack(
                                children: [
                                  TextField(
                                    // readOnly: true,
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    controller: foregroundStrokeBorderWidthTxtCtrl,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20),
                                    decoration: const InputDecoration(
                                      hintText: 'Foreground Stroke Border Width',
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        double currentValue = double.tryParse(foregroundStrokeBorderWidthTxtCtrl.text) ?? 0.0;
                                        double newValue = currentValue - (double.tryParse(stepTxtCtrl.text)??0.0);
                                        // Update the TextField with the new value
                                        foregroundStrokeBorderWidthTxtCtrl.text = newValue.toStringAsFixed(2);
                                        // Optionally, you can also update the state if needed
                                        setState(() {
                                        });
                                      },
                                      icon: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: red
                                        ),
                                        child: const Icon(Icons.remove)
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        double currentValue = double.tryParse(foregroundStrokeBorderWidthTxtCtrl.text) ?? 0.0;
                                        double newValue = currentValue + (double.tryParse(stepTxtCtrl.text)??0.0);
                                        // Update the TextField with the new value
                                        foregroundStrokeBorderWidthTxtCtrl.text = newValue.toStringAsFixed(2);
                                        // Optionally, you can also update the state if needed
                                        setState(() {
                                        });
                                      },
                                      icon: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: red
                                        ),
                                        child: const Icon(Icons.add)
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        //STEPS
                        const Divider(thickness: 2),
                        Text('STEP VALUE FOR + -',style: heading1Style,textAlign: TextAlign.center),
                        const Divider(thickness: 2),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              color: white.withOpacity(0.6),
                              child: Stack(
                                alignment : Alignment.center,
                                children: [
                                  Container(
                                    padding:const EdgeInsets.symmetric(horizontal:40.0,vertical:5.0),
                                    width: double.infinity,
                                    child: const Text(
                                      'Step TO INCREASE OR DECREASE',
                                      style: TextStyle(color: black,fontSize:18),
                                      textAlign: TextAlign.center,
                                    )
                                  ),
                                  Align(
                                    alignment : Alignment.centerRight,
                                    child:IconButton(
                                      padding : EdgeInsets.zero,
                                      icon: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: red
                                        ),
                                        child: const Icon(Icons.refresh)
                                      ),
                                      onPressed : (){
                                        stepTxtCtrl.text = '0.1';
                                      }
                                    )
                                  )
                                ],
                              )
                            ),
                            Card(
                              child: TextField(
                                // readOnly: true,
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                controller: stepTxtCtrl,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 20),
                                decoration: const InputDecoration(
                                  hintText: 'Step TO INCREASE OR DECREASE',
                                ),
                              ),
                            ),
                          ],
                        ),

                        //Upper Curve Controls
                        const Divider(thickness: 2),
                        Text('Upper Curve Controls',style: heading1Style,textAlign: TextAlign.center),
                        const Divider(thickness: 2),

                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: upperCurveData.length,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return curveControlTextFieldWidget(
                              upperCurveData[index]['title'],
                              upperCurveData[index]['textController'],
                              upperCurveData[index]['defaultValue'],
                              upperCurveData[index]['hintText'],
                            );
                          },
                        ),

                        //Upper Curve Controls
                        const Divider(thickness: 2),
                        Text('Under Curve Controls',style: heading1Style,textAlign: TextAlign.center),
                        const Divider(thickness: 2),

                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: underCurveData.length,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return curveControlTextFieldWidget(
                              underCurveData[index]['title'],
                              underCurveData[index]['textController'],
                              underCurveData[index]['defaultValue'],
                              underCurveData[index]['hintText'],
                            );
                          },
                        ),

                        //List Of All Available Properties
                        Text('Available Properties',style: heading1Style,textAlign: TextAlign.center),
                        const Divider(thickness: 2),
                        const PropertyTable(),
                        const SizedBox(
                          height: 100,
                        ),
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
            backgroundColor                    : white.withOpacity(0.8),                                                             // NavBar BackGround Color [backgroundGradient ovrerides color]
            foregroundColor                    : black,                                                                       // NavBar ForeGround Color with Curve 
            foregroundStrokeBorderColor        : red.withOpacity(0.8),                                                                        // Nav Stroke Border Color [useForegroundShaderStroke = false , strokeBorderWidth != 0]
            backgroundStrokeBorderColor        : red.withOpacity(0.8),                                                                         // nav background stroke color [seems like when border width is 0.0 still shows the color but transparent solves it]
            backgroundStrokeBorderWidth        : double.tryParse(backgroundStrokeBorderWidthTxtCtrl.text)??2.0,               // Nav BackGround Stroke Border Width
            foregroundStrokeBorderWidth        : double.tryParse(foregroundStrokeBorderWidthTxtCtrl.text)??2.0,               // Nav ForeGround Stroke Border Width  
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
            showMidCircleStatic                : showMidCircleStatic,                                                         // Show/Hide Mid item circle for static item
            midCircleRadiusStatic              : 20.0,                                                                        // Radius for Mid Circle
            midCircleBorderRadiusStatic        : 2.0,                                                                         // Radius for Mid Circle Border
            customSelectedItemDecor            : customSelectedItemDecor,                                                     // Custom Selected Item Decor
            customUnSelectedItemDecor          : customUnSelectedItemDecor,                                                   // Custom UnSelected Item Decor

            badgeData                          : [{'index': 1, 'value': badgeVal1},{'index': 4, 'value': badgeVal2}],         // Badge Data for Each Index with value
            badgeColor                         : red,                                                                         // Badge Color 
            badgeTextStyle                     : const TextStyle(color: white,fontSize: 8.0,overflow: TextOverflow.ellipsis), // Badge Text Style
            badgeCircleRadius                  : 8.0,                                                                         // Badge Circle Radius
            badgeTopPosition                   : 10.0,                                                                        // Badge Top Position
            badgeRightPosition                 : 16.0,                                                                        // Badge Right Position
            badgeBottomPosition                : null,                                                                        // Badge Bottom Position
            badgeLeftPosition                  : null,                                                                        // Badge Left Position
            
            backgroundHeight                   : kBottomNavigationBarHeight,                                                  
            foregroundHeight                   : kBottomNavigationBarHeight,

            animationType                      : Curves.bounceOut,                                                            // Index change animation curves
            animationDuration                  : const Duration(seconds: 1),                                                  // Index Change Animation duration for curve only
            onTap                              : (index) async => onItemTapped(index),                                        // Custom OnTap CallBacks
            //New
            upperCurveWidth                    : double.tryParse(upperCurveWidthTxtCtrl.text),                                
            leftX1UpperCurveCtrl               : double.tryParse(leftX1UpperCurveCtrl.text),
            leftY1UpperCurveCtrl               : double.tryParse(leftY1UpperCurveCtrl.text),
            leftX2UpperCurveCtrl               : double.tryParse(leftX2UpperCurveCtrl.text),
            leftY2UpperCurveCtrl               : double.tryParse(leftY2UpperCurveCtrl.text),
            leftX3UpperCurveCtrl               : double.tryParse(leftX3UpperCurveCtrl.text),
            leftY3UpperCurveCtrl               : double.tryParse(leftY3UpperCurveCtrl.text),
            rightX1UpperCurveCtrl              : double.tryParse(rightX1UpperCurveCtrl.text),
            rightY1UpperCurveCtrl              : double.tryParse(rightY1UpperCurveCtrl.text),
            rightX2UpperCurveCtrl              : double.tryParse(rightX2UpperCurveCtrl.text),
            rightY2UpperCurveCtrl              : double.tryParse(rightY2UpperCurveCtrl.text),
            rightX3UpperCurveCtrl              : double.tryParse(rightX3UpperCurveCtrl.text),
            rightY3UpperCurveCtrl              : double.tryParse(rightY3UpperCurveCtrl.text),
            upperStrokeCurveWidth              : double.tryParse(upperStrokeCurveWidthTxtCtrl.text),
            leftStrokeX1UpperCurveCtrl         : double.tryParse(leftStrokeX1UpperCurveCtrl.text),
            leftStrokeY1UpperCurveCtrl         : double.tryParse(leftStrokeY1UpperCurveCtrl.text),
            leftStrokeX2UpperCurveCtrl         : double.tryParse(leftStrokeX2UpperCurveCtrl.text),
            leftStrokeY2UpperCurveCtrl         : double.tryParse(leftStrokeY2UpperCurveCtrl.text),
            leftStrokeX3UpperCurveCtrl         : double.tryParse(leftStrokeX3UpperCurveCtrl.text),
            leftStrokeY3UpperCurveCtrl         : double.tryParse(leftStrokeY3UpperCurveCtrl.text),
            rightStrokeX1UpperCurveCtrl        : double.tryParse(rightStrokeX1UpperCurveCtrl.text),
            rightStrokeY1UpperCurveCtrl        : double.tryParse(rightStrokeY1UpperCurveCtrl.text),
            rightStrokeX2UpperCurveCtrl        : double.tryParse(rightStrokeX2UpperCurveCtrl.text),
            rightStrokeY2UpperCurveCtrl        : double.tryParse(rightStrokeY2UpperCurveCtrl.text),
            rightStrokeX3UpperCurveCtrl        : double.tryParse(rightStrokeX3UpperCurveCtrl.text),
            rightStrokeY3UpperCurveCtrl        : double.tryParse(rightStrokeY3UpperCurveCtrl.text),

            underCurveWidth                    : double.tryParse(underCurveWidthTxtCtrl.text),                                
            leftX1UnderCurveCtrl               : double.tryParse(leftX1UnderCurveCtrl.text),
            leftY1UnderCurveCtrl               : double.tryParse(leftY1UnderCurveCtrl.text),
            leftX2UnderCurveCtrl               : double.tryParse(leftX2UnderCurveCtrl.text),
            leftY2UnderCurveCtrl               : double.tryParse(leftY2UnderCurveCtrl.text),
            leftX3UnderCurveCtrl               : double.tryParse(leftX3UnderCurveCtrl.text),
            leftY3UnderCurveCtrl               : double.tryParse(leftY3UnderCurveCtrl.text),
            rightX1UnderCurveCtrl              : double.tryParse(rightX1UnderCurveCtrl.text),
            rightY1UnderCurveCtrl              : double.tryParse(rightY1UnderCurveCtrl.text),
            rightX2UnderCurveCtrl              : double.tryParse(rightX2UnderCurveCtrl.text),
            rightY2UnderCurveCtrl              : double.tryParse(rightY2UnderCurveCtrl.text),
            rightX3UnderCurveCtrl              : double.tryParse(rightX3UnderCurveCtrl.text),
            rightY3UnderCurveCtrl              : double.tryParse(rightY3UnderCurveCtrl.text),
            underStrokeCurveWidth              : double.tryParse(underStrokeCurveWidthTxtCtrl.text),
            leftStrokeX1UnderCurveCtrl         : double.tryParse(leftStrokeX1UnderCurveCtrl.text),
            leftStrokeY1UnderCurveCtrl         : double.tryParse(leftStrokeY1UnderCurveCtrl.text),
            leftStrokeX2UnderCurveCtrl         : double.tryParse(leftStrokeX2UnderCurveCtrl.text),
            leftStrokeY2UnderCurveCtrl         : double.tryParse(leftStrokeY2UnderCurveCtrl.text),
            leftStrokeX3UnderCurveCtrl         : double.tryParse(leftStrokeX3UnderCurveCtrl.text),
            leftStrokeY3UnderCurveCtrl         : double.tryParse(leftStrokeY3UnderCurveCtrl.text),
            rightStrokeX1UnderCurveCtrl        : double.tryParse(rightStrokeX1UnderCurveCtrl.text),
            rightStrokeY1UnderCurveCtrl        : double.tryParse(rightStrokeY1UnderCurveCtrl.text),
            rightStrokeX2UnderCurveCtrl        : double.tryParse(rightStrokeX2UnderCurveCtrl.text),
            rightStrokeY2UnderCurveCtrl        : double.tryParse(rightStrokeY2UnderCurveCtrl.text),
            rightStrokeX3UnderCurveCtrl        : double.tryParse(rightStrokeX3UnderCurveCtrl.text),
            rightStrokeY3UnderCurveCtrl        : double.tryParse(rightStrokeY3UnderCurveCtrl.text),
          ),
        ),
      )
    );
  }

  Widget curveControlTextFieldWidget(String title,TextEditingController textController,dynamic defaultValue,String hintText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: white.withOpacity(0.6),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal:40.0,vertical:5.0),
                width: double.infinity,
                child: Text(
                  title,
                  style: const TextStyle(color: black,fontSize:16),
                  textAlign: TextAlign.center,
                )
              ),
              Align(
                alignment : Alignment.centerRight,
                child:IconButton(
                  padding : EdgeInsets.zero,
                  icon: Container(
                    padding: const EdgeInsets.all(2),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: red
                    ),
                    child: const Icon(Icons.refresh)
                  ),
                  onPressed : (){
                    setState(() {
                      textController.text = defaultValue;
                    });
                  }
                )
              )
            ],
          )
        ),
        Card(
          child: Stack(
            children: [
              TextField(
                // readOnly: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                controller: textController,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: hintText,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    double currentValue = double.tryParse(textController.text) ?? 0.0;
                    double newValue = currentValue - (double.tryParse(stepTxtCtrl.text)??0.0);
                    // Update the TextField with the new value
                    textController.text = newValue.toStringAsFixed(2);
                    // Optionally, you can also update the state if needed
                    setState(() {
                    });
                  },
                  icon: Container(
                    padding: const EdgeInsets.all(2),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: red
                    ),
                    child: const Icon(Icons.remove)
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    double currentValue = double.tryParse(textController.text) ?? 0.0;
                    double newValue = currentValue + (double.tryParse(stepTxtCtrl.text)??0.0);
                    // Update the TextField with the new value
                    textController.text = newValue.toStringAsFixed(2);
                    // Optionally, you can also update the state if needed
                    setState(() {
                    });
                  },
                  icon: Container(
                    padding: const EdgeInsets.all(2),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: red
                    ),
                    child: const Icon(Icons.add)
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider()
      ],
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

  setData(){
    upperCurveData = [
      //UPPER CURVE CONTROLS
      {
        'title': 'upperCurveWidthTxtCtrl',
        'textController': upperCurveWidthTxtCtrl,
        'defaultValue': '0.16',
        'hintText': 'upperCurveWidthTxtCtrl',
      },
      {
        'title': 'leftX1UpperCurveCtrl',
        'textController' : leftX1UpperCurveCtrl,
        'defaultValue': '0.20',
        'hintText': 'leftX1UpperCurveCtrl',
      },
      {
        'title': 'leftY1UpperCurveCtrl',
        'textController' : leftY1UpperCurveCtrl,
        'defaultValue': '0.0',
        'hintText': 'leftY1UpperCurveCtrl',         
      },
      {
        'title': 'leftX2UpperCurveCtrl',
        'textController' : leftX2UpperCurveCtrl,
        'defaultValue': '10',
        'hintText': 'leftX2UpperCurveCtrl',         
      },
      {
        'title': 'leftY2UpperCurveCtrl',
        'textController' : leftY2UpperCurveCtrl,
        'defaultValue': '0.12',
        'hintText': 'leftY2UpperCurveCtrl',         
      },
      {
        'title': 'leftX3UpperCurveCtrl',
        'textController' : leftX3UpperCurveCtrl,
        'defaultValue': '0.5',
        'hintText': 'leftX3UpperCurveCtrl',         
      },  
      {
        'title': 'leftY3UpperCurveCtrl',
        'textController' : leftY3UpperCurveCtrl,
        'defaultValue': '0.12',
        'hintText': 'leftY3UpperCurveCtrl',         
      },  
      {
        'title': 'rightX1UpperCurveCtrl',
        'textController' : rightX1UpperCurveCtrl,
        'defaultValue': '10',
        'hintText': 'rightX1UpperCurveCtrl',         
      },
      {
        'title': 'rightY1UpperCurveCtrl',
        'textController' : rightY1UpperCurveCtrl,
        'defaultValue': '0.12',
        'hintText': 'rightY1UpperCurveCtrl',         
      }, 
      {
        'title': 'rightX2UpperCurveCtrl',
        'textController' : rightX2UpperCurveCtrl,
        'defaultValue': '0.20',
        'hintText': 'rightX2UpperCurveCtrl',         
      }, 
      {
        'title': 'rightY2UpperCurveCtrl',
        'textController' : rightY2UpperCurveCtrl,
        'defaultValue': '0.0',
        'hintText': 'rightY2UpperCurveCtrl',         
      }, 
      {
        'title': 'rightX3UpperCurveCtrl',
        'textController' : rightX3UpperCurveCtrl,
        'defaultValue': '0',
        'hintText': 'rightX3UpperCurveCtrl',         
      }, 
      {
        'title': 'rightY3UpperCurveCtrl',
        'textController' : rightY3UpperCurveCtrl,
        'defaultValue': '0',
        'hintText': 'rightY3UpperCurveCtrl',         
      },  

      //UPPER STROKE CURVE CONTROL

      {
        'title': 'upperStrokeCurveWidthTxtCtrl',
        'textController': upperStrokeCurveWidthTxtCtrl,
        'defaultValue': '0.16',
        'hintText': 'upperStrokeCurveWidthTxtCtrl',
      },
      {
        'title': 'leftStrokeX1UpperCurveCtrl',
        'textController' : leftStrokeX1UpperCurveCtrl,
        'defaultValue': '0.20',
        'hintText': 'leftStrokeX1UpperCurveCtrl',
      },
      {
        'title': 'leftStrokeY1UpperCurveCtrl',
        'textController' : leftStrokeY1UpperCurveCtrl,
        'defaultValue': '0.0',
        'hintText': 'leftStrokeY1UpperCurveCtrl',         
      },
      {
        'title': 'leftStrokeX2UpperCurveCtrl',
        'textController' : leftStrokeX2UpperCurveCtrl,
        'defaultValue': '10',
        'hintText': 'leftStrokeX2UpperCurveCtrl',         
      },
      {
        'title': 'leftStrokeY2UpperCurveCtrl',
        'textController' : leftStrokeY2UpperCurveCtrl,
        'defaultValue': '0.12',
        'hintText': 'leftStrokeY2UpperCurveCtrl',         
      },
      {
        'title': 'leftStrokeX3UpperCurveCtrl',
        'textController' : leftStrokeX3UpperCurveCtrl,
        'defaultValue': '0.5',
        'hintText': 'leftStrokeX3UpperCurveCtrl',         
      },  
      {
        'title': 'leftStrokeY3UpperCurveCtrl',
        'textController' : leftStrokeY3UpperCurveCtrl,
        'defaultValue': '0.12',
        'hintText': 'leftStrokeY3UpperCurveCtrl',         
      },  
      {
        'title': 'rightStrokeX1UpperCurveCtrl',
        'textController' : rightStrokeX1UpperCurveCtrl,
        'defaultValue': '10',
        'hintText': 'rightStrokeX1UpperCurveCtrl',         
      },
      {
        'title': 'rightStrokeY1UpperCurveCtrl',
        'textController' : rightStrokeY1UpperCurveCtrl,
        'defaultValue': '0.12',
        'hintText': 'rightStrokeY1UpperCurveCtrl',         
      }, 
      {
        'title': 'rightStrokeX2UpperCurveCtrl',
        'textController' : rightStrokeX2UpperCurveCtrl,
        'defaultValue': '0.20',
        'hintText': 'rightStrokeX2UpperCurveCtrl',         
      }, 
      {
        'title': 'rightStrokeY2UpperCurveCtrl',
        'textController' : rightStrokeY2UpperCurveCtrl,
        'defaultValue': '0.0',
        'hintText': 'rightStrokeY2UpperCurveCtrl',         
      }, 
      {
        'title': 'rightStrokeX3UpperCurveCtrl',
        'textController' : rightStrokeX3UpperCurveCtrl,
        'defaultValue': '0',
        'hintText': 'rightStrokeX3UpperCurveCtrl',         
      }, 
      {
        'title': 'rightStrokeY3UpperCurveCtrl',
        'textController' : rightStrokeY3UpperCurveCtrl,
        'defaultValue': '0',
        'hintText': 'rightStrokeY3UpperCurveCtrl',         
      },            
    ];

    underCurveData = [
      //UNDER CURVE CONTROLS
      {
        'title': 'underCurveWidthTxtCtrl',
        'textController': underCurveWidthTxtCtrl,
        'defaultValue': '0.18',
        'hintText': 'underCurveWidthTxtCtrl',
      },
      {
        'title': 'leftX1UnderCurveCtrl',
        'textController' : leftX1UnderCurveCtrl,
        'defaultValue': '0.50',
        'hintText': 'leftX1UnderCurveCtrl',
      },
      {
        'title': 'leftY1UnderCurveCtrl',
        'textController' : leftY1UnderCurveCtrl,
        'defaultValue': '0.05',
        'hintText': 'leftY1UnderCurveCtrl',         
      },
      {
        'title': 'leftX2UnderCurveCtrl',
        'textController' : leftX2UnderCurveCtrl,
        'defaultValue': '8',
        'hintText': 'leftX2UnderCurveCtrl',         
      },
      {
        'title': 'leftY2UnderCurveCtrl',
        'textController' : leftY2UnderCurveCtrl,
        'defaultValue': '0.66',
        'hintText': 'leftY2UnderCurveCtrl',         
      },
      {
        'title': 'leftX3UnderCurveCtrl',
        'textController' : leftX3UnderCurveCtrl,
        'defaultValue': '0.50',
        'hintText': 'leftX3UnderCurveCtrl',         
      },  
      {
        'title': 'leftY3UnderCurveCtrl',
        'textController' : leftY3UnderCurveCtrl,
        'defaultValue': '0.66',
        'hintText': 'leftY3UnderCurveCtrl',         
      },  
      {
        'title': 'rightX1UnderCurveCtrl',
        'textController' : rightX1UnderCurveCtrl,
        'defaultValue': '8',
        'hintText': 'rightX1UnderCurveCtrl',         
      },
      {
        'title': 'rightY1UnderCurveCtrl',
        'textController' : rightY1UnderCurveCtrl,
        'defaultValue': '0.66',
        'hintText': 'rightY1UnderCurveCtrl',         
      }, 
      {
        'title': 'rightX2UnderCurveCtrl',
        'textController' : rightX2UnderCurveCtrl,
        'defaultValue': '0.50',
        'hintText': 'rightX2UnderCurveCtrl',         
      }, 
      {
        'title': 'rightY2UnderCurveCtrl',
        'textController' : rightY2UnderCurveCtrl,
        'defaultValue': '0.05',
        'hintText': 'rightY2UnderCurveCtrl',         
      }, 
      {
        'title': 'rightX3UnderCurveCtrl',
        'textController' : rightX3UnderCurveCtrl,
        'defaultValue': '0',
        'hintText': 'rightX3UnderCurveCtrl',         
      }, 
      {
        'title': 'rightY3UnderCurveCtrl',
        'textController' : rightY3UnderCurveCtrl,
        'defaultValue': '0',
        'hintText': 'rightY3UnderCurveCtrl',         
      },  

      //UNDER STROKE CURVE CONTROL

      {
        'title': 'underStrokeCurveWidthTxtCtrl',
        'textController': underStrokeCurveWidthTxtCtrl,
        'defaultValue': '0.18',
        'hintText': 'underStrokeCurveWidthTxtCtrl',
      },
      {
        'title': 'leftStrokeX1UnderCurveCtrl',
        'textController' : leftStrokeX1UnderCurveCtrl,
        'defaultValue': '0.50',
        'hintText': 'leftStrokeX1UnderCurveCtrl',
      },
      {
        'title': 'leftStrokeY1UnderCurveCtrl',
        'textController' : leftStrokeY1UnderCurveCtrl,
        'defaultValue': '0.05',
        'hintText': 'leftStrokeY1UnderCurveCtrl',         
      },
      {
        'title': 'leftStrokeX2UnderCurveCtrl',
        'textController' : leftStrokeX2UnderCurveCtrl,
        'defaultValue': '8',
        'hintText': 'leftStrokeX2UnderCurveCtrl',         
      },
      {
        'title': 'leftStrokeY2UnderCurveCtrl',
        'textController' : leftStrokeY2UnderCurveCtrl,
        'defaultValue': '0.66',
        'hintText': 'leftStrokeY2UnderCurveCtrl',         
      },
      {
        'title': 'leftStrokeX3UnderCurveCtrl',
        'textController' : leftStrokeX3UnderCurveCtrl,
        'defaultValue': '0.50',
        'hintText': 'leftStrokeX3UnderCurveCtrl',         
      },  
      {
        'title': 'leftStrokeY3UnderCurveCtrl',
        'textController' : leftStrokeY3UnderCurveCtrl,
        'defaultValue': '0.66',
        'hintText': 'leftStrokeY3UnderCurveCtrl',         
      },  
      {
        'title': 'rightStrokeX1UnderCurveCtrl',
        'textController' : rightStrokeX1UnderCurveCtrl,
        'defaultValue': '8',
        'hintText': 'rightStrokeX1UnderCurveCtrl',         
      },
      {
        'title': 'rightStrokeY1UnderCurveCtrl',
        'textController' : rightStrokeY1UnderCurveCtrl,
        'defaultValue': '0.66',
        'hintText': 'rightStrokeY1UnderCurveCtrl',         
      }, 
      {
        'title': 'rightStrokeX2UnderCurveCtrl',
        'textController' : rightStrokeX2UnderCurveCtrl,
        'defaultValue': '0.50',
        'hintText': 'rightStrokeX2UnderCurveCtrl',         
      }, 
      {
        'title': 'rightStrokeY2UnderCurveCtrl',
        'textController' : rightStrokeY2UnderCurveCtrl,
        'defaultValue': '0.05',
        'hintText': 'rightStrokeY2UnderCurveCtrl',         
      }, 
      {
        'title': 'rightStrokeX3UnderCurveCtrl',
        'textController' : rightStrokeX3UnderCurveCtrl,
        'defaultValue': '0',
        'hintText': 'rightStrokeX3UnderCurveCtrl',         
      }, 
      {
        'title': 'rightStrokeY3UnderCurveCtrl',
        'textController' : rightStrokeY3UnderCurveCtrl,
        'defaultValue': '0',
        'hintText': 'rightStrokeY3UnderCurveCtrl',         
      },     
    ];
  }
}