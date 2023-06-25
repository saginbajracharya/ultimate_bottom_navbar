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
class NavForeGroundCurvePainterUpper extends CustomPainter {
  late double loc; // Represents the starting location of the curve
  late double s; // Represents the size of the curve
  late bool useForeGroundGradient; // Indicates whether to use a foreground gradient
  late Shader? foreGroundGradientShader; // Shader for the foreground gradient
  Color color; // Color used if not using the foreground gradient
  TextDirection textDirection; // Direction of the text

  NavForeGroundCurvePainterUpper(
    double startingLoc, 
    int itemsLength, 
    this.useForeGroundGradient,
    this.foreGroundGradientShader,
    this.color, 
    this.textDirection
  ) 
  {
    final span = 1.0 / itemsLength;
    s = 0.16;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
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

    final path = Path()
      ..moveTo(0, 0)                         // Moves to the starting point of the path
      ..lineTo(size.width, 0)                // Draws a line from the starting point to the top-right corner
      ..lineTo(size.width, size.height)      // Draws a line from the top-right corner to the bottom-right corner
      ..lineTo(0, size.height)               // Draws a line from the bottom-right corner to the bottom-left corner
      ..moveTo(-size.height, 0)              // Moves to a point outside the canvas on the left side
      ..lineTo((loc - 0.03) * size.width, 0) // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * 0.20) * size.width,       // First control point for the curve
        -0.0,                                // Second control point for the curve
        loc * size.width + 6,                // Ending point of the curve
        -size.height * 0.12,                 // Ending control point of the curve
        (loc + s * 0.5) * size.width,        // Starting control point of the next curve
        -size.height * 0.14,                 // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width-6,            // First control point for the next curve
        -size.height * 0.12,                 // Second control point for the next curve
        (loc + s - s * 0.20) * size.width,   // Ending point of the next curve
        -0.0,                                // Ending control point of the next curve
        (loc + s + 0.03) * size.width,       // Starting point of the next curve
        0,                                   // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                // Draws a line from the last point to the top-right corner
      ..moveTo(0, size.height)               // Moves to the bottom-left corner
      ..close();                             // Closes the path

    canvas.drawPath(path, paint);            // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Dynamic Upper Curve Stroke ===========================//
class NavForeGroundUpperStrokeBorderPainter extends CustomPainter {
  late double loc; // Represents the starting location of the curve
  late double s; // Represents the size of the curve
  late double strokeBorderWidth; // Width of the stroke border
  late bool useShaderStroke; // Indicates whether to use a shader for the stroke
  Color color; // Color used if not using the shader for stroke
  Shader? strokeGradientShader; // Shader for the stroke gradient
  TextDirection textDirection; // Direction of the text

  NavForeGroundUpperStrokeBorderPainter(
    double startingLoc, 
    int itemsLength, 
    this.color, 
    this.textDirection,
    this.strokeBorderWidth,
    this.strokeGradientShader,
    this.useShaderStroke,
  ) 
  {
    final span = 1.0 / itemsLength;
    s = 0.16;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeBorderWidth // Sets the width of the stroke border
      ..style = PaintingStyle.stroke; // Sets the painting style to stroke (outline)
      
    if (!useShaderStroke) {
      paint.color = color; // Set the desired color for the stroke
    } else {
      paint.shader = strokeGradientShader ?? defaultGradientShader; // Set the desired shader for the stroke
    }

    final path = Path()
      ..moveTo(-size.height, 0)              // Moves to a point outside the canvas on the left side
      ..lineTo((loc - 0.03) * size.width, 0) // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * 0.20) * size.width,       // First control point for the curve
        -0.0,                                // Second control point for the curve
        loc * size.width + 6,                // Ending point of the curve
        -size.height * 0.12,                 // Ending control point of the curve
        (loc + s * 0.5) * size.width,        // Starting control point of the next curve
        -size.height * 0.14,                 // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width-6,            // First control point for the next curve
        -size.height * 0.12,                 // Second control point for the next curve
        (loc + s - s * 0.20) * size.width,   // Ending point of the next curve
        -0.0,                                // Ending control point of the next curve
        (loc + s + 0.03) * size.width,       // Starting point of the next curve
        0,                                   // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                // Draws a line from the last point to the top-right corner
      ..moveTo(0, size.width)                // Moves to the bottom-left corner
      ..close();                             // Closes the path

    canvas.drawPath(path, paint);            // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Static Upper Curve ===========================//
class NavForeGroundCurvePainterUpperStatic extends CustomPainter {
  late double loc; // Represents the starting location of the curve
  late double s; // Represents the size of the curve
  late bool useForeGroundGradient; // Indicates whether to use a foreground gradient
  late Shader? foreGroundGradientShader; // Shader for the foreground gradient
  Color color; // Color used if not using the foreground gradient
  TextDirection textDirection; // Direction of the text

  NavForeGroundCurvePainterUpperStatic(
    double startingLoc, 
    int itemsLength, 
    this.useForeGroundGradient,
    this.foreGroundGradientShader,
    this.color, 
    this.textDirection
  ) 
  {
    s = 0.16;
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

    final path = Path()
      ..moveTo(0, 0)                         // Moves to the starting point of the path
      ..lineTo(size.width, 0)                // Draws a line from the starting point to the top-right corner
      ..lineTo(size.width, size.height)      // Draws a line from the top-right corner to the bottom-right corner
      ..lineTo(0, size.height)               // Draws a line from the bottom-right corner to the bottom-left corner
      ..moveTo(-size.height, 0)              // Moves to a point outside the canvas on the left side
      ..lineTo((loc - 0.03) * size.width, 0) // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * 0.20) * size.width,       // First control point for the curve
        -size.height * 0.02,                 // Second control point for the curve
        loc * size.width+10,                 // Ending point of the curve
        -size.height * 0.14,                 // Ending control point of the curve
        (loc + s * 0.50) * size.width,       // Starting control point of the next curve
        -size.height * 0.14,                 // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width-10,           // First control point for the next curve
        -size.height * 0.14,                 // Second control point for the next curve
        (loc + s - s * 0.20) * size.width,   // Ending point of the next curve
        -size.height * 0.0,                  // Ending control point of the next curve
        (loc + s + 0.03) * size.width,       // Starting point of the next curve
        0,                                   // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                // Draws a line from the last point to the top-right corner
      ..moveTo(0, size.height)               // Moves to the bottom-left corner
      ..close();                             // Closes the path

    canvas.drawPath(path, paint);            // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Static Upper Curve Stroke ===========================//
class NavForeGroundUpperStrokeBorderPainterStatic extends CustomPainter {
  late double loc; // Represents the starting location of the curve
  late double s; // Represents the size of the curve
  late double strokeBorderWidth; // Width of the stroke border
  late bool useShaderStroke; // Indicates whether to use a shader for the stroke
  Color color; // Color used if not using the shader for stroke
  Shader? strokeGradientShader; // Shader for the stroke gradient
  TextDirection textDirection; // Direction of the text

  NavForeGroundUpperStrokeBorderPainterStatic(
    double startingLoc, 
    int itemsLength, 
    this.color, 
    this.textDirection,
    this.strokeBorderWidth,
    this.strokeGradientShader,
    this.useShaderStroke,
  ) 
  {
    s = 0.16;
    final span = 1.0 / itemsLength;
    loc = span * (itemsLength ~/ 2) + (span - s) / 2;
    if (textDirection == TextDirection.rtl) {
      loc = 1.0 - (loc + s);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeBorderWidth // Sets the width of the stroke border
      ..style = PaintingStyle.stroke; // Sets the painting style to stroke (outline)
      
    if (!useShaderStroke) {
      paint.color = color; // Set the desired color for the stroke
    } else {
      paint.shader = strokeGradientShader ?? defaultGradientShader; // Set the desired shader for the stroke
    }

    final path = Path()
      ..moveTo(-size.height, 0)              // Moves to a point outside the canvas on the left side
      ..lineTo((loc - 0.03) * size.width, 0) // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * 0.20) * size.width,       // First control point for the curve
        -size.height * 0.0,                  // Second control point for the curve
        loc * size.width+10,                 // Ending point of the curve
        -size.height * 0.14,                 // Ending control point of the curve
        (loc + s * 0.50) * size.width,       // Starting control point of the next curve
        -size.height * 0.14,                 // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width-10,           // First control point for the next curve
        -size.height * 0.14,                 // Second control point for the next curve
        (loc + s - s * 0.20) * size.width,   // Ending point of the next curve
        -size.height * 0.0,                  // Ending control point of the next curve
        (loc + s + 0.03) * size.width,       // Starting point of the next curve
        0,                                   // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                // Draws a line from the last point to the top-right corner
      ..moveTo(0, size.width)                // Moves to the bottom-left corner
      ..close();                             // Closes the path

    canvas.drawPath(path, paint);            // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}