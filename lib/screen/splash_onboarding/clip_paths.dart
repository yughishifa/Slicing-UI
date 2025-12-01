import 'package:flutter/material.dart';

class OnboardingClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    
    path.lineTo(0, size.height);
    
    path.lineTo(size.width, size.height);
    
    path.lineTo(size.width, 0); 
    
    const double curveDepth = 100.0; // y=0

    path.quadraticBezierTo(
      size.width * 0.5, 
      curveDepth,       
      0,                
      0,                
    );

    path.close(); 
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}