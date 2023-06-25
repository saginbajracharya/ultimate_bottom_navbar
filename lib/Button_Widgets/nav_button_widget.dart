import 'package:flutter/material.dart';

class DynamicNavBarButton extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final bool showForeGround;
  final ValueChanged<int> onTap;
  final IconData icon;
  final String title;
  final int currentIndex;
  final Color? selectedIconColor;
  final double? selectedIconSize;   
  final double? selectedTextSize;  
  final Color? selectedTextColor;
  final Color? unselectedIconColor;
  final double? unselectedIconSize;   
  final double? unselectedTextSize;  
  final Color? unselectedTextColor;
  final Widget? customSelectedItemDecor;
  final Widget? customUnSelectedItemDecor;
  final List<Map<String,dynamic>>? badgeData;
  final Color? badgeColor;
  final TextStyle? badgeTextStyle;
  final double? badgeCircleRadius;
  final double? badgeTopPosition;
  final double? badgeBottomPosition;
  final double? badgeLeftPosition;
  final double? badgeRightPosition;

  const DynamicNavBarButton({
    Key? key,  
    required this.onTap,
    required this.position,
    required this.length,
    required this.index,
    required this.showForeGround,
    required this.icon,
    required this.title,
    required this.currentIndex,
    required this.selectedIconColor,
    required this.selectedIconSize,   
    required this.selectedTextSize,  
    required this.selectedTextColor,
    required this.unselectedIconColor,
    required this.unselectedIconSize,   
    required this.unselectedTextSize,  
    required this.unselectedTextColor,
    required this.customSelectedItemDecor,
    required this.customUnSelectedItemDecor,
    required this.badgeData,
    required this.badgeColor,
    required this.badgeTextStyle, 
    required this.badgeCircleRadius,
    required this.badgeTopPosition,
    required this.badgeBottomPosition,
    required this.badgeLeftPosition,
    required this.badgeRightPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = index == currentIndex;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(index);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            isSelected
            ?SelectedButtonWidget(
              showForeGround: showForeGround, 
              index: index, 
              length: length, 
              title: title,
              icon: icon,
              selectedIconColor: selectedIconColor,
              selectedIconSize:selectedIconSize,
              selectedTextSize:selectedTextSize,
              selectedTextColor:selectedTextColor, 
              customSelectedItemDecor: customSelectedItemDecor,
            )
            :UnSelectedButtonWidget(
              showForeGround: showForeGround, 
              index: index, 
              length: length, 
              title: title,
              icon: icon,
              unselectedIconColor: unselectedIconColor,
              unselectedIconSize: unselectedIconSize,
              unselectedTextSize: unselectedTextSize,
              unselectedTextColor: unselectedTextColor, 
              customUnselectedItemDecor: customUnSelectedItemDecor,
            ),
            shouldShowBadge(index, badgeData)
            ?Positioned(
              top: badgeTopPosition,
              right: badgeRightPosition,
              bottom: badgeBottomPosition,
              left: badgeLeftPosition,
              child: CircleAvatar(
                radius: badgeCircleRadius,
                backgroundColor: badgeColor,
                child:Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(getValueForIndex(index,badgeData),style: badgeTextStyle),
                ),
              ),
            )
            :const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class StaticNavBarButton extends StatelessWidget {
  final int length;
  final int index;
  final bool showForeGround;
  final ValueChanged<int> onTap;
  final IconData icon;
  final String title;
  final int currentIndex;
  final Color? selectedIconColor;
  final double? selectedIconSize;   
  final double? selectedTextSize;  
  final Color? selectedTextColor;
  final Color? unselectedIconColor;
  final double? unselectedIconSize;   
  final double? unselectedTextSize;  
  final Color? unselectedTextColor;
  final Color? midItemCircleColorStatic;
  final Color? midItemCircleBorderColorStatic;
  final bool showMidCircleStatic;
  final double midCircleRadiusStatic;
  final double midCircleBorderRadiusStatic;
  final Widget? customSelectedItemDecor;
  final Widget? customUnSelectedItemDecor;
  final List<Map<String,dynamic>>? badgeData;
  final Color? badgeColor;
  final TextStyle? badgeTextStyle;
  final double? badgeCircleRadius;
  final double? badgeTopPosition;
  final double? badgeBottomPosition;
  final double? badgeLeftPosition;
  final double? badgeRightPosition;

  const StaticNavBarButton({Key? key,
    required this.onTap,
    required this.length,
    required this.index,
    required this.showForeGround,
    required this.icon,
    required this.title,
    required this.currentIndex,
    required this.selectedIconColor,
    required this.selectedIconSize,   
    required this.selectedTextSize,  
    required this.selectedTextColor,
    required this.unselectedIconColor,
    required this.unselectedIconSize,   
    required this.unselectedTextSize,  
    required this.unselectedTextColor,
    required this.midItemCircleColorStatic,
    required this.midItemCircleBorderColorStatic,
    required this.showMidCircleStatic,
    required this.midCircleRadiusStatic,
    required this.midCircleBorderRadiusStatic,
    required this.customSelectedItemDecor,
    required this.customUnSelectedItemDecor,
    required this.badgeData,
    required this.badgeColor,
    required this.badgeTextStyle, 
    required this.badgeCircleRadius,
    required this.badgeTopPosition,
    required this.badgeBottomPosition,
    required this.badgeLeftPosition,
    required this.badgeRightPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = index == currentIndex;
    final midItem = length ~/ 2;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async{
          onTap(index);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            index == midItem && showMidCircleStatic
            ?CircleAvatar(
              radius: midCircleRadiusStatic+midCircleBorderRadiusStatic,
              backgroundColor: midItemCircleBorderColorStatic,
              child: CircleAvatar(
                backgroundColor: midItemCircleColorStatic,
                radius: midCircleRadiusStatic,
              ),
            )
            :const SizedBox(),
            isSelected
            ?SelectedButtonWidget(
              showForeGround: showForeGround, 
              index: index, 
              length: length, 
              title: title,
              icon: icon,
              selectedIconColor: selectedIconColor,
              selectedIconSize:selectedIconSize, 
              selectedTextSize:selectedTextSize,  
              selectedTextColor:selectedTextColor, 
              customSelectedItemDecor: customSelectedItemDecor,
            )
            :UnSelectedButtonWidget(
              showForeGround: showForeGround, 
              index: index, 
              length: length, 
              title: title,
              icon: icon,
              unselectedIconColor: unselectedIconColor,
              unselectedIconSize:unselectedIconSize, 
              unselectedTextSize:unselectedTextSize,  
              unselectedTextColor:unselectedTextColor, 
              customUnselectedItemDecor: customUnSelectedItemDecor,
            ),
            shouldShowBadge(index, badgeData)
            ?Positioned(
              top: badgeTopPosition,
              right: badgeRightPosition,
              bottom: badgeBottomPosition,
              left: badgeLeftPosition,
              child: CircleAvatar(
                radius: badgeCircleRadius,
                backgroundColor: badgeColor,
                child:Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(getValueForIndex(index,badgeData),style: badgeTextStyle),
                ),
              ),
            )
            :const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class SelectedButtonWidget extends StatelessWidget {
  const SelectedButtonWidget({Key? key,
    required this.showForeGround,
    required this.index,
    required this.length,
    required this.title,
    required this.icon,
    required this.selectedIconColor,
    required this.selectedIconSize,
    required this.selectedTextSize,
    required this.selectedTextColor,
    required this.customSelectedItemDecor,
  }) : super(key: key);

  final IconData icon;
  final bool showForeGround;
  final int index;
  final int length;
  final String title;
  final Color? selectedIconColor;
  final double? selectedIconSize;   
  final double? selectedTextSize;  
  final Color? selectedTextColor;
  final Widget? customSelectedItemDecor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        customSelectedItemDecor??const SizedBox(),
        SizedBox(
          height: kBottomNavigationBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: selectedIconColor??Colors.red, // Change the color to your desired color
                size: selectedIconSize??30, // Change the size to your desired size
              ),
              Flexible(child: title=="" ? const SizedBox() : Text(title,style: TextStyle(color: selectedTextColor,fontSize: selectedTextSize)))
            ],
          )
        ),
      ],
    );
  }
}

class UnSelectedButtonWidget extends StatelessWidget {
  const UnSelectedButtonWidget({Key? key, 
    required this.showForeGround,
    required this.index,
    required this.length,
    required this.title,
    required this.icon,
    required this.unselectedIconColor,
    required this.unselectedIconSize,
    required this.unselectedTextSize,
    required this.unselectedTextColor,
    required this.customUnselectedItemDecor,
  }) : super(key: key);

  final IconData icon;
  final bool showForeGround;
  final int index;
  final int length;
  final String title;
  final Color? unselectedIconColor;
  final double? unselectedIconSize;   
  final double? unselectedTextSize;  
  final Color? unselectedTextColor;
  final Widget? customUnselectedItemDecor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        customUnselectedItemDecor??const SizedBox(),
        SizedBox(
          height: kBottomNavigationBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: unselectedIconColor??Colors.red, // Change the color to your desired color
                size: unselectedIconSize??30, // Change the size to your desired size
              ),
              Flexible(child: title=="" ? const SizedBox() : Text(title,style: TextStyle(color: unselectedTextColor,fontSize: unselectedTextSize??18)))
            ],
          )
        ),
      ],
    );
  }
}

bool shouldShowBadge(int index,badgeData) {
  if (badgeData == null || badgeData.isEmpty) {
    return false;
  }
  for (var badge in badgeData) {
    if (badge['index'] == index && badge['value'] != null && badge['value'] != '0') {
      return true;
    }
  }
  return false;
}

String getValueForIndex(int index,badgeData) {
  for (var badge in badgeData) {
    if (badge['index'] == index) {
      return badge['value'].toString();
    }
  }
  return '';
}