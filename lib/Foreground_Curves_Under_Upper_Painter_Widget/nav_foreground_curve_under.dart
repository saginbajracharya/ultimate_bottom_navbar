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

//=========================== Dynamic Bottom Curve ===========================//
class NavForeGroundCurvePainterUnderDynamic extends CustomPainter {
  late double startingLocation;                                                                                                     // Represents the starting location of the curve
  late double curveSize;                                                                                                            // Represents the size of the curve
  late bool useForeGroundGradient;                                                                                                  // Indicates whether to use a gradient for the foreground
  late Shader? foreGroundGradientShader;                                                                                            // Shader for the foreground gradient
  Color fillColor;                                                                                                                  // Color used if not using the gradient
  TextDirection textDirection;                                                                                                      // Direction of the text
  //New
  late double? underCurveWidth;                                                                                                     // Width of a curve
  late double? leftX1UnderCurveCtrl;
  late double? leftY1UnderCurveCtrl;
  late double? leftX2UnderCurveCtrl;
  late double? leftY2UnderCurveCtrl;
  late double? leftX3UnderCurveCtrl;
  late double? leftY3UnderCurveCtrl;
  late double? rightX1UnderCurveCtrl;
  late double? rightY1UnderCurveCtrl;
  late double? rightX2UnderCurveCtrl;
  late double? rightY2UnderCurveCtrl;
  late double? rightX3UnderCurveCtrl;
  late double? rightY3UnderCurveCtrl;
  //

  NavForeGroundCurvePainterUnderDynamic(
    double startingLoc, 
    int itemsLength, 
    this.useForeGroundGradient,
    this.foreGroundGradientShader,
    this.fillColor, 
    this.textDirection,
    //New
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
    //
  ) 
  {
    final span = 1.0 / itemsLength;
    curveSize = underCurveWidth??0.18;
    double l = startingLoc + (span - curveSize) / 2;
    if (textDirection == TextDirection.rtl) {
      startingLocation = calculateLocForRtl(l, curveSize);
    } else if (textDirection == TextDirection.ltr) {
      startingLocation = l;
    } else {
      startingLocation = l;                                                                                                         // Default to LTR if the text direction is not specified
    }
  }

  double calculateLocForRtl(double l, double s) {
    return 1.0 - l - s * 1;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = fillColor                                                                                                           // Sets the desired color
      ..style = PaintingStyle.fill;                                                                                                 // Sets the painting style to fill

    if (!useForeGroundGradient) {
      paint.color = fillColor;                                                                                                      // Set the desired color for the foreground
    } else {
      paint.shader = foreGroundGradientShader ?? defaultGradientShader;                                                             // Set the desired shader for the foreground
    }

    final path = Path()
      ..moveTo(0, 0)                                                                                                                // Moves to the top-left corner
      ..lineTo((startingLocation - 0) * size.width, 0)                                                                              // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (startingLocation + curveSize * (leftX1UnderCurveCtrl??0.50)) * size.width,                                                 // Left Top Curve Radius  // First control point for the curve
        size.height * (leftY1UnderCurveCtrl??0.05),                                                                                 // Left Bottom Curve Radius // Second control point for the curve
        startingLocation * size.width-(leftX2UnderCurveCtrl??8),                                                                    // mid curve width left     // Ending point of the curve 
        size.height * (leftY2UnderCurveCtrl??0.66),                                                                                 // Height Left              // Ending control point of the curve
        (startingLocation + curveSize * (leftX3UnderCurveCtrl??0.50)) * size.width,                                                 // Starting control point of the next curve
        size.height * (leftY3UnderCurveCtrl??0.66),                                                                                 // Height Center            // Ending control point of the next curve
      )
      ..cubicTo(
        (startingLocation + curveSize) * size.width+(rightX1UnderCurveCtrl??8),                                                     // mid curve width right    // First control point for the next curve 
        size.height * (rightY1UnderCurveCtrl??0.66),                                                                                // Height Right             // Second control point for the next curve
        (startingLocation + curveSize - curveSize * (rightX2UnderCurveCtrl??0.50)) * size.width,                                    // Right Top Curve Radius   // Ending point of the next curve
        size.height * (rightY2UnderCurveCtrl??0.05),                                                                                // Right Bottom Curve Radius // Ending control point of the next curve
        (startingLocation + curveSize + (rightX3UnderCurveCtrl??0)) * size.width,                                                   // Starting point of the next curve
        rightY3UnderCurveCtrl??0,                                                                                                   // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                                                                                                       // Draws a line from the last point to the top-right corner
      ..lineTo(size.width, size.height-18.0)                                                                                        // Draws a line from the previous point to the bottom-right corner
      ..lineTo(0, size.height-18.0)                                                                                                 // Draws a line from the previous point to the bottom-left corner
      ..close();                                                                                                                    // Closes the path
    canvas.drawPath(path, paint);                                                                                                   // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Dynamic Bottom Curve Stroke ===========================//
class NavForeGroundUnderStrokeBorderPainterDynamic extends CustomPainter {
  late double loc;                                                                                                                  // Represents the starting location of the curve
  late double s;                                                                                                                    // Represents the size of the curve
  late double strokeBorderWidth;                                                                                                    // Width of the stroke border
  late bool useShaderStroke;                                                                                                        // Indicates whether to use a shader for the stroke
  late bool showForeGroundStrokeAllSide;
  Shader? foregroundStrokeGradientShader;                                                                                           // Shader for the stroke gradient
  Color color;                                                                                                                      // Color used if not using the shader
  TextDirection textDirection;                                                                                                      // Direction of the text
  //New
  late double? underStrokeCurveWidth;                                                                                               // Stroke Curve Width
  late double? leftStrokeX1UnderCurveCtrl;
  late double? leftStrokeY1UnderCurveCtrl;
  late double? leftStrokeX2UnderCurveCtrl;
  late double? leftStrokeY2UnderCurveCtrl;
  late double? leftStrokeX3UnderCurveCtrl;
  late double? leftStrokeY3UnderCurveCtrl;
  late double? rightStrokeX1UnderCurveCtrl;
  late double? rightStrokeY1UnderCurveCtrl;
  late double? rightStrokeX2UnderCurveCtrl;
  late double? rightStrokeY2UnderCurveCtrl;
  late double? rightStrokeX3UnderCurveCtrl;
  late double? rightStrokeY3UnderCurveCtrl;
  //

  NavForeGroundUnderStrokeBorderPainterDynamic(
    double startingLoc, 
    int itemsLength, 
    this.strokeBorderWidth,
    this.useShaderStroke,
    this.showForeGroundStrokeAllSide,
    this.color, 
    this.foregroundStrokeGradientShader,
    this.textDirection,
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
  ) 
  {
    final span = 1.0 / itemsLength;
    s = underStrokeCurveWidth??0.18;
    double l = startingLoc + (span - s) / 2;
    if (textDirection == TextDirection.rtl) {
      loc = calculateLocForRtl(l, s);
    } else if (textDirection == TextDirection.ltr) {
      loc = l;
    } else {
      loc = l;                                                                                                                      // Default to LTR if the text direction is not specified
    }
  }

  double calculateLocForRtl(double l, double s) {
    return 1.0 - l - s * 1;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeBorderWidth                                                                                             // Sets the width of the stroke border
      ..style = PaintingStyle.stroke;                                                                                               // Sets the painting style to stroke

    if (!useShaderStroke) {
      paint.color = color;                                                                                                          // Set the desired color for the stroke
    } else {
      paint.shader = foregroundStrokeGradientShader ?? defaultGradientShader;                                                       // Set the desired shader for the stroke
    }

    final path = Path()
      ..moveTo(0, 0)                                                                                                                // Moves to the top-left corner of the path
      ..lineTo((loc - 0.0) * size.width, 0)                                                                                         // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * (leftStrokeX1UnderCurveCtrl??0.50)) * size.width,                                                                // First control point for the curve
        size.height * (leftStrokeY1UnderCurveCtrl??0.05),                                                                           // Second control point for the curve
        loc * size.width-(leftStrokeX2UnderCurveCtrl??8),                                                                           // Ending point of the curve
        size.height * (leftStrokeY2UnderCurveCtrl??0.66),                                                                           // Ending control point of the curve
        (loc + s * (leftStrokeX3UnderCurveCtrl??0.50)) * size.width,                                                                // Starting control point of the next curve
        size.height * (leftStrokeY3UnderCurveCtrl??0.66),                                                                           // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width+(rightStrokeX1UnderCurveCtrl??8),                                                                    // First control point for the next curve
        size.height * (rightStrokeY1UnderCurveCtrl??0.66),                                                                          // Second control point for the next curve
        (loc + s - s * (rightStrokeX2UnderCurveCtrl??0.50)) * size.width,                                                           // Ending point of the next curve
        size.height * (rightStrokeY2UnderCurveCtrl??0.05),                                                                          // Ending control point of the next curve
        (loc + s + (rightStrokeX3UnderCurveCtrl??0)) * size.width,                                                                  // Starting point of the next curve
        rightStrokeY3UnderCurveCtrl??0,                                                                                             // Draws a line from the previous point to the right side of the curve
      );
      if(showForeGroundStrokeAllSide){
        path
        ..lineTo(size.width, 0)                                                                                                     // Draws a line from the last point to the top-right corner
        ..lineTo(size.width, size.height-18.0)                                                                                      // Draws a line from the previous point to the bottom-right corner
        ..lineTo(0, size.height-18.0)                                                                                               // Draws a line from the previous point to the bottom-left corner
        ..close();                                                                                                                  // Closes the path
      }
      else {
        path
        ..lineTo(size.width, 0)                                                                                                     // Draws a line from the last point to the top-right corner
        ..moveTo(0, size.width)                                                                                                     // Moves to the bottom-left corner of the path
        ..close();                                                                                                                  // Closes the path
      }
    canvas.drawPath(path, paint);                                                                                                   // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Static Under Curve ===========================//
class NavForeGroundCurvePainterUnderStatic extends CustomPainter {
  late double loc;                                                                                                                  // Represents the starting location of the curve
  late double s;                                                                                                                    // Represents the size of the curve
  late bool useForeGroundGradient;                                                                                                  // Indicates whether to use a gradient for the foreground
  late Shader? foreGroundGradientShader;                                                                                            // Shader for the foreground gradient
  Color color;                                                                                                                      // Color used if not using the gradient
  TextDirection textDirection;                                                                                                      // Direction of the text
  //New
  late double? underCurveWidth;                                                                                                     // Stroke Curve Width
  late double? leftX1UnderCurveCtrl;
  late double? leftY1UnderCurveCtrl;
  late double? leftX2UnderCurveCtrl;
  late double? leftY2UnderCurveCtrl;
  late double? leftX3UnderCurveCtrl;
  late double? leftY3UnderCurveCtrl;
  late double? rightX1UnderCurveCtrl;
  late double? rightY1UnderCurveCtrl;
  late double? rightX2UnderCurveCtrl;
  late double? rightY2UnderCurveCtrl;
  late double? rightX3UnderCurveCtrl;
  late double? rightY3UnderCurveCtrl;
  //

  NavForeGroundCurvePainterUnderStatic(
    double startingLoc, 
    int itemsLength, 
    this.useForeGroundGradient,
    this.foreGroundGradientShader,
    this.color, 
    this.textDirection,
    //New
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
    //
  ) 
  {
    s = underCurveWidth??0.18;
    final span = 1.0 / itemsLength;
    loc = span * (itemsLength ~/ 2) + (span - s) / 2;
    if (textDirection == TextDirection.rtl) {
      loc = 1.0 - (loc + s);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color                                                                                                               // Sets the desired color
      ..style = PaintingStyle.fill;                                                                                                 // Sets the painting style to fill

    if (!useForeGroundGradient) {
      paint.color = color;                                                                                                          // Set the desired color for the foreground
    } else {
      paint.shader = foreGroundGradientShader ?? defaultGradientShader;                                                             // Set the desired shader for the foreground
    }
    final path = Path()
      ..moveTo(0, 0)                                                                                                                // Moves to the top-left corner
      ..lineTo((loc - 0) * size.width, 0)                                                                                           // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * (leftX1UnderCurveCtrl??0.50)) * size.width,                                                                      // First control point for the curve
        size.height * (leftY1UnderCurveCtrl??0.05),                                                                                 // Second control point for the curve
        loc * size.width-(leftX2UnderCurveCtrl??8),                                                                                 // Ending point of the curve // to make wider
        size.height * (leftY2UnderCurveCtrl??0.66),                                                                                 // Ending control point of the curve
        (loc + s * (leftX3UnderCurveCtrl??0.50)) * size.width,                                                                      // Starting control point of the next curve
        size.height * (leftY3UnderCurveCtrl??0.66),                                                                                 // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width +(rightX1UnderCurveCtrl??8),                                                                         // First control point for the next curve // to make wider
        size.height * (rightY1UnderCurveCtrl??0.66),                                                                                // Second control point for the next curve
        (loc + s - s * (rightX2UnderCurveCtrl??0.50)) * size.width,                                                                 // Ending point of the next curve
        size.height * (rightY2UnderCurveCtrl??0.05),                                                                                // Ending control point of the next curve
        (loc + s + (rightX3UnderCurveCtrl??0)) * size.width,                                                                        // Starting point of the next curve
        rightY3UnderCurveCtrl??0,                                                                                                   // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                                                                                                       // Draws a line from the last point to the top-right corner
      ..lineTo(size.width, size.height-18.0)                                                                                        // Draws a line from the previous point to the bottom-right corner
      ..lineTo(0, size.height-18.0)                                                                                                 // Draws a line from the previous point to the bottom-left corner
      ..close();                                                                                                                    // Closes the path
    canvas.drawPath(path, paint);                                                                                                   // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Static Under Curve Stroke ===========================//
class NavForeGroundUnderStrokeBorderPainterStatic extends CustomPainter {
  late double loc;                                                                                                                  // Represents the starting location of the curve
  late double s;                                                                                                                    // Represents the size of the curve
  late double strokeBorderWidth;                                                                                                    // Width of the stroke border
  late bool useShaderStroke;                                                                                                        // Indicates whether to use a shader for the stroke
  late bool showForeGroundStrokeAllSide;
  Shader? foregroundStrokeGradientShader;                                                                                           // Shader for the stroke gradient
  Color color;                                                                                                                      // Color used if not using the shader
  TextDirection textDirection;                                                                                                      // Direction of the text
  //New
  late double? underStrokeCurveWidth;                                                                                               // Stroke Curve Width
  late double? leftStrokeX1UnderCurveCtrl;
  late double? leftStrokeY1UnderCurveCtrl;
  late double? leftStrokeX2UnderCurveCtrl;
  late double? leftStrokeY2UnderCurveCtrl;
  late double? leftStrokeX3UnderCurveCtrl;
  late double? leftStrokeY3UnderCurveCtrl;
  late double? rightStrokeX1UnderCurveCtrl;
  late double? rightStrokeY1UnderCurveCtrl;
  late double? rightStrokeX2UnderCurveCtrl;
  late double? rightStrokeY2UnderCurveCtrl;
  late double? rightStrokeX3UnderCurveCtrl;
  late double? rightStrokeY3UnderCurveCtrl;
  //

  NavForeGroundUnderStrokeBorderPainterStatic(
    double startingLoc, 
    int itemsLength, 
    this.strokeBorderWidth,
    this.useShaderStroke,
    this.showForeGroundStrokeAllSide,
    this.color, 
    this.foregroundStrokeGradientShader,
    this.textDirection,
    //New
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
  ) 
  {
    s = underStrokeCurveWidth??0.18;
    final span = 1.0 / itemsLength;
    loc = span * (itemsLength ~/ 2) + (span - s) / 2;
    if (textDirection == TextDirection.rtl) {
      loc = 1.0 - (loc + s);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeBorderWidth                                                                                             // Sets the width of the stroke border
      ..style = PaintingStyle.stroke;                                                                                               // Sets the painting style to stroke
    if (!useShaderStroke) {
      paint.color = color;                                                                                                          // Set the desired color for the stroke
    } else {
      paint.shader = foregroundStrokeGradientShader ?? defaultGradientShader;                                                       // Set the desired shader for the stroke
    }
    final path = Path()
      ..moveTo(0, 0)                                                                                                                // Moves to the top-left corner of the path
      ..lineTo((loc - 0) * size.width, 0)                                                                                           // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * (leftStrokeX1UnderCurveCtrl??0.50)) * size.width,                                                                // First control point for the curve
        size.height * (leftStrokeY1UnderCurveCtrl??0.05),                                                                           // Second control point for the curve
        loc * size.width -(leftStrokeX2UnderCurveCtrl??8),                                                                          // Ending point of the curve
        size.height * (leftStrokeY2UnderCurveCtrl??0.66),                                                                           // Ending control point of the curve
        (loc + s * (leftStrokeX3UnderCurveCtrl??0.50)) * size.width,                                                                // Starting control point of the next curve
        size.height * (leftStrokeY3UnderCurveCtrl??0.66),                                                                           // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width +(rightStrokeX1UnderCurveCtrl??8),                                                                   // First control point for the next curve
        size.height * (rightStrokeY1UnderCurveCtrl??0.66),                                                                          // Second control point for the next curve
        (loc + s - s * (rightStrokeX2UnderCurveCtrl??0.50)) * size.width,                                                           // Ending point of the next curve
        size.height * (rightStrokeY2UnderCurveCtrl??0.05),                                                                          // Ending control point of the next curve
        (loc + s + (rightStrokeX3UnderCurveCtrl??0)) * size.width,                                                                  // Starting point of the next curve
        rightStrokeY3UnderCurveCtrl??0,                                                                                             // Draws a line from the previous point to the right side of the curve
      );
      if(showForeGroundStrokeAllSide){
        path
        ..lineTo(size.width, 0)                                                                                                     // Draws a line from the last point to the top-right corner
        ..lineTo(size.width, size.height-18.0)                                                                                      // Draws a line from the previous point to the bottom-right corner
        ..lineTo(0, size.height-18.0)                                                                                               // Draws a line from the previous point to the bottom-left corner
        ..close();                                                                                                                  // Closes the path
      }
      else {
        path
        ..lineTo(size.width, 0)                                                                                                     // Draws a line from the last point to the top-right corner
        ..moveTo(0, size.width)                                                                                                     // Moves to the bottom-left corner of the path
        ..close();                                                                                                                  // Closes the path
      }
    canvas.drawPath(path, paint);                                                                                                   // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}