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
  late double loc;                                                            // Represents the starting location of the curve
  late double s;                                                              // Represents the size of the curve
  late bool useForeGroundGradient;                                            // Indicates whether to use a gradient for the foreground
  late Shader? foreGroundGradientShader;                                      // Shader for the foreground gradient
  Color color;                                                                // Color used if not using the gradient
  TextDirection textDirection;                                                // Direction of the text
  //New
  late double? underCurveWidth;                                               // Width of a curve
  late double? underCurveHeight;                                              // Height of a curve
  late double? underTopCurveWidthLeft;                                        // Left Top part width 
  late double? underTopCurveWidthRight;                                       // Right Top part width
  late double? underMidCurveWidthLeft;                                        // Left Mid part width 
  late double? underMidCurveWidthRight;                                       // Right Mid part width
  late double? underBottomCurveRadiusLeft;                                    // Left Bottom Curve Radius
  late double? underBottomCurveRadiusRight;                                   // Right Bottom Curve Radius
  //

  NavForeGroundCurvePainterUnderDynamic(
    double startingLoc, 
    int itemsLength, 
    this.useForeGroundGradient,
    this.foreGroundGradientShader,
    this.color, 
    this.textDirection,
    //New
    this.underCurveWidth,
    this.underCurveHeight,
    this.underTopCurveWidthLeft,
    this.underTopCurveWidthRight,
    this.underMidCurveWidthLeft,
    this.underMidCurveWidthRight,
    this.underBottomCurveRadiusLeft,
    this.underBottomCurveRadiusRight,
    //
  ) 
  {
    final span = 1.0 / itemsLength;
    s = underCurveWidth??0.18;
    double l = startingLoc + (span - s) / 2;
    if (textDirection == TextDirection.rtl) {
      loc = calculateLocForRtl(l, s);
    } else if (textDirection == TextDirection.ltr) {
      loc = l;
    } else {
      loc = l;                                                                // Default to LTR if the text direction is not specified
    }
  }

  double calculateLocForRtl(double l, double s) {
    return 1.0 - l - s * 1;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color                                                         // Sets the desired color
      ..style = PaintingStyle.fill;                                           // Sets the painting style to fill

    if (!useForeGroundGradient) {
      paint.color = color;                                                    // Set the desired color for the foreground
    } else {
      paint.shader = foreGroundGradientShader ?? defaultGradientShader;       // Set the desired shader for the foreground
    }

    final path = Path()
      ..moveTo(0, 0)                                                          // Moves to the top-left corner
      ..lineTo((loc - 0) * size.width, 0)                                     // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * (underTopCurveWidthLeft??0.20)) * size.width,              // Left Top Curve Radius  // First control point for the curve
        size.height * (underBottomCurveRadiusLeft??0.05),                     // Left Bottom Curve Radius // Second control point for the curve
        loc * size.width-(underMidCurveWidthLeft??8),                         // mid curve width left     // Ending point of the curve 
        size.height * (underCurveHeight??0.72),                               // Height Left              // Ending control point of the curve
        (loc + s * 0.50) * size.width,                                        // Starting control point of the next curve
        size.height * (underCurveHeight??0.72),                               // Height Center            // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width+(underMidCurveWidthRight??8),                  // mid curve width right    // First control point for the next curve 
        size.height * (underCurveHeight??0.72),                               // Height Right             // Second control point for the next curve
        (loc + s - s * (underTopCurveWidthRight??0.20)) * size.width,         // Right Top Curve Radius   // Ending point of the next curve
        size.height * (underBottomCurveRadiusRight??0.05),                    // Right Bottom Curve Radius // Ending control point of the next curve
        (loc + s + 0) * size.width,                                           // Starting point of the next curve
        0,                                                                    // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                                                 // Draws a line from the last point to the top-right corner
      ..lineTo(size.width, size.height-18.0)                                  // Draws a line from the previous point to the bottom-right corner
      ..lineTo(0, size.height-18.0)                                           // Draws a line from the previous point to the bottom-left corner
      ..close();                                                              // Closes the path
    canvas.drawPath(path, paint);                                             // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Dynamic Bottom Curve Stroke ===========================//
class NavForeGroundUnderStrokeBorderPainterDynamic extends CustomPainter {
  late double loc;                                                            // Represents the starting location of the curve
  late double s;                                                              // Represents the size of the curve
  late double strokeBorderWidth;                                              // Width of the stroke border
  late bool useShaderStroke;                                                  // Indicates whether to use a shader for the stroke
  late bool showForeGroundStrokeAllSide;
  Shader? foregroundStrokeGradientShader;                                     // Shader for the stroke gradient
  Color color;                                                                // Color used if not using the shader
  TextDirection textDirection;                                                // Direction of the text
  //New
  late double? underStrokeCurveWidth;                                         // Stroke Curve Width
  late double? underStrokeCurveHeight;                                        // Stroke Curve height 
  late double? underStrokeTopCurveRadiusLeft;                                 // Left Top part width 
  late double? underStrokeTopCurveRadiusRight;                                // Right Top part width
  late double? underStrokeMidCurveWidthLeft;                                  // Left middle part width 
  late double? underStrokeMidCurveWidthRight;                                 // Right middle part width
  late double? underStrokeBottomCurveRadiusLeft;                              // Left Bottom Curve Radius
  late double? underStrokeBottomCurveRadiusRight;                             // Right Bottom Curve Radius
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
    this.underStrokeCurveHeight,
    this.underStrokeTopCurveRadiusLeft,
    this.underStrokeTopCurveRadiusRight,
    this.underStrokeMidCurveWidthLeft,
    this.underStrokeMidCurveWidthRight,
    this.underStrokeBottomCurveRadiusLeft,
    this.underStrokeBottomCurveRadiusRight,
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
      loc = l;                                                                // Default to LTR if the text direction is not specified
    }
  }

  double calculateLocForRtl(double l, double s) {
    return 1.0 - l - s * 1;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeBorderWidth                                       // Sets the width of the stroke border
      ..style = PaintingStyle.stroke;                                         // Sets the painting style to stroke

    if (!useShaderStroke) {
      paint.color = color;                                                    // Set the desired color for the stroke
    } else {
      paint.shader = foregroundStrokeGradientShader ?? defaultGradientShader; // Set the desired shader for the stroke
    }

    final path = Path()
      ..moveTo(0, 0)                                                          // Moves to the top-left corner of the path
      ..lineTo((loc - 0.0) * size.width, 0)                                   // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * (underStrokeTopCurveRadiusLeft??0.20)) * size.width,        // First control point for the curve
        size.height * (underStrokeBottomCurveRadiusLeft??0.05),               // Second control point for the curve
        loc * size.width-(underStrokeMidCurveWidthLeft??8),                   // Ending point of the curve
        size.height * (underStrokeCurveHeight??0.72),                         // Ending control point of the curve
        (loc + s * 0.50) * size.width,                                        // Starting control point of the next curve
        size.height * (underStrokeCurveHeight??0.72),                         // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width+(underStrokeMidCurveWidthRight??8),            // First control point for the next curve
        size.height * (underStrokeCurveHeight??0.72),                         // Second control point for the next curve
        (loc + s - s * (underStrokeTopCurveRadiusRight??0.20)) * size.width,   // Ending point of the next curve
        size.height * (underStrokeBottomCurveRadiusRight??0.05),              // Ending control point of the next curve
        (loc + s + 0) * size.width,                                           // Starting point of the next curve
        0,                                                                    // Draws a line from the previous point to the right side of the curve
      );
      if(showForeGroundStrokeAllSide){
        path
        ..lineTo(size.width, 0)                                               // Draws a line from the last point to the top-right corner
        ..lineTo(size.width, size.height-18.0)                                // Draws a line from the previous point to the bottom-right corner
        ..lineTo(0, size.height-18.0)                                         // Draws a line from the previous point to the bottom-left corner
        ..close();                                                            // Closes the path
      }
      else {
        path
        ..lineTo(size.width, 0)                                               // Draws a line from the last point to the top-right corner
        ..moveTo(0, size.width)                                               // Moves to the bottom-left corner of the path
        ..close();                                                            // Closes the path
      }
    canvas.drawPath(path, paint);                                             // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Static Under Curve ===========================//
class NavForeGroundCurvePainterUnderStatic extends CustomPainter {
  late double loc;                                                            // Represents the starting location of the curve
  late double s;                                                              // Represents the size of the curve
  late bool useForeGroundGradient;                                            // Indicates whether to use a gradient for the foreground
  late Shader? foreGroundGradientShader;                                      // Shader for the foreground gradient
  Color color;                                                                // Color used if not using the gradient
  TextDirection textDirection;                                                // Direction of the text
  //New
  late double? underCurveWidth;                                               // Stroke Curve Width
  late double? underCurveHeight;                                              // Stroke Curve height
  late double? underTopCurveRadiusLeft;                                       // Left Top Curve Radius
  late double? underTopCurveRadiusRight;                                      // Right Top Curve Radius
  late double? underMidCurveWidthLeft;                                        // Left middle part width 
  late double? underMidCurveWidthRight;                                       // Right middle part width
  late double? underBottomCurveRadiusLeft;                                    // Left Bottom Curve Radius
  late double? underBottomCurveRadiusRight;                                   // Right Bottom Curve Radius
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
    this.underCurveHeight,
    this.underTopCurveRadiusLeft,
    this.underTopCurveRadiusRight,
    this.underMidCurveWidthLeft,
    this.underMidCurveWidthRight,
    this.underBottomCurveRadiusLeft,
    this.underBottomCurveRadiusRight,
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
      ..color = color                                                         // Sets the desired color
      ..style = PaintingStyle.fill;                                           // Sets the painting style to fill

    if (!useForeGroundGradient) {
      paint.color = color;                                                    // Set the desired color for the foreground
    } else {
      paint.shader = foreGroundGradientShader ?? defaultGradientShader;       // Set the desired shader for the foreground
    }
    final path = Path()
      ..moveTo(0, 0)                                                          // Moves to the top-left corner
      ..lineTo((loc - 0) * size.width, 0)                                     // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * (underTopCurveRadiusLeft??0.20)) * size.width,             // First control point for the curve
        size.height * (underBottomCurveRadiusLeft??0.05),                     // Second control point for the curve
        loc * size.width-(underMidCurveWidthLeft??8),                         // Ending point of the curve // to make wider
        size.height * (underCurveHeight??0.72),                               // Ending control point of the curve
        (loc + s * 0.50) * size.width,                                        // Starting control point of the next curve
        size.height * (underCurveHeight??0.72),                               // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width +(underMidCurveWidthRight??8),                 // First control point for the next curve // to make wider
        size.height * (underCurveHeight??0.72),                               // Second control point for the next curve
        (loc + s - s * (underTopCurveRadiusRight??0.20)) * size.width,        // Ending point of the next curve
        size.height * (underBottomCurveRadiusRight??0.05),                    // Ending control point of the next curve
        (loc + s + 0) * size.width,                                           // Starting point of the next curve
        0,                                                                    // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                                                 // Draws a line from the last point to the top-right corner
      ..lineTo(size.width, size.height-18.0)                                  // Draws a line from the previous point to the bottom-right corner
      ..lineTo(0, size.height-18.0)                                           // Draws a line from the previous point to the bottom-left corner
      ..close();                                                              // Closes the path
    canvas.drawPath(path, paint);                                             // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Static Under Curve Stroke ===========================//
class NavForeGroundUnderStrokeBorderPainterStatic extends CustomPainter {
  late double loc;                                                            // Represents the starting location of the curve
  late double s;                                                              // Represents the size of the curve
  late double strokeBorderWidth;                                              // Width of the stroke border
  late bool useShaderStroke;                                                  // Indicates whether to use a shader for the stroke
  late bool showForeGroundStrokeAllSide;
  Shader? foregroundStrokeGradientShader;                                     // Shader for the stroke gradient
  Color color;                                                                // Color used if not using the shader
  TextDirection textDirection;                                                // Direction of the text
  //New
  late double? underStrokeCurveWidth;                                         // Stroke Curve Width
  late double? underStrokeCurveHeight;                                        // Stroke Curve height  
  late double? underStrokeTopCurveRadiusLeft;                                 // Left Top part width 
  late double? underStrokeTopCurveRadiusRight;                                // Right Top part width
  late double? underStrokeMidCurveWidthLeft;                                  // Left middle part width 
  late double? underStrokeMidCurveWidthRight;                                 // Right middle part width
  late double? underStrokeBottomCurveRadiusLeft;                              // Left Bottom Curve Radius
  late double? underStrokeBottomCurveRadiusRight;                             // Right Bottom Curve Radius
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
    this.underStrokeCurveHeight,
    this.underStrokeTopCurveRadiusLeft,
    this.underStrokeTopCurveRadiusRight,
    this.underStrokeMidCurveWidthLeft,
    this.underStrokeMidCurveWidthRight,
    this.underStrokeBottomCurveRadiusLeft,
    this.underStrokeBottomCurveRadiusRight,
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
      ..strokeWidth = strokeBorderWidth                                       // Sets the width of the stroke border
      ..style = PaintingStyle.stroke;                                         // Sets the painting style to stroke
    if (!useShaderStroke) {
      paint.color = color;                                                    // Set the desired color for the stroke
    } else {
      paint.shader = foregroundStrokeGradientShader ?? defaultGradientShader; // Set the desired shader for the stroke
    }
    final path = Path()
      ..moveTo(0, 0)                                                          // Moves to the top-left corner of the path
      ..lineTo((loc - 0) * size.width, 0)                                     // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * (underStrokeTopCurveRadiusLeft??0.20)) * size.width,        // First control point for the curve
        size.height * (underStrokeBottomCurveRadiusLeft??0.05),               // Second control point for the curve
        loc * size.width -(underStrokeMidCurveWidthLeft??8),                  // Ending point of the curve
        size.height * (underStrokeCurveHeight??0.72),                         // Ending control point of the curve
        (loc + s * 0.50) * size.width,                                        // Starting control point of the next curve
        size.height * (underStrokeCurveHeight??0.72),                         // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width +(underStrokeMidCurveWidthRight??8),           // First control point for the next curve
        size.height * (underStrokeCurveHeight??0.72),                         // Second control point for the next curve
        (loc + s - s * (underStrokeTopCurveRadiusRight??0.20)) * size.width,   // Ending point of the next curve
        size.height * (underStrokeBottomCurveRadiusRight??0.05),              // Ending control point of the next curve
        (loc + s + 0) * size.width,                                           // Starting point of the next curve
        0,                                                                    // Draws a line from the previous point to the right side of the curve
      );
      if(showForeGroundStrokeAllSide){
        path
        ..lineTo(size.width, 0)                                               // Draws a line from the last point to the top-right corner
        ..lineTo(size.width, size.height-18.0)                                // Draws a line from the previous point to the bottom-right corner
        ..lineTo(0, size.height-18.0)                                         // Draws a line from the previous point to the bottom-left corner
        ..close();                                                            // Closes the path
      }
      else {
        path
        ..lineTo(size.width, 0)                                               // Draws a line from the last point to the top-right corner
        ..moveTo(0, size.width)                                               // Moves to the bottom-left corner of the path
        ..close();                                                            // Closes the path
      }
    canvas.drawPath(path, paint);                                             // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}