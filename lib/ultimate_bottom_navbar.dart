library ultimate_bottom_navbar;
import 'package:flutter/material.dart';
import 'Background_Curves_Painter_Widget/nav_background_stroke_border.dart';
import 'Button_Widgets/nav_button_widget.dart';
import 'Foreground_Curves_Under_Upper_Painter_Widget/nav_foreground_curve_under.dart';
import 'Foreground_Curves_Under_Upper_Painter_Widget/nav_foreground_curve_upper.dart';
import 'utils/styles.dart';

class UltimateBottomNavBar extends StatefulWidget {
  final List<IconData> icons;
  final List<String> titles;
  final int currentIndex;
  final Color? backgroundColor;
  final Color foregroundColor;
  final Color foregroundStrokeBorderColor;
  final Color backgroundStrokeBorderColor;
  final double foregroundStrokeBorderWidth;
  final double backgroundStrokeBorderWidth;
  final Gradient? backgroundGradient;
  final Shader? foreGroundGradientShader;
  final Shader? foregroundStrokeGradientShader;
  final Shader? backgroundStrokeGradientShader;

  final EdgeInsetsGeometry? navMargin;
  final BorderRadiusGeometry? backgroundBorderRadius;

  final Color? selectedIconColor;
  final double? selectedIconSize;   
  final double? selectedTextSize;  
  final Color? selectedTextColor;
  final Color? unselectedIconColor;
  final double? unselectedIconSize;   
  final double? unselectedTextSize;  
  final Color? unselectedTextColor;

  final bool showForeGroundStrokeAllSide;
  final bool showBackGroundStrokeAllSide;
  final bool useForeGroundGradient;
  final bool showForeGround;
  final bool useForegroundShaderStroke;
  final bool useBackgroundShaderStroke;
  final bool underCurve;
  final bool staticCurve;
  final bool showCircleStaticMidItemStatic;
  final Color midItemCircleColorStatic;
  final Color midItemCircleBorderColorStatic;
  final bool showMidCircleStatic;
  final double midCircleRadiusStatic;
  final double midCircleBorderRadiusStatic;
  final Widget? customSelectedItemDecor;
  final Widget? customUnSelectedItemDecor;

  //New
  final double? upperCurveWidth;
  final double? leftX1UpperCurveCtrl;
  final double? leftY1UpperCurveCtrl;
  final double? leftX2UpperCurveCtrl;
  final double? leftY2UpperCurveCtrl;
  final double? leftX3UpperCurveCtrl;
  final double? leftY3UpperCurveCtrl;
  final double? rightX1UpperCurveCtrl;
  final double? rightY1UpperCurveCtrl;
  final double? rightX2UpperCurveCtrl;
  final double? rightY2UpperCurveCtrl;
  final double? rightX3UpperCurveCtrl;
  final double? rightY3UpperCurveCtrl;

  final double? upperStrokeCurveWidth;
  final double? leftStrokeX1UpperCurveCtrl;
  final double? leftStrokeY1UpperCurveCtrl;
  final double? leftStrokeX2UpperCurveCtrl;
  final double? leftStrokeY2UpperCurveCtrl;
  final double? leftStrokeX3UpperCurveCtrl;
  final double? leftStrokeY3UpperCurveCtrl;
  final double? rightStrokeX1UpperCurveCtrl;
  final double? rightStrokeY1UpperCurveCtrl;
  final double? rightStrokeX2UpperCurveCtrl;
  final double? rightStrokeY2UpperCurveCtrl;
  final double? rightStrokeX3UpperCurveCtrl;
  final double? rightStrokeY3UpperCurveCtrl;

  final double? underCurveWidth;
  final double? leftX1UnderCurveCtrl;
  final double? leftY1UnderCurveCtrl;
  final double? leftX2UnderCurveCtrl;
  final double? leftY2UnderCurveCtrl;
  final double? leftX3UnderCurveCtrl;
  final double? leftY3UnderCurveCtrl;
  final double? rightX1UnderCurveCtrl;
  final double? rightY1UnderCurveCtrl;
  final double? rightX2UnderCurveCtrl;
  final double? rightY2UnderCurveCtrl;
  final double? rightX3UnderCurveCtrl;
  final double? rightY3UnderCurveCtrl;

  final double? underStrokeCurveWidth;
  final double? leftStrokeX1UnderCurveCtrl;
  final double? leftStrokeY1UnderCurveCtrl;
  final double? leftStrokeX2UnderCurveCtrl;
  final double? leftStrokeY2UnderCurveCtrl;
  final double? leftStrokeX3UnderCurveCtrl;
  final double? leftStrokeY3UnderCurveCtrl;
  final double? rightStrokeX1UnderCurveCtrl;
  final double? rightStrokeY1UnderCurveCtrl;
  final double? rightStrokeX2UnderCurveCtrl;
  final double? rightStrokeY2UnderCurveCtrl;
  final double? rightStrokeX3UnderCurveCtrl;
  final double? rightStrokeY3UnderCurveCtrl;
  //

  final List<Map<String,dynamic>>? badgeData;
  final Color? badgeColor;
  final TextStyle? badgeTextStyle;
  final double? badgeCircleRadius;
  final double? badgeTopPosition;
  final double? badgeBottomPosition;
  final double? badgeLeftPosition;
  final double? badgeRightPosition;

  final double? backgroundHeight;
  final double? foregroundHeight;

  final Curve animationType;
  final Duration animationDuration;
  final ValueChanged<int>? onTap;
  
  const UltimateBottomNavBar({Key? key,
    required this.icons,                                                        // Required
    required this.titles,                                                       // Required
    required this.currentIndex,                                                 // Required
    this.backgroundColor                   = transparent,                       // Default background Color Null
    this.foregroundColor                   = grey,                              // Default foreground Color White
    this.foregroundStrokeBorderColor       = black,                             // Default foreground Stroke Border Color White
    this.backgroundStrokeBorderColor       = black,                             // Default background Stroke Border Color White
    this.backgroundStrokeBorderWidth       = 1.0,                               // Default Nav BackGround Stroke Border Width
    this.foregroundStrokeBorderWidth       = 1.0,                               // Default Nav ForeGround Stroke Border Width
    this.backgroundGradient,                                                    // Default background Gradient Null
    this.foreGroundGradientShader,                                              // Default foreGround Gradient Shader Null
    this.foregroundStrokeGradientShader,                                        // Default foreground Stroke Gradient Shader Null
    this.backgroundStrokeGradientShader,                                        // Default background Stroke Gradient Shader Null

    this.navMargin                         = EdgeInsets.zero,                   // Default Background Margin Zero
    this.backgroundBorderRadius            = BorderRadius.zero,                 // Default Background Border Radius Zero

    this.selectedIconColor                 = white,                             // Default selectedIconColor white
    this.selectedIconSize                  = 26.0,                              // Default selectedIconSize 26.0
    this.selectedTextSize                  = 11.0,                              // Default selectedTextSize 11.0
    this.selectedTextColor                 = white,                             // Default selectedTextColor white
    this.unselectedIconColor               = black,                             // Default unselectedIconColor black
    this.unselectedIconSize                = 24.0,                              // Default unselectedIconSize 24.0
    this.unselectedTextSize                = 10.0,                              // Default unselectedTextSize 10.0
    this.unselectedTextColor               = black,                             // Default unselectedTextColor black

    this.showForeGroundStrokeAllSide       = false,                             // Default showForeGroundStrokeAllSide False
    this.showBackGroundStrokeAllSide       = false,                             // Default showForeGroundStrokeAllSide False
    this.useForeGroundGradient             = false,                             // Default useForeGroundGradient false
    this.showForeGround                    = true,                              // Default showForeGround true
    this.useForegroundShaderStroke         = false,                             // Default useForegroundShaderStroke false
    this.useBackgroundShaderStroke         = false,                             // Default useBackgroundShaderStroke false
    this.underCurve                        = true,                              // Default underCurve true
    this.staticCurve                       = false,                             // Default staticCurve false
    this.showCircleStaticMidItemStatic     = true,                              // Default showCircleStaticMidItemStatic true
    this.midItemCircleColorStatic          = white,                             // Default midItemCircleColorStatic white
    this.midItemCircleBorderColorStatic    = black,                             // Default midItemCircleBorderColorStatic black
    this.showMidCircleStatic               = true,                              // Default showMidCircleStatic true
    this.midCircleRadiusStatic             = 25.0,                              // Default midCircleRadiusStatic 25.0
    this.midCircleBorderRadiusStatic       = 2.0,                               // Default midCircleBorderRadiusStatic 2.0
    this.customSelectedItemDecor,                                               // Default customSelectedItemDecor Null
    this.customUnSelectedItemDecor,                                             // Default customUnSelectedItemDecor Null
    
    //Upper Curve Controls New
    this.upperCurveWidth,
    this.leftX1UpperCurveCtrl,
    this.leftY1UpperCurveCtrl,
    this.leftX2UpperCurveCtrl,
    this.leftY2UpperCurveCtrl,
    this.leftX3UpperCurveCtrl,
    this.leftY3UpperCurveCtrl,
    this.rightX1UpperCurveCtrl,
    this.rightY1UpperCurveCtrl,
    this.rightX2UpperCurveCtrl,
    this.rightY2UpperCurveCtrl,
    this.rightX3UpperCurveCtrl,
    this.rightY3UpperCurveCtrl,
    this.upperStrokeCurveWidth,
    this.leftStrokeX1UpperCurveCtrl,
    this.leftStrokeY1UpperCurveCtrl,
    this.leftStrokeX2UpperCurveCtrl,
    this.leftStrokeY2UpperCurveCtrl,
    this.leftStrokeX3UpperCurveCtrl,
    this.leftStrokeY3UpperCurveCtrl,
    this.rightStrokeX1UpperCurveCtrl,
    this.rightStrokeY1UpperCurveCtrl,
    this.rightStrokeX2UpperCurveCtrl,
    this.rightStrokeY2UpperCurveCtrl,
    this.rightStrokeX3UpperCurveCtrl,
    this.rightStrokeY3UpperCurveCtrl,


    //Under Curve Controls New
    this.underCurveWidth,
    this.leftX1UnderCurveCtrl,
    this.leftY1UnderCurveCtrl,
    this.leftX2UnderCurveCtrl,
    this.leftY2UnderCurveCtrl,
    this.leftX3UnderCurveCtrl,
    this.leftY3UnderCurveCtrl,
    this.rightX1UnderCurveCtrl,
    this.rightY1UnderCurveCtrl,
    this.rightX2UnderCurveCtrl,
    this.rightY2UnderCurveCtrl,
    this.rightX3UnderCurveCtrl,
    this.rightY3UnderCurveCtrl,

    this.underStrokeCurveWidth,
    this.leftStrokeX1UnderCurveCtrl,
    this.leftStrokeY1UnderCurveCtrl,
    this.leftStrokeX2UnderCurveCtrl,
    this.leftStrokeY2UnderCurveCtrl,
    this.leftStrokeX3UnderCurveCtrl,
    this.leftStrokeY3UnderCurveCtrl,
    this.rightStrokeX1UnderCurveCtrl,
    this.rightStrokeY1UnderCurveCtrl,
    this.rightStrokeX2UnderCurveCtrl,
    this.rightStrokeY2UnderCurveCtrl,
    this.rightStrokeX3UnderCurveCtrl,
    this.rightStrokeY3UnderCurveCtrl,
    //

    this.badgeData,
    this.badgeColor                        = red,                               // Default badgeColor red
    this.badgeTextStyle                    = const TextStyle(),                 // Default badgeTextStyle TextStyle 
    this.badgeCircleRadius                 = 8.0,                               // Default badgeCircleRadius 8.0
    this.badgeTopPosition                  = 10.0,                              // Default badgeTopPosition 10.0
    this.badgeBottomPosition               = 16.0,                              // Default badgeBottomPosition 16.0
    this.badgeLeftPosition,                                                     // Default badgeLeftPosition Null
    this.badgeRightPosition,                                                    // Default badgeRightPosition Null
    this.backgroundHeight                  = kBottomNavigationBarHeight,
    this.foregroundHeight                  = kBottomNavigationBarHeight, 
    
    this.animationType                     = Curves.easeOut,                    // Default animationType easeOut
    this.animationDuration                 = const Duration(milliseconds: 500), // Default animationDuration 500ms
    this.onTap,                                                                 // Default onTap Null
  }) : super(key: key);

  @override
  UltimateBottomNavBarState createState() => UltimateBottomNavBarState();
}

class UltimateBottomNavBarState extends State<UltimateBottomNavBar> with TickerProviderStateMixin{
  late double _startingPos;
  int _endingIndex = 0;
  late double _pos;
  late IconData icon;
  late AnimationController _animationController;
  late int _length;

  @override
  void initState() {
    super.initState();
    icon = widget.icons[widget.currentIndex];
    _length = widget.icons.length;
    _pos = widget.currentIndex / _length;
    _startingPos = widget.currentIndex / _length;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController.addListener(() {
      setState(() {
        _pos = _animationController.value;
        final endingPos = _endingIndex / widget.icons.length;
        if ((endingPos - _pos).abs() < (_startingPos - _pos).abs()) {
          icon = widget.icons[_endingIndex];
        }
      });
    });
  }

  @override
  void didUpdateWidget (UltimateBottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      setState(() {
        final newPosition = widget.currentIndex / _length;
        _startingPos = _pos;
        _endingIndex = widget.currentIndex;
        _animationController.animateTo(
          newPosition,
          duration: widget.animationDuration, 
          curve: widget.animationType
        );
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.backgroundHeight,
      margin: widget.navMargin,
      color: transparent,
      child: CustomPaint(
        painter: widget.backgroundStrokeBorderWidth==0.0
        ?null
        :NavBackgroundStrokeBorderPainter(
          _pos, 
          _length, 
          widget.backgroundStrokeBorderWidth,
          widget.useBackgroundShaderStroke,
          widget.showBackGroundStrokeAllSide,
          widget.backgroundStrokeBorderColor, 
          widget.backgroundStrokeGradientShader,
          Directionality.of(context),
          widget.backgroundBorderRadius
        ),
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            gradient:widget.backgroundGradient,
            borderRadius: widget.backgroundBorderRadius,
          ),
          height: 20.0 + (widget.foregroundHeight ?? 0.0),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.zero,
          child: widget.staticCurve
          ?staticBottomNavWidget(context)
          :dynamicBottomNavWidget(context),
        ),
      ),
    );
  }

  staticBottomNavWidget(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        // Nav ForeGround With Curve
        widget.showForeGround
        ?Positioned(
          left: 0,
          right: 0,
          bottom: 0 - (75.0 - kBottomNavigationBarHeight),
          child:staticCurve(context)
        )
        :const SizedBox(),
        // Icons
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: 0,
          child: SizedBox(
            height: 100.0,
            child: Row(
              children: widget.icons.map((icon) {
              return StaticNavBarButton(
                onTap                             : _buttonTap,
                length                            : _length,
                index                             : widget.icons.indexOf(icon),
                title                             : widget.titles[widget.icons.indexOf(icon)],
                currentIndex                      : widget.currentIndex,
                showForeGround                    : widget.showForeGround,
                icon                              : icon, 
                selectedIconColor                 : widget.selectedIconColor, 
                selectedIconSize                  : widget.selectedIconSize, 
                selectedTextColor                 : widget.selectedTextColor, 
                selectedTextSize                  : widget.selectedTextSize, 
                unselectedIconColor               : widget.unselectedIconColor, 
                unselectedIconSize                : widget.unselectedIconSize, 
                unselectedTextColor               : widget.unselectedTextColor, 
                unselectedTextSize                : widget.unselectedTextSize,
                midItemCircleColorStatic          : widget.midItemCircleColorStatic, 
                midItemCircleBorderColorStatic    : widget.midItemCircleBorderColorStatic, 
                showMidCircleStatic               : widget.showMidCircleStatic, 
                midCircleRadiusStatic             : widget.midCircleRadiusStatic, 
                midCircleBorderRadiusStatic       : widget.midCircleBorderRadiusStatic,
                customSelectedItemDecor           : widget.customSelectedItemDecor,
                customUnSelectedItemDecor         : widget.customUnSelectedItemDecor,
                badgeData                         : widget.badgeData,
                badgeColor                        : widget.badgeColor,                               
                badgeTextStyle                    : widget.badgeTextStyle,                 
                badgeCircleRadius                 : widget.badgeCircleRadius,                               
                badgeTopPosition                  : widget.badgeTopPosition,                              
                badgeBottomPosition               : widget.badgeBottomPosition,                              
                badgeLeftPosition                 : widget.badgeLeftPosition,
                badgeRightPosition                : widget.badgeRightPosition, 
              );
            }).toList())
          ),
        ),
      ],
    );
  }

  dynamicBottomNavWidget(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        // Nav ForeGround With Curve
        widget.showForeGround
        ?Positioned(
          left: 0,
          right: 0,
          bottom: 0 - (75.0 - kBottomNavigationBarHeight),
          child: dynamicCurve(context),
        )
        :const SizedBox(),
        // Icons
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: 0,
          child: SizedBox(
            height: 100.0,
            child: Row(
              children: widget.icons.map((icon) {
              return DynamicNavBarButton(
                onTap                             : _buttonTap,
                position                          : _pos,
                length                            : _length,
                index                             : widget.icons.indexOf(icon),
                title                             : widget.titles[widget.icons.indexOf(icon)],
                currentIndex                      : widget.currentIndex,
                showForeGround                    : widget.showForeGround,
                icon                              : icon,
                selectedIconColor                 : widget.selectedIconColor, 
                selectedIconSize                  : widget.selectedIconSize, 
                selectedTextColor                 : widget.selectedTextColor, 
                selectedTextSize                  : widget.selectedTextSize, 
                unselectedIconColor               : widget.unselectedIconColor, 
                unselectedIconSize                : widget.unselectedIconSize, 
                unselectedTextColor               : widget.unselectedTextColor, 
                unselectedTextSize                : widget.unselectedTextSize,
                customSelectedItemDecor           : widget.customSelectedItemDecor,
                customUnSelectedItemDecor         : widget.customUnSelectedItemDecor,
                badgeData                         : widget.badgeData,
                badgeColor                        : widget.badgeColor,                               
                badgeTextStyle                    : widget.badgeTextStyle,                 
                badgeCircleRadius                 : widget.badgeCircleRadius,                               
                badgeTopPosition                  : widget.badgeTopPosition,                              
                badgeBottomPosition               : widget.badgeBottomPosition,                              
                badgeLeftPosition                 : widget.badgeLeftPosition,
                badgeRightPosition                : widget.badgeRightPosition,
              );
            }).toList())
          ),
        ),
      ],
    );
  }

  CustomPaint staticCurve(BuildContext context){
    return CustomPaint(
      painter: widget.underCurve
      ?NavForeGroundCurvePainterUnderStatic(
        _pos, 
        _length, 
        widget.useForeGroundGradient,
        widget.foreGroundGradientShader,
        widget.foregroundColor, 
        Directionality.of(context),
        widget.underCurveWidth,
        widget.leftX1UnderCurveCtrl,
        widget.leftY1UnderCurveCtrl,
        widget.leftX2UnderCurveCtrl,
        widget.leftY2UnderCurveCtrl,
        widget.leftX3UnderCurveCtrl,
        widget.leftY3UnderCurveCtrl,
        widget.rightX1UnderCurveCtrl,
        widget.rightY1UnderCurveCtrl,
        widget.rightX2UnderCurveCtrl,
        widget.rightY2UnderCurveCtrl,
        widget.rightX3UnderCurveCtrl,
        widget.rightY3UnderCurveCtrl,
      )
      :NavForeGroundCurvePainterUpperStatic(
        _pos, 
        _length, 
        widget.useForeGroundGradient,
        widget.foreGroundGradientShader,
        widget.foregroundColor, 
        Directionality.of(context),
        widget.upperCurveWidth,
        widget.leftX1UpperCurveCtrl,
        widget.leftY1UpperCurveCtrl,
        widget.leftX2UpperCurveCtrl,
        widget.leftY2UpperCurveCtrl,
        widget.leftX3UpperCurveCtrl,
        widget.leftY3UpperCurveCtrl,
        widget.rightX1UpperCurveCtrl,
        widget.rightY1UpperCurveCtrl,
        widget.rightX2UpperCurveCtrl,
        widget.rightY2UpperCurveCtrl,
        widget.rightX3UpperCurveCtrl,
        widget.rightY3UpperCurveCtrl,
      ),
      foregroundPainter: widget.foregroundStrokeBorderWidth!=0 
      ?widget.underCurve
      ?NavForeGroundUnderStrokeBorderPainterStatic(
        _pos, 
        _length, 
        widget.foregroundStrokeBorderWidth,
        widget.useForegroundShaderStroke,
        widget.showForeGroundStrokeAllSide,
        widget.foregroundStrokeBorderColor, 
        widget.foregroundStrokeGradientShader,
        Directionality.of(context),
        widget.underStrokeCurveWidth,
        widget.leftStrokeX1UnderCurveCtrl,
        widget.leftStrokeY1UnderCurveCtrl,
        widget.leftStrokeX2UnderCurveCtrl,
        widget.leftStrokeY2UnderCurveCtrl,
        widget.leftStrokeX3UnderCurveCtrl,
        widget.leftStrokeY3UnderCurveCtrl,
        widget.rightStrokeX1UnderCurveCtrl,
        widget.rightStrokeY1UnderCurveCtrl,
        widget.rightStrokeX2UnderCurveCtrl,
        widget.rightStrokeY2UnderCurveCtrl,
        widget.rightStrokeX3UnderCurveCtrl,
        widget.rightStrokeY3UnderCurveCtrl,
      )
      :NavForeGroundUpperStrokeBorderPainterStatic(
        _pos, 
        _length, 
        widget.foregroundStrokeBorderWidth,
        widget.useForegroundShaderStroke,
        widget.showForeGroundStrokeAllSide,
        widget.foregroundStrokeBorderColor, 
        widget.foregroundStrokeGradientShader,
        Directionality.of(context),
        widget.upperStrokeCurveWidth,
        widget.leftStrokeX1UpperCurveCtrl,
        widget.leftStrokeY1UpperCurveCtrl,
        widget.leftStrokeX2UpperCurveCtrl,
        widget.leftStrokeY2UpperCurveCtrl,
        widget.leftStrokeX3UpperCurveCtrl,
        widget.leftStrokeY3UpperCurveCtrl,
        widget.rightStrokeX1UpperCurveCtrl,
        widget.rightStrokeY1UpperCurveCtrl,
        widget.rightStrokeX2UpperCurveCtrl,
        widget.rightStrokeY2UpperCurveCtrl,
        widget.rightStrokeX3UpperCurveCtrl,
        widget.rightStrokeY3UpperCurveCtrl,
      )
      :null,
      child: Container(
        height: 20.0 + (widget.foregroundHeight ?? 0.0),
      ),
    );
  } 

  CustomPaint dynamicCurve(BuildContext context) {
    return CustomPaint(
      painter: widget.underCurve
      ?NavForeGroundCurvePainterUnderDynamic(
        _pos, 
        _length, 
        widget.useForeGroundGradient,
        widget.foreGroundGradientShader,
        widget.foregroundColor, 
        Directionality.of(context),
        widget.underCurveWidth,
        widget.leftX1UnderCurveCtrl,
        widget.leftY1UnderCurveCtrl,
        widget.leftX2UnderCurveCtrl,
        widget.leftY2UnderCurveCtrl,
        widget.leftX3UnderCurveCtrl,
        widget.leftY3UnderCurveCtrl,
        widget.rightX1UnderCurveCtrl,
        widget.rightY1UnderCurveCtrl,
        widget.rightX2UnderCurveCtrl,
        widget.rightY2UnderCurveCtrl,
        widget.rightX3UnderCurveCtrl,
        widget.rightY3UnderCurveCtrl,
      )
      :NavForeGroundCurvePainterUpperDynamic(
        _pos, 
        _length, 
        widget.useForeGroundGradient,
        widget.foreGroundGradientShader,
        widget.foregroundColor, 
        Directionality.of(context),
        widget.upperCurveWidth,
        widget.leftX1UpperCurveCtrl,
        widget.leftY1UpperCurveCtrl,
        widget.leftX2UpperCurveCtrl,
        widget.leftY2UpperCurveCtrl,
        widget.leftX3UpperCurveCtrl,
        widget.leftY3UpperCurveCtrl,
        widget.rightX1UpperCurveCtrl,
        widget.rightY1UpperCurveCtrl,
        widget.rightX2UpperCurveCtrl,
        widget.rightY2UpperCurveCtrl,
        widget.rightX3UpperCurveCtrl,
        widget.rightY3UpperCurveCtrl,
      ),
      foregroundPainter: widget.foregroundStrokeBorderWidth!=0 
      ?widget.underCurve
      ?NavForeGroundUnderStrokeBorderPainterDynamic(
        _pos, 
        _length, 
        widget.foregroundStrokeBorderWidth,
        widget.useForegroundShaderStroke,
        widget.showForeGroundStrokeAllSide,
        widget.foregroundStrokeBorderColor, 
        widget.foregroundStrokeGradientShader,
        Directionality.of(context),
        widget.underStrokeCurveWidth,
        widget.leftStrokeX1UnderCurveCtrl,
        widget.leftStrokeY1UnderCurveCtrl,
        widget.leftStrokeX2UnderCurveCtrl,
        widget.leftStrokeY2UnderCurveCtrl,
        widget.leftStrokeX3UnderCurveCtrl,
        widget.leftStrokeY3UnderCurveCtrl,
        widget.rightStrokeX1UnderCurveCtrl,
        widget.rightStrokeY1UnderCurveCtrl,
        widget.rightStrokeX2UnderCurveCtrl,
        widget.rightStrokeY2UnderCurveCtrl,
        widget.rightStrokeX3UnderCurveCtrl,
        widget.rightStrokeY3UnderCurveCtrl,
      )
      :NavForeGroundUpperStrokeBorderPainterDynamic(
        _pos, 
        _length, 
        widget.foregroundStrokeBorderWidth,
        widget.useForegroundShaderStroke,
        widget.showForeGroundStrokeAllSide,
        widget.foregroundStrokeBorderColor, 
        widget.foregroundStrokeGradientShader,
        Directionality.of(context),
        widget.upperStrokeCurveWidth,
        widget.leftStrokeX1UpperCurveCtrl,
        widget.leftStrokeY1UpperCurveCtrl,
        widget.leftStrokeX2UpperCurveCtrl,
        widget.leftStrokeY2UpperCurveCtrl,
        widget.leftStrokeX3UpperCurveCtrl,
        widget.leftStrokeY3UpperCurveCtrl,
        widget.rightStrokeX1UpperCurveCtrl,
        widget.rightStrokeY1UpperCurveCtrl,
        widget.rightStrokeX2UpperCurveCtrl,
        widget.rightStrokeY2UpperCurveCtrl,
        widget.rightStrokeX3UpperCurveCtrl,
        widget.rightStrokeY3UpperCurveCtrl,
      )
      :null,
      child: Container(
        height: 20.0 + (widget.foregroundHeight ?? 0.0),
      ),
    );
  }

  void setPage(int index) {
    _buttonTap(index);
  }

  void _buttonTap(int index) {
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
    final newPosition = index / _length;
    setState(() {
      _startingPos = _pos;
      _endingIndex = index;
      _animationController.animateTo(
        newPosition,
        duration: widget.animationDuration, 
        curve: widget.animationType
      );
    });
  }
}
