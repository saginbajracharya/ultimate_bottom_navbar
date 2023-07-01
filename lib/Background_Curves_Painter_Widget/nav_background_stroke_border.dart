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

class NavBackgroundStrokeBorderPainter extends CustomPainter {
  late double loc; // Represents the starting location of the curve
  late double s; // Represents the size of the curve
  late double strokeBorderWidth; // Width of the stroke border
  late bool useShaderStroke; // Indicates whether to use a shader for the stroke
  late bool showBackGroundStrokeAllSide;
  Shader? foregroundStrokeGradientShader; // Shader for the stroke gradient
  Color color; // Color used if not using the shader
  TextDirection textDirection; // Direction of the text
  BorderRadiusGeometry? borderRadius;

  NavBackgroundStrokeBorderPainter(
    double startingLoc,
    int itemsLength,
    this.strokeBorderWidth,
    this.useShaderStroke,
    this.showBackGroundStrokeAllSide,
    this.color,
    this.foregroundStrokeGradientShader,
    this.textDirection,
    this.borderRadius,
  ) {
    final span = 1.0 / itemsLength;
    s = 0.18;
    double l = startingLoc + (span - s) / 2;
    if (textDirection == TextDirection.rtl) {
      loc = 0.82 - l;
    } else if (textDirection == TextDirection.ltr) {
      loc = l;
    } else {
      loc = l; // Default to LTR if the text direction is not specified
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeBorderWidth
      ..style = PaintingStyle.stroke;

    if (!useShaderStroke) {
      paint.color = color;
    } else {
      paint.shader = foregroundStrokeGradientShader ?? defaultGradientShader;
    }

    final bGborderRadius = borderRadius??BorderRadius.circular(0); // Provide the desired radius value here

    final path = Path();
    if(borderRadius==null){
      path
        ..moveTo(0, 0) // Moves to the top-left corner of the path
        ..lineTo((loc - 0.0) * size.width, 0) // Draws a line from the previous point to the left side of the shape
        ..lineTo((loc + s) * size.width, 0) // Draws a line to the right side of the shape
        ..lineTo(size.width, 0); // Draws a line to the top-right corner
      if (showBackGroundStrokeAllSide) {
        path
          ..lineTo(size.width, size.height) // Draws a line from the previous point to the bottom-right corner
          ..lineTo(0, size.height) // Draws a line from the previous point to the bottom-left corner
          ..close(); // Closes the path
      } else {
        path
          ..moveTo(0, size.height) // Moves to the bottom-left corner of the path
          ..close(); // Closes the path
      }
      canvas.drawPath(path,paint);
    }
    else{
      final roundedPath = Path()
        ..addRRect(bGborderRadius.resolve(TextDirection.ltr).toRRect(Rect.fromLTWH(0, 0, size.width, size.height)))
        ..addPath(path, Offset.zero);
      canvas.drawPath(roundedPath, paint); // Draws the path on the canvas
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}



