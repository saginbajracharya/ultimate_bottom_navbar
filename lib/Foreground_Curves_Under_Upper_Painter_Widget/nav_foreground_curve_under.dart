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
class NavForeGroundCurvePainterUnder extends CustomPainter {
  late double loc; // Represents the starting location of the curve
  late double s; // Represents the size of the curve
  late bool useForeGroundGradient; // Indicates whether to use a gradient for the foreground
  late Shader? foreGroundGradientShader; // Shader for the foreground gradient
  Color color; // Color used if not using the gradient
  TextDirection textDirection; // Direction of the text

  NavForeGroundCurvePainterUnder(
    double startingLoc, 
    int itemsLength, 
    this.useForeGroundGradient,
    this.foreGroundGradientShader,
    this.color, 
    this.textDirection
  ) 
  {
    final span = 1.0 / itemsLength;
    s = 0.18;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color // Sets the desired color
      ..style = PaintingStyle.fill; // Sets the painting style to fill

    if (!useForeGroundGradient) {
      paint.color = color; // Set the desired color for the foreground
    } else {
      paint.shader = foreGroundGradientShader ?? defaultGradientShader; // Set the desired shader for the foreground
    }

    final path = Path()
      ..moveTo(0, 0)                         // Moves to the top-left corner
      ..lineTo((loc - 0.02) * size.width, 0) // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * 0.20) * size.width,       // First control point for the curve
        size.height * 0.05,                  // Second control point for the curve
        loc * size.width-8,                  // Ending point of the curve
        size.height * 0.72,                  // Ending control point of the curve
        (loc + s * 0.50) * size.width,       // Starting control point of the next curve
        size.height * 0.72,                  // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width+8,            // First control point for the next curve
        size.height * 0.72,                  // Second control point for the next curve
        (loc + s - s * 0.20) * size.width,   // Ending point of the next curve
        size.height * 0.05,                  // Ending control point of the next curve
        (loc + s + 0.02) * size.width,       // Starting point of the next curve
        0,                                   // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                // Draws a line from the last point to the top-right corner
      ..lineTo(size.width, size.height)      // Draws a line from the previous point to the bottom-right corner
      ..lineTo(0, size.height)               // Draws a line from the previous point to the bottom-left corner
      ..close();                             // Closes the path
    canvas.drawPath(path, paint);            // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Dynamic Bottom Curve Stroke ===========================//
class NavForeGroundUnderStrokeBorderPainter extends CustomPainter {
  late double loc; // Represents the starting location of the curve
  late double s; // Represents the size of the curve
  late double strokeBorderWidth; // Width of the stroke border
  late bool useShaderStroke; // Indicates whether to use a shader for the stroke
  Color color; // Color used if not using the shader
  Shader? strokeGradientShader; // Shader for the stroke gradient
  TextDirection textDirection; // Direction of the text

  NavForeGroundUnderStrokeBorderPainter(
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
    s = 0.18;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeBorderWidth // Sets the width of the stroke border
      ..style = PaintingStyle.stroke; // Sets the painting style to stroke

    if (!useShaderStroke) {
      paint.color = color; // Set the desired color for the stroke
    } else {
      paint.shader = strokeGradientShader ?? defaultGradientShader; // Set the desired shader for the stroke
    }

    final path = Path()
      ..moveTo(-size.height, 0)              // Moves to the top-left corner of the path
      ..lineTo((loc - 0.02) * size.width, 0) // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * 0.20) * size.width,       // First control point for the curve
        size.height * 0.05,                  // Second control point for the curve
        loc * size.width-8,                  // Ending point of the curve
        size.height * 0.72,                  // Ending control point of the curve
        (loc + s * 0.50) * size.width,       // Starting control point of the next curve
        size.height * 0.72,                  // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width+8,            // First control point for the next curve
        size.height * 0.72,                  // Second control point for the next curve
        (loc + s - s * 0.20) * size.width,   // Ending point of the next curve
        size.height * 0.05,                  // Ending control point of the next curve
        (loc + s + 0.02) * size.width,       // Starting point of the next curve
        0,                                   // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                // Draws a line from the last point to the top-right corner
      ..moveTo(0, size.width)                // Moves to the bottom-left corner of the path
      ..close();                             // Closes the path

    canvas.drawPath(path, paint);            // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Static Under Curve ===========================//
class NavForeGroundCurvePainterUnderStatic extends CustomPainter {
  late double loc; // Represents the starting location of the curve
  late double s; // Represents the size of the curve
  late bool useForeGroundGradient; // Indicates whether to use a gradient for the foreground
  late Shader? foreGroundGradientShader; // Shader for the foreground gradient
  Color color; // Color used if not using the gradient
  TextDirection textDirection; // Direction of the text

  NavForeGroundCurvePainterUnderStatic(
    double startingLoc, 
    int itemsLength, 
    this.useForeGroundGradient,
    this.foreGroundGradientShader,
    this.color, 
    this.textDirection
  ) 
  {
    s = 0.18;
    final span = 1.0 / itemsLength;
    loc = span * (itemsLength ~/ 2) + (span - s) / 2;
    if (textDirection == TextDirection.rtl) {
      loc = 1.0 - (loc + s);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color // Sets the desired color
      ..style = PaintingStyle.fill; // Sets the painting style to fill

    if (!useForeGroundGradient) {
      paint.color = color; // Set the desired color for the foreground
    } else {
      paint.shader = foreGroundGradientShader ?? defaultGradientShader; // Set the desired shader for the foreground
    }
    final path = Path()
      ..moveTo(0, 0)                         // Moves to the top-left corner
      ..lineTo((loc - 0.02) * size.width, 0) // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * 0.20) * size.width,       // First control point for the curve
        size.height * 0.05,                  // Second control point for the curve
        loc * size.width-8,                  // Ending point of the curve // to make wider
        size.height * 0.72,                  // Ending control point of the curve
        (loc + s * 0.50) * size.width,       // Starting control point of the next curve
        size.height * 0.72,                  // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width +8,           // First control point for the next curve // to make wider
        size.height * 0.72,                  // Second control point for the next curve
        (loc + s - s * 0.20) * size.width,   // Ending point of the next curve
        size.height * 0.05,                  // Ending control point of the next curve
        (loc + s + 0.02) * size.width,       // Starting point of the next curve
        0,                                   // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                // Draws a line from the last point to the top-right corner
      ..lineTo(size.width, size.height)      // Draws a line from the previous point to the bottom-right corner
      ..lineTo(0, size.height)               // Draws a line from the previous point to the bottom-left corner
      ..close();                             // Closes the path
    canvas.drawPath(path, paint);            // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

//=========================== Static Under Curve Stroke ===========================//
class NavForeGroundUnderStrokeBorderPainterStatic extends CustomPainter {
  late double loc; // Represents the starting location of the curve
  late double s; // Represents the size of the curve
  late double strokeBorderWidth; // Width of the stroke border
  late bool useShaderStroke; // Indicates whether to use a shader for the stroke
  Color color; // Color used if not using the shader
  Shader? strokeGradientShader; // Shader for the stroke gradient
  TextDirection textDirection; // Direction of the text

  NavForeGroundUnderStrokeBorderPainterStatic(
    double startingLoc, 
    int itemsLength, 
    this.color, 
    this.textDirection,
    this.strokeBorderWidth,
    this.strokeGradientShader,
    this.useShaderStroke,
  ) 
  {
    s = 0.18;
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
      ..style = PaintingStyle.stroke; // Sets the painting style to stroke
    if (!useShaderStroke) {
      paint.color = color; // Set the desired color for the stroke
    } else {
      paint.shader = strokeGradientShader ?? defaultGradientShader; // Set the desired shader for the stroke
    }
    final path = Path()
      ..moveTo(-size.height, 0)              // Moves to the top-left corner of the path
      ..lineTo((loc - 0.02) * size.width, 0) // Draws a line from the previous point to the left side of the curve
      ..cubicTo(
        (loc + s * 0.20) * size.width,       // First control point for the curve
        size.height * 0.05,                  // Second control point for the curve
        loc * size.width -8,                 // Ending point of the curve
        size.height * 0.72,                  // Ending control point of the curve
        (loc + s * 0.50) * size.width,       // Starting control point of the next curve
        size.height * 0.72,                  // Ending control point of the next curve
      )
      ..cubicTo(
        (loc + s) * size.width +8,           // First control point for the next curve
        size.height * 0.72,                  // Second control point for the next curve
        (loc + s - s * 0.20) * size.width,   // Ending point of the next curve
        size.height * 0.05,                  // Ending control point of the next curve
        (loc + s + 0.02) * size.width,       // Starting point of the next curve
        0,                                   // Draws a line from the previous point to the right side of the curve
      )
      ..lineTo(size.width, 0)                // Draws a line from the last point to the top-right corner
      ..moveTo(0, size.width)                // Moves to the bottom-left corner of the path
      ..close();                             // Closes the path
    canvas.drawPath(path, paint);            // Draws the path on the canvas
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}