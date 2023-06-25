library ultimate_bottom_navbar;
import 'package:flutter/material.dart';
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

  final Color? selectedIconColor;
  final double? selectedIconSize;   
  final double? selectedTextSize;  
  final Color? selectedTextColor;
  final Color? unselectedIconColor;
  final double? unselectedIconSize;   
  final double? unselectedTextSize;  
  final Color? unselectedTextColor;

  final Shader? strokeGradientShader;
  final bool useForeGroundGradient;
  final bool showForeGround;
  final bool useShaderStroke;
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
    this.backgroundStrokeBorderWidth       = 0.0,                               // Default Nav BackGround Stroke Border Width
    this.foregroundStrokeBorderWidth       = 1.0,                               // Default Nav ForeGround Stroke Border Width
    this.backgroundGradient,                                                    // Default Null
    this.foreGroundGradientShader,                                              // Default Null

    this.selectedIconColor                 = white,                             // Default white
    this.selectedIconSize                  = 26.0,                              // Default 26.0
    this.selectedTextSize                  = 11.0,                              // Default 11.0
    this.selectedTextColor                 = white,                             // Default white
    this.unselectedIconColor               = black,                             // Default black
    this.unselectedIconSize                = 24.0,                              // Default 24.0
    this.unselectedTextSize                = 10.0,                              // Default 10.0
    this.unselectedTextColor               = black,                             // Default black

    this.strokeGradientShader,                                                  // Default Null
    this.useForeGroundGradient             = false,                             // Default false
    this.showForeGround                    = true,                              // Default true
    this.useShaderStroke                   = false,                             // Default false
    this.underCurve                        = true,                              // Default true
    this.staticCurve                       = false,                             // Default false
    this.showCircleStaticMidItemStatic     = true,                              // Default true
    this.midItemCircleColorStatic          = white,                             // Default white
    this.midItemCircleBorderColorStatic    = black,                             // Default black
    this.showMidCircleStatic               = true,                              // Default true
    this.midCircleRadiusStatic             = 25.0,                              // Default 25.0
    this.midCircleBorderRadiusStatic       = 2.0,                               // Default 2.0
    this.customSelectedItemDecor,                                               // Default Null
    this.customUnSelectedItemDecor,                                             // Default Null
    
    this.animationType                     = Curves.easeOut,                    // Default easeOut
    this.animationDuration                 = const Duration(milliseconds: 500), // Default 500ms
    this.onTap,                                                                 // Default Null
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
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: widget.backgroundStrokeBorderWidth==0.0
        ?null
        :Border(
          top: BorderSide(
            color : widget.backgroundStrokeBorderColor,
            width : widget.backgroundStrokeBorderWidth,
            style : BorderStyle.solid,
          ),
        ),
        gradient:widget.backgroundGradient,
      ),
      height: kBottomNavigationBarHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.zero,
      child: widget.staticCurve
      ?staticBottomNavWidget(context)
      :dynamicBottomNavWidget(context),
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
                onTap                    : _buttonTap,
                position                 : _pos,
                length                   : _length,
                index                    : widget.icons.indexOf(icon),
                title                    : widget.titles[widget.icons.indexOf(icon)],
                currentIndex             : widget.currentIndex,
                showForeGround           : widget.showForeGround,
                icon                     : icon,
                selectedIconColor        : widget.selectedIconColor, 
                selectedIconSize         : widget.selectedIconSize, 
                selectedTextColor        : widget.selectedTextColor, 
                selectedTextSize         : widget.selectedTextSize, 
                unselectedIconColor      : widget.unselectedIconColor, 
                unselectedIconSize       : widget.unselectedIconSize, 
                unselectedTextColor      : widget.unselectedTextColor, 
                unselectedTextSize       : widget.unselectedTextSize,
                customSelectedItemDecor  : widget.customSelectedItemDecor,
                customUnSelectedItemDecor: widget.customUnSelectedItemDecor,
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
        Directionality.of(context)
      )
      :NavForeGroundCurvePainterUpperStatic(
        _pos, 
        _length, 
        widget.useForeGroundGradient,
        widget.foreGroundGradientShader,
        widget.foregroundColor, 
        Directionality.of(context)
      ),
      foregroundPainter: widget.foregroundStrokeBorderWidth!=0 
      ?widget.underCurve
      ?NavForeGroundUnderStrokeBorderPainterStatic(
        _pos, 
        _length, 
        widget.foregroundStrokeBorderColor, 
        Directionality.of(context),
        widget.foregroundStrokeBorderWidth,
        widget.strokeGradientShader,
        widget.useShaderStroke
      )
      :NavForeGroundUpperStrokeBorderPainterStatic(
        _pos, 
        _length, 
        widget.foregroundStrokeBorderColor, 
        Directionality.of(context),
        widget.foregroundStrokeBorderWidth,
        widget.strokeGradientShader,
        widget.useShaderStroke
      )
      :null,
      child: Container(
        height: 75.0,
      ),
    );
  } 

  CustomPaint dynamicCurve(BuildContext context) {
    return CustomPaint(
      painter: widget.underCurve
      ?NavForeGroundCurvePainterUnder(
        _pos, 
        _length, 
        widget.useForeGroundGradient,
        widget.foreGroundGradientShader,
        widget.foregroundColor, 
        Directionality.of(context)
      )
      :NavForeGroundCurvePainterUpper(
        _pos, 
        _length, 
        widget.useForeGroundGradient,
        widget.foreGroundGradientShader,
        widget.foregroundColor, 
        Directionality.of(context)
      ),
      foregroundPainter: widget.foregroundStrokeBorderWidth!=0 
      ?widget.underCurve
      ?NavForeGroundUnderStrokeBorderPainter(
        _pos, 
        _length, 
        widget.foregroundStrokeBorderColor, 
        Directionality.of(context),
        widget.foregroundStrokeBorderWidth,
        widget.strokeGradientShader,
        widget.useShaderStroke
      )
      :NavForeGroundUpperStrokeBorderPainter(
        _pos, 
        _length, 
        widget.foregroundStrokeBorderColor, 
        Directionality.of(context),
        widget.foregroundStrokeBorderWidth,
        widget.strokeGradientShader,
        widget.useShaderStroke
      )
      :null,
      child: Container(
        height: 75.0,
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
