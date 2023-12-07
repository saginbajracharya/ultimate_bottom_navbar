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
  late double? upperCurveHeight;
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
    this.upperCurveHeight,
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
      loc = l;                                                                // Default to LTR if the text direction is not specified
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

    const double bottomPadding = 18.0;                                        // Adjust the value as needed
    final path = Path()
      ..moveTo(0, 0)                                                          // Moves to the starting point of the path
      ..lineTo(size.width, 0)                                                 // Draws a line from the starting point to the top-right corner
      ..lineTo(size.width, size.height - bottomPadding)                       // Draws a line from the top-right corner to the bottom-right corner (with padding)
      ..lineTo(0, size.height - bottomPadding)                                // Draws a line from the bottom-right corner (with padding) to the bottom-left corner
      ..moveTo(-size.height, 0)                                               // Moves to a point outside the canvas on the left side
      ..lineTo((loc - 0) * size.width, 0)                                     // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * 0.20) * size.width,                                        // First control point for the curve
        -0.0,                                                                 // Second control point for the curve
        loc * size.width + 6,                                                 // Ending point of the curve
        -size.height * (upperCurveHeight??0.12),                              // Ending control point of the curve
        (loc + s * 0.5) * size.width,                                         // Starting control point of the next curve
        -size.height * (upperCurveHeight??0.12),                              // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width - 6,                                           // First control point for the next curve
        -size.height * (upperCurveHeight??0.12),                              // Second control point for the next curve
        (loc + s - s * 0.20) * size.width,                                    // Ending point of the next curve
        -0.0,                                                                 // Ending control point of the next curve
        (loc + s + 0) * size.width,                                           // Starting point of the next curve
        0,                                                                    // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                                                 // Draws a line from the last point to the top-right corner
      ..moveTo(0, size.height - bottomPadding)                                // Moves to the bottom-left corner (with padding)
      ..close();                                                              // Closes the path

    canvas.drawPath(path, paint);                                             // Draws the path on the canvas

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
  late double? upperStrokeCurveHeight;
  //

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
    this.upperStrokeCurveHeight,
    //
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
      // Handle other text directions if needed
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
      ..style = PaintingStyle.stroke;                                         // Sets the painting style to stroke (outline)
      
    if (!useShaderStroke) {
      paint.color = color;                                                    // Set the desired color for the stroke
    } else {
      paint.shader = foregroundStrokeGradientShader ?? defaultGradientShader; // Set the desired shader for the stroke
    }

    final path = Path()
      ..moveTo(0, 0)                                                          // Moves to a point outside the canvas on the left side
      ..lineTo((loc - 0) * size.width, 0)                                     // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * 0.20) * size.width,                                        // First control point for the curve
        -0.0,                                                                 // Second control point for the curve
        loc * size.width + 6,                                                 // Ending point of the curve
        -size.height * (upperStrokeCurveHeight??0.12),                        // Ending control point of the curve
        (loc + s * 0.5) * size.width,                                         // Starting control point of the next curve
        -size.height * (upperStrokeCurveHeight??0.12),                        // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width-6,                                             // First control point for the next curve
        -size.height * (upperStrokeCurveHeight??0.12),                        // Second control point for the next curve
        (loc + s - s * 0.20) * size.width,                                    // Ending point of the next curve
        -0.0,                                                                 // Ending control point of the next curve
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
  late double? upperCurveHeight;
  //

  NavForeGroundCurvePainterUpperStatic(
    double startingLoc, 
    int itemsLength, 
    this.useForeGroundGradient,
    this.foreGroundGradientShader,
    this.color, 
    this.textDirection,
    //New
    this.upperCurveWidth,
    this.upperCurveHeight,
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

    const double bottomPadding = 18.0;                                        // Adjust the value as needed
    final path = Path()
      ..moveTo(0, 0)                                                          // Moves to the starting point of the path
      ..lineTo(size.width, 0)                                                 // Draws a line from the starting point to the top-right corner
      ..lineTo(size.width, size.height-bottomPadding)                         // Draws a line from the top-right corner to the bottom-right corner
      ..lineTo(0, size.height-bottomPadding)                                  // Draws a line from the bottom-right corner to the bottom-left corner
      ..moveTo(-size.height, 0)                                               // Moves to a point outside the canvas on the left side
      ..lineTo((loc - 0) * size.width, 0)                                     // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * 0.20) * size.width,                                        // First control point for the curve
        -size.height * 0.02,                                                  // Second control point for the curve
        loc * size.width+10,                                                  // Ending point of the curve
        -size.height * (upperCurveHeight??0.12),                              // Ending control point of the curve
        (loc + s * 0.50) * size.width,                                        // Starting control point of the next curve
        -size.height * (upperCurveHeight??0.12),                              // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width-10,                                            // First control point for the next curve
        -size.height * (upperCurveHeight??0.12),                              // Second control point for the next curve
        (loc + s - s * 0.20) * size.width,                                    // Ending point of the next curve
        -size.height * 0.0,                                                   // Ending control point of the next curve
        (loc + s + 0) * size.width,                                           // Starting point of the next curve
        0,                                                                    // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                                                 // Draws a line from the last point to the top-right corner
      ..moveTo(0, size.height-bottomPadding)                                  // Moves to the bottom-left corner
      ..close();                                                              // Closes the path

    canvas.drawPath(path, paint);                                             // Draws the path on the canvas
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
  late double? upperStrokeCurveHeight;
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
    this.upperStrokeCurveHeight,
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
      ..strokeWidth = strokeBorderWidth                                       // Sets the width of the stroke border
      ..style = PaintingStyle.stroke;                                         // Sets the painting style to stroke (outline)
      
    if (!useShaderStroke) {
      paint.color = color;                                                    // Set the desired color for the stroke
    } else {
      paint.shader = foregroundStrokeGradientShader ?? defaultGradientShader; // Set the desired shader for the stroke
    }

    final path = Path()
      ..moveTo(0, 0)                                                          // Moves to a point outside the canvas on the left side
      ..lineTo((loc - 0) * size.width, 0)                                     // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * 0.20) * size.width,                                        // First control point for the curve
        -size.height * 0.0,                                                   // Second control point for the curve
        loc * size.width+10,                                                  // Ending point of the curve
        -size.height * (upperStrokeCurveHeight??0.12),                        // Ending control point of the curve
        (loc + s * 0.50) * size.width,                                        // Starting control point of the next curve
        -size.height * (upperStrokeCurveHeight??0.12),                        // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width-10,                                            // First control point for the next curve
        -size.height * (upperStrokeCurveHeight??0.12),                        // Second control point for the next curve
        (loc + s - s * 0.20) * size.width,                                    // Ending point of the next curve
        -size.height * 0.0,                                                   // Ending control point of the next curve
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