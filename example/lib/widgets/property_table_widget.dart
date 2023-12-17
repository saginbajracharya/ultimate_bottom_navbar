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
        ],
      ),
    );
  }
}
