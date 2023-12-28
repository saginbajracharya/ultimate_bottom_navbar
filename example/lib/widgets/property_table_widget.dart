import 'package:flutter/material.dart';
import '../utils/styles.dart';

class PropertyTable extends StatelessWidget {
  const PropertyTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: <DataColumn>[
          DataColumn(label: Text('Property',style: heading3Style,textAlign: TextAlign.center)),
          DataColumn(label: Text('Description',style: heading3Style,textAlign: TextAlign.center)),
          DataColumn(label: Text('Default Value',style: heading3Style,textAlign: TextAlign.center)),
        ],
        rows: <DataRow>[
          DataRow(cells: [
            DataCell(Text('icons',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Required',style: heading2Style,textAlign: TextAlign.center)),    
            DataCell(Text('-',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('titles',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Required',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('-',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('currentIndex',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Required',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('-',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('backgroundColor',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Solid Background Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Transparent',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('foregroundColor',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Solid Foreground Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Grey',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('foregroundStrokeBorderColor',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Foreground Stroke Solid Border Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Black',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('backgroundStrokeBorderColor',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Background Stroke Solid Border Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Black',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('backgroundStrokeBorderWidth',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Background Stroke Border Thickness',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('1.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('foregroundStrokeBorderWidth',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Foreground Stroke Border Thickness',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('1.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('backgroundGradient',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Background Gradient Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Null',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('foreGroundGradientShader',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Foreground Gradient Shader Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Null',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('foregroundStrokeGradientShader',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Foreground Stroke Border Gradient Shader Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Null',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('backgroundStrokeGradientShader',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Background Stroke Border Gradient Shader Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Null',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('navMargin',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Bottom Navigation Margin',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('EdgeInsets.zero',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('backgroundBorderRadius',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Background Border Radius',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('BorderRadius.zero',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('selectedIconColor',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Selected Icon Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('White',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('selectedIconSize',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Selected Icon Size',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('26.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('selectedTextSize',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Selected Text Size',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('11.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('selectedTextColor',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Selected Text Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('White',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('unselectedIconColor',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Unselected Icon Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Black',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('unselectedIconSize',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Unselected Icon Size',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('24.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('unselectedTextSize',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Unselected Text Size',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('10.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('unselectedTextColor',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Unselected Text Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Black',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('showForeGroundStrokeAllSide',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Show Foreground Stroke Border All Sides',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('False',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('showBackGroundStrokeAllSide',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Show Background Stroke Border All Sides',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('False',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('useForeGroundGradient',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Use Foreground Gradient Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('False',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('showForeGround',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Show Hide Foreground',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('True',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('useForegroundShaderStroke',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Use Foreground Shader Border Stroke Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('False',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('useBackgroundShaderStroke',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Use Background Shader Border Stroke Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('False',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('underCurve',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Under Curve Or Upper Curve',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('True',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('staticCurve',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Static Curve Or Dynamic Curve',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('False',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('showCircleStaticMidItemStatic',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Show Circle Decoration For Static Curve',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('True',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('midItemCircleColorStatic',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Mid Item Circle Color For Static Curve',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('White',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('midItemCircleBorderColorStatic',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Mid Item Circle Border Color For Static Curve',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Black',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('showMidCircleStatic',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Show Mid Circle Or Hide For Static Curve',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('True',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('midCircleRadiusStatic',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Mid Circle Radius For Static Curve',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('25.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('midCircleBorderRadiusStatic',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Mid Circle Border Radius For Static Curve',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('2.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('customSelectedItemDecor',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Custom Selected Item Decoration',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Null',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('customUnSelectedItemDecor',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Custom Unselected Item Decoration',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Null',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('badgeData',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Badge Data For Individual Item',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Null',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('badgeColor',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Badge Background Color',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Red',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('badgeTextStyle',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Badge Text Style',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('TextStyle()',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('badgeCircleRadius',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Badge Circle Radius',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('8.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('badgeTopPosition',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Badge Top Position',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('10.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('badgeBottomPosition',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Badge Bottom Position',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('16.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('badgeLeftPosition',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Badge Left Position',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Null',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('badgeRightPosition',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Badge Right Position',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Null',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('backgroundHeight',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Height for Backgound Container',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('kBottomNavigationBarHeight',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('foregroundHeight',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Height for Foregound Container',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('kBottomNavigationBarHeight',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('animationType',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Animation Type',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('easeOut',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('animationDuration',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Animation Duration',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('500ms',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('onTap',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Item Tap Function',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Null',style: heading2Style,textAlign: TextAlign.center)),
          ]),

          //Upper Curve Controls
          DataRow(cells: [
            DataCell(Text('upperCurveWidthCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the width of the upper curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.16',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftX1UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the left control point 1.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.20',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftY1UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the left control point 1.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftX2UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the left control point 2.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('10',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftY2UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the left control point 2.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.12',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftX3UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the left control point 3.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.5',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftY3UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the left control point 3.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.12',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightX1UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the right control point 1.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('10',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightY1UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the right control point 1.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.12',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightX2UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the right control point 2.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.20',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightY2UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the right control point 2.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightX3UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the right control point 3.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightY3UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the right control point 3.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0',style: heading2Style,textAlign: TextAlign.center)),
          ]),

          //Upper Stroke Curve Controls
          DataRow(cells: [
            DataCell(Text('upperStrokeCurveWidthCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the width of the upper stroke curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.16',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftStrokeX1UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the left control point 1 for the upper stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.20',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftStrokeY1UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the left control point 1 for the upper stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftStrokeX2UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the left control point 2 for the upper stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('10',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftStrokeY2UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the left control point 2 for the upper stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.12',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftStrokeX3UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the left control point 3 for the upper stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.5',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftStrokeY3UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the left control point 3 for the upper stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.12',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightStrokeX1UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the right control point 1 for the upper stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('10',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightStrokeY1UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the right control point 1 for the upper stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.12',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightStrokeX2UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the right control point 2 for the upper stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.20',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightStrokeY2UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the right control point 2 for the upper stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightStrokeX3UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the right control point 3 for the upper stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightStrokeY3UpperCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the right control point 3 for the upper stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0',style: heading2Style,textAlign: TextAlign.center)),
          ]),

          //Under Curve Controls
          DataRow(cells: [
            DataCell(Text('underCurveWidthCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the width of the under curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.18',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftX1UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the left control point 1 for the under curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.50',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftY1UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the left control point 1 for the under curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.05',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftX2UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the left control point 2 for the under curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('8',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftY2UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the left control point 2 for the under curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.66',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftX3UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the left control point 3 for the under curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.50',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftY3UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the left control point 3 for the under curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.66',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightX1UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the right control point 1 for the under curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('8',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightY1UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the right control point 1 for the under curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.66',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightX2UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the right control point 2 for the under curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.50',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightY2UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the right control point 2 for the under curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.05',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightX3UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the right control point 3 for the under curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightY3UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the right control point 3 for the under curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0',style: heading2Style,textAlign: TextAlign.center)),
          ]),

          //Under Stroke Curve Controls
          DataRow(cells: [
            DataCell(Text('underStrokeCurveWidthCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the width of the under stroke curve.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.18',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftStrokeX1UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the left control point 1 for the under stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.50',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftStrokeY1UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the left control point 1 for the under stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.05',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftStrokeX2UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the left control point 2 for the under stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('8',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftStrokeY2UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the left control point 2 for the under stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.66',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftStrokeX3UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the left control point 3 for the under stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.50',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('leftStrokeY3UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the left control point 3 for the under stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.66',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightStrokeX1UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the right control point 1 for the under stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('8',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightStrokeY1UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the right control point 1 for the under stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.66',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightStrokeX2UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the right control point 2 for the under stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.50',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightStrokeY2UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the right control point 2 for the under stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0.05',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightStrokeX3UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the x-coordinate of the right control point 3 for the under stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
          DataRow(cells: [
            DataCell(Text('rightStrokeY3UnderCurveCtrl',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('Controls the y-coordinate of the right control point 3 for the under stroke.',style: heading2Style,textAlign: TextAlign.center)),
            DataCell(Text('0',style: heading2Style,textAlign: TextAlign.center)),
          ]),
        ],
      ),
    );
  }
}
