# Ultimate Bottom Navigation Bar

Ultimate Bottom Navigation Bar is a customizable bottom navigation bar for your Flutter applications. It allows you to easily create a navigation bar with icons and titles, and customize various aspects of its appearance and behaviors.

## Under Curve

![Alt text](images/image-2.png)

## Upper Curve

![Alt text](images/image-3.png)

## No Curve

![Alt text](images/image-1.png)

## Static Curve

![Alt text](images/image-4.png)
![Alt text](images/image-15.png)

## Dynamic Curve

![Alt text](images/image-13.png)
![Alt text](images/image-14.png)

## Other Customiztions

![Alt text](images/image-6.png)
![Alt text](images/image-7.png)
![Alt text](images/image-8.png)
![Alt text](images/image-10.png)
![Alt text](images/image-11.png)
![Alt text](images/image-12.png)

## How To Use

Ultimate Bottom Navigation Bar can be used with Scaffold by setting up at bottomNavigationBar property.

Add this to your package's pubspec.yaml file, use the latest version

```yaml
dependencies:
  ultimate_bottom_navbar: ^latest_version
```

```dart
import 'package:ultimate_bottom_navbar/ultimate_bottom_navbar.dart';
    int currentIndex = 0;

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
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: UltimateBottomNavBar(
            icons         : icons,
            titles        : title,
            currentIndex  : currentIndex,
            onTap         : (index) async => onItemTapped(index), 
        ),
    );
  }

  void onItemTapped(int index) async{
    setState(() {
        currentIndex = index;
    });
  }
```

## RTL Support

Works For Both RTL and LTR and can be configured with `Directionality`:

```dart
Directionality(
  textDirection: TextDirection.rtl,
  child: Scaffold(bottomNavigationBar:UltimateBottomNavBar()),
)
```
