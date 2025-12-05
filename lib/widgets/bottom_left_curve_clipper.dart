import 'package:flutter/material.dart';

/// Clipper that creates a smooth curve at the bottom-left
class BottomLeftCurveClipper extends CustomClipper<Path> {
  const BottomLeftCurveClipper();

  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double radius = 80.0; // Rounded corner radius

    // Start at top-left
    path.moveTo(0, 0);

    // Top edge - straight across
    path.lineTo(size.width, 0);

    // Right edge - straight down
    path.lineTo(size.width, size.height);

    // Bottom edge - straight across until near the left corner
    path.lineTo(radius, size.height);

    // Rounded bottom-left corner
    path.quadraticBezierTo(
      0,
      size.height, // Control point at the corner
      0,
      size.height - radius, // End point on left edge
    );

    // Left edge up to top
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
