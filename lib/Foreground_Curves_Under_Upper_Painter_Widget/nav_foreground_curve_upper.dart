import 'package:flutter/material.dart';

Shader defaultGradientShader = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Colors.blue,
    Colors.red,
    Colors.purple,
    Colors.red,
    Colors.blue,
  ],
  stops: [0.1, 0.3, 0.5, 0.7, 1.0],
).createShader(Rect.fromCenter(center: const Offset(0.0,0.0), height: 200, width: 100));

//=========================== Dynamic Upper Curve ===========================//
class NavForeGroundCurvePainterUpperDynamic extends CustomPainter {
  late double loc;                                                            // Represents the starting location of the curve
  late double s;                                                              // Represents the size of the curve
  late bool useForeGroundGradient;                                            // Indicates whether to use a foreground gradient
  late Shader? foreGroundGradientShader;                                      // Shader for the foreground gradient
  Color color;                                                                // Color used if not using the foreground gradient
  TextDirection textDirection;                                                // Direction of the text
  //New
  late double? upperCurveWidth;
  late double? leftX1UpperCurveCtrl;
  late double? leftY1UpperCurveCtrl;
  late double? leftX2UpperCurveCtrl;
  late double? leftY2UpperCurveCtrl;
  late double? leftX3UpperCurveCtrl;
  late double? leftY3UpperCurveCtrl;
  late double? rightX1UpperCurveCtrl;
  late double? rightY1UpperCurveCtrl;
  late double? rightX2UpperCurveCtrl;
  late double? rightY2UpperCurveCtrl;
  late double? rightX3UpperCurveCtrl;
  late double? rightY3UpperCurveCtrl;
  //

  NavForeGroundCurvePainterUpperDynamic(
    double startingLoc, 
    int itemsLength, 
    this.useForeGroundGradient,
    this.foreGroundGradientShader,
    this.color, 
    this.textDirection,
    //New
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
    //
  ) 
  {
    final span = 1.0 / itemsLength;
    s = upperCurveWidth??0.16;
    double l = startingLoc + (span - s) / 2;
    if (textDirection == TextDirection.rtl) {
      loc = calculateLocForRtl(l, s);
    } else if (textDirection == TextDirection.ltr) {
      loc = l;
    } else {
      loc = l;
    }
  }

  double calculateLocForRtl(double l, double s) {
    return 1.0 - l - s * 1;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    if (!useForeGroundGradient) {
      paint.color = color; 
    } else {
      paint.shader = foreGroundGradientShader ?? defaultGradientShader;
    }

    const double bottomPadding = 18.0;                                                            // Adjust the value as needed
    final path = Path()
      ..moveTo(0, 0)                                                                              // Moves to the starting point of the path
      ..lineTo(size.width, 0)                                                                     // Draws a line from the starting point to the top-right corner
      ..lineTo(size.width, size.height - bottomPadding)                                           // Draws a line from the top-right corner to the bottom-right corner (with padding)
      ..lineTo(0, size.height - bottomPadding)                                                    // Draws a line from the bottom-right corner (with padding) to the bottom-left corner
      ..moveTo(-size.height, 0)                                                                   // Moves to a point outside the canvas on the left side
      ..lineTo((loc - 0) * size.width, 0)                                                         // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * (leftX1UpperCurveCtrl??0.20)) * size.width,                                         // First control point for the curve                                      //leftX1UpperCurveCtrl       LR
        leftY1UpperCurveCtrl??0.0,                                                                     // Second control point for the curve                                     //leftY1UpperCurveCtrl       TB
        loc * size.width + (leftX2UpperCurveCtrl??10),                                                  // Ending point of the curve                                              //leftX2UpperCurveCtrl        
        -size.height * (leftY2UpperCurveCtrl??0.12),                                                   // Ending control point of the curve                                      //leftY2UpperCurveCtrl       
        (loc + s * (leftX3UpperCurveCtrl??0.5)) * size.width,                                          // Starting control point of the next curve                               //leftX3UpperCurveCtrl        
        -size.height * (leftY3UpperCurveCtrl??0.12),                                                   // Ending control point of the next curve                                 //leftY3UpperCurveCtrl        
      )
      ..cubicTo(
        (loc + s) * size.width - (rightX1UpperCurveCtrl??10),                                           // First control point for the next curve                                 //rightX1UpperCurveCtrl    
        -size.height * (rightY1UpperCurveCtrl??0.12),                                                  // Second control point for the next curve                                //rightY1UpperCurveCtrl        
        (loc + s - s * (rightX2UpperCurveCtrl??0.20)) * size.width,                                    // Ending point of the next curve                                         //rightX2UpperCurveCtrl     
        rightY2UpperCurveCtrl??-0.0,                                                                   // Ending control point of the next curve                                 //rightY2UpperCurveCtrl       
        (loc + s + (rightX3UpperCurveCtrl??0)) * size.width,                                           // Starting point of the next curve                                       //rightX3UpperCurveCtrl         
        rightY3UpperCurveCtrl??0,                                                                      // Draws a line from the previous point to the right side of the curve    //rightY3UpperCurveCtrl
      )
      ..lineTo(size.width, 0)                                                                     // Draws a line from the last point to the top-right corner
      ..moveTo(0, size.height - bottomPadding)                                                    // Moves to the bottom-left corner (with padding)
      ..close();                                                                                  // Closes the path
    canvas.drawPath(path, paint);                                                                 // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Dynamic Upper Curve Stroke ===========================//
class NavForeGroundUpperStrokeBorderPainterDynamic extends CustomPainter {
  late double loc;                                                            // Represents the starting location of the curve
  late double s;                                                              // Represents the size of the curve
  late double strokeBorderWidth;                                              // Width of the stroke border
  late bool useShaderStroke;                                                  // Indicates whether to use a shader for the stroke
  late bool showForeGroundStrokeAllSide;
  Shader? foregroundStrokeGradientShader;                                     // Shader for the stroke gradient
  Color color;                                                                // Color used if not using the shader for stroke
  TextDirection textDirection;                                                // Direction of the text
  //New
  late double? upperStrokeCurveWidth;
  late double? leftStrokeX1UpperCurveCtrl;
  late double? leftStrokeY1UpperCurveCtrl;
  late double? leftStrokeX2UpperCurveCtrl;
  late double? leftStrokeY2UpperCurveCtrl;
  late double? leftStrokeX3UpperCurveCtrl;
  late double? leftStrokeY3UpperCurveCtrl;
  late double? rightStrokeX1UpperCurveCtrl;
  late double? rightStrokeY1UpperCurveCtrl;
  late double? rightStrokeX2UpperCurveCtrl;
  late double? rightStrokeY2UpperCurveCtrl;
  late double? rightStrokeX3UpperCurveCtrl;
  late double? rightStrokeY3UpperCurveCtrl;

  NavForeGroundUpperStrokeBorderPainterDynamic(
    double startingLoc, 
    int itemsLength, 
    this.strokeBorderWidth,
    this.useShaderStroke,
    this.showForeGroundStrokeAllSide,
    this.color, 
    this.foregroundStrokeGradientShader,
    this.textDirection,
    //New
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
  ) 
  {
    final span = 1.0 / itemsLength;
    s = upperStrokeCurveWidth??0.16;
    double l = startingLoc + (span - s) / 2;
    if (textDirection == TextDirection.rtl) {
      loc = calculateLocForRtl(l, s);
    } else if (textDirection == TextDirection.ltr) {
      loc = l;
    } else {
      loc = l;
    }
  }

  double calculateLocForRtl(double l, double s) {
    return 1.0 - l - s * 1;
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeBorderWidth                                                                 // Sets the width of the stroke border
      ..style = PaintingStyle.stroke;                                                                   // Sets the painting style to stroke (outline)
    if (!useShaderStroke) {
      paint.color = color;                                                                              // Set the desired color for the stroke
    } else {
      paint.shader = foregroundStrokeGradientShader ?? defaultGradientShader;                           // Set the desired shader for the stroke
    }
    final path = Path()
      ..moveTo(0, 0)                                                                                    // Moves to a point outside the canvas on the left side
      ..lineTo((loc - 0) * size.width, 0)                                                               // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * (leftStrokeX1UpperCurveCtrl??0.20)) * size.width,                                         // First control point for the curve
        leftStrokeY1UpperCurveCtrl??-0.0,                                                                    // Second control point for the curve
        loc * size.width + (leftStrokeX2UpperCurveCtrl??10),                                                  // Ending point of the curve
        -size.height * (leftStrokeY2UpperCurveCtrl??0.12),                                                   // Ending control point of the curve
        (loc + s * (leftStrokeX3UpperCurveCtrl??0.5)) * size.width,                                          // Starting control point of the next curve
        -size.height * (leftStrokeY3UpperCurveCtrl??0.12),                                                   // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width-(rightStrokeX1UpperCurveCtrl??10),                                             // First control point for the next curve
        -size.height * (rightStrokeY1UpperCurveCtrl??0.12),                                                  // Second control point for the next curve
        (loc + s - s * (rightStrokeX2UpperCurveCtrl??0.20)) * size.width,                                    // Ending point of the next curve
        rightStrokeY2UpperCurveCtrl??-0.0,                                                                   // Ending control point of the next curve
        (loc + s + (rightStrokeX3UpperCurveCtrl??0)) * size.width,                                           // Starting point of the next curve
        rightStrokeY3UpperCurveCtrl??0,                                                                      // Draws a line from the previous point to the right side of the curve
      );
      if(showForeGroundStrokeAllSide){
        path
        ..lineTo(size.width, 0)                                                                         // Draws a line from the last point to the top-right corner
        ..lineTo(size.width, size.height-18.0)                                                          // Draws a line from the previous point to the bottom-right corner
        ..lineTo(0, size.height-18.0)                                                                   // Draws a line from the previous point to the bottom-left corner
        ..close();                                                                                      // Closes the path
      }
      else {
        path
        ..lineTo(size.width, 0)                                                                         // Draws a line from the last point to the top-right corner
        ..moveTo(0, size.width)                                                                         // Moves to the bottom-left corner of the path
        ..close();                                                                                      // Closes the path
      }
    canvas.drawPath(path, paint);                                                                       // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Static Upper Curve ===========================//
class NavForeGroundCurvePainterUpperStatic extends CustomPainter {
  late double loc;                                                            // Represents the starting location of the curve
  late double s;                                                              // Represents the size of the curve
  late bool useForeGroundGradient;                                            // Indicates whether to use a foreground gradient
  late Shader? foreGroundGradientShader;                                      // Shader for the foreground gradient
  Color color;                                                                // Color used if not using the foreground gradient
  TextDirection textDirection;                                                // Direction of the text
  //New
  late double? upperCurveWidth;
  late double? leftX1UpperCurveCtrl;
  late double? leftY1UpperCurveCtrl;
  late double? leftX2UpperCurveCtrl;
  late double? leftY2UpperCurveCtrl;
  late double? leftX3UpperCurveCtrl;
  late double? leftY3UpperCurveCtrl;
  late double? rightX1UpperCurveCtrl;
  late double? rightY1UpperCurveCtrl;
  late double? rightX2UpperCurveCtrl;
  late double? rightY2UpperCurveCtrl;
  late double? rightX3UpperCurveCtrl;
  late double? rightY3UpperCurveCtrl;

  NavForeGroundCurvePainterUpperStatic(
    double startingLoc, 
    int itemsLength, 
    this.useForeGroundGradient,
    this.foreGroundGradientShader,
    this.color, 
    this.textDirection,
    //New
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
    //
  ) 
  {
    s = upperCurveWidth??0.16;
    final span = 1.0 / itemsLength;
    loc = span * (itemsLength ~/ 2) + (span - s) / 2;
    if (textDirection == TextDirection.rtl) {
      loc = 1.0 - (loc + s);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;
    if (!useForeGroundGradient) {
      paint.color = color; 
    } else {
      paint.shader = foreGroundGradientShader ?? defaultGradientShader;
    }

    const double bottomPadding = 18.0;                                                            // Adjust the value as needed
    final path = Path()
      ..moveTo(0, 0)                                                                              // Moves to the starting point of the path
      ..lineTo(size.width, 0)                                                                     // Draws a line from the starting point to the top-right corner
      ..lineTo(size.width, size.height-bottomPadding)                                             // Draws a line from the top-right corner to the bottom-right corner
      ..lineTo(0, size.height-bottomPadding)                                                      // Draws a line from the bottom-right corner to the bottom-left corner
      ..moveTo(-size.height, 0)                                                                   // Moves to a point outside the canvas on the left side
      ..lineTo((loc - 0) * size.width, 0)                                                         // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * (leftX1UpperCurveCtrl??0.20)) * size.width,                                         // First control point for the curve
        -size.height * (leftY1UpperCurveCtrl??0.02),                                                   // Second control point for the curve
        loc * size.width+(leftX2UpperCurveCtrl??10),                                                   // Ending point of the curve
        -size.height * (leftY2UpperCurveCtrl??0.12),                                                   // Ending control point of the curve
        (loc + s * (leftX3UpperCurveCtrl??0.50)) * size.width,                                         // Starting control point of the next curve
        -size.height * (leftY3UpperCurveCtrl??0.12),                                                   // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width-(rightX1UpperCurveCtrl??10),                                            // First control point for the next curve
        -size.height * (rightY1UpperCurveCtrl??0.12),                                                  // Second control point for the next curve
        (loc + s - s * (rightX2UpperCurveCtrl??0.20)) * size.width,                                    // Ending point of the next curve
        -size.height * (rightY2UpperCurveCtrl??0.0),                                                   // Ending control point of the next curve
        (loc + s + (rightX3UpperCurveCtrl??0)) * size.width,                                           // Starting point of the next curve
        rightY3UpperCurveCtrl??0,                                                                      // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                                                                     // Draws a line from the last point to the top-right corner
      ..moveTo(0, size.height-bottomPadding)                                                      // Moves to the bottom-left corner
      ..close();                                                                                  // Closes the path

    canvas.drawPath(path, paint);                                                                 // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Static Upper Curve Stroke ===========================//
class NavForeGroundUpperStrokeBorderPainterStatic extends CustomPainter {
  late double loc;                                                            // Represents the starting location of the curve
  late double s;                                                              // Represents the size of the curve
  late double strokeBorderWidth;                                              // Width of the stroke border
  late bool useShaderStroke;                                                  // Indicates whether to use a shader for the stroke
  late bool showForeGroundStrokeAllSide;
  Shader? foregroundStrokeGradientShader;                                     // Shader for the stroke gradient
  Color color;                                                                // Color used if not using the shader for stroke
  TextDirection textDirection;                                                // Direction of the text
  //New
  late double? upperStrokeCurveWidth;
  late double? leftStrokeX1UpperCurveCtrl;
  late double? leftStrokeY1UpperCurveCtrl;
  late double? leftStrokeX2UpperCurveCtrl;
  late double? leftStrokeY2UpperCurveCtrl;
  late double? leftStrokeX3UpperCurveCtrl;
  late double? leftStrokeY3UpperCurveCtrl;
  late double? rightStrokeX1UpperCurveCtrl;
  late double? rightStrokeY1UpperCurveCtrl;
  late double? rightStrokeX2UpperCurveCtrl;
  late double? rightStrokeY2UpperCurveCtrl;
  late double? rightStrokeX3UpperCurveCtrl;
  late double? rightStrokeY3UpperCurveCtrl;
  //

  NavForeGroundUpperStrokeBorderPainterStatic(
    double startingLoc, 
    int itemsLength, 
    this.strokeBorderWidth,
    this.useShaderStroke,
    this.showForeGroundStrokeAllSide,
    this.color, 
    this.foregroundStrokeGradientShader,
    this.textDirection,
    //New
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
    //
  ) 
  {
    s = upperStrokeCurveWidth??0.16;
    final span = 1.0 / itemsLength;
    loc = span * (itemsLength ~/ 2) + (span - s) / 2;
    if (textDirection == TextDirection.rtl) {
      loc = 1.0 - (loc + s);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeBorderWidth                                                                 // Sets the width of the stroke border
      ..style = PaintingStyle.stroke;                                                                   // Sets the painting style to stroke (outline)
      
    if (!useShaderStroke) {
      paint.color = color;                                                                              // Set the desired color for the stroke
    } else {
      paint.shader = foregroundStrokeGradientShader ?? defaultGradientShader;                           // Set the desired shader for the stroke
    }

    final path = Path()
      ..moveTo(0, 0)                                                                                    // Moves to a point outside the canvas on the left side
      ..lineTo((loc - 0) * size.width, 0)                                                               // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * (leftStrokeX1UpperCurveCtrl??0.20)) * size.width,                                         // First control point for the curve
        -size.height * (leftStrokeY1UpperCurveCtrl??0.0),                                                    // Second control point for the curve
        loc * size.width+(leftStrokeX2UpperCurveCtrl??10),                                                   // Ending point of the curve
        -size.height * (leftStrokeY2UpperCurveCtrl??0.12),                                                   // Ending control point of the curve
        (loc + s * (leftStrokeX3UpperCurveCtrl??0.50)) * size.width,                                         // Starting control point of the next curve
        -size.height * (leftStrokeY3UpperCurveCtrl??0.12),                                                   // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width-(rightStrokeX1UpperCurveCtrl??10),                                            // First control point for the next curve
        -size.height * (rightStrokeY1UpperCurveCtrl??0.12),                                                  // Second control point for the next curve
        (loc + s - s * (rightStrokeX2UpperCurveCtrl??0.20)) * size.width,                                    // Ending point of the next curve
        -size.height * (rightStrokeY2UpperCurveCtrl??0.0),                                                   // Ending control point of the next curve
        (loc + s + (rightStrokeX3UpperCurveCtrl??0)) * size.width,                                           // Starting point of the next curve
        rightStrokeY3UpperCurveCtrl??0,                                                                      // Draws a line from the previous point to the right side of the curve
      );
      if(showForeGroundStrokeAllSide){
        path
        ..lineTo(size.width, 0)                                                                         // Draws a line from the last point to the top-right corner
        ..lineTo(size.width, size.height-18.0)                                                          // Draws a line from the previous point to the bottom-right corner
        ..lineTo(0, size.height-18.0)                                                                   // Draws a line from the previous point to the bottom-left corner
        ..close();                                                                                      // Closes the path
      }
      else {
        path
        ..lineTo(size.width, 0)                                                                         // Draws a line from the last point to the top-right corner
        ..moveTo(0, size.width)                                                                         // Moves to the bottom-left corner of the path
        ..close();                                                                                      // Closes the path
      }
    canvas.drawPath(path, paint);                                                                       // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}