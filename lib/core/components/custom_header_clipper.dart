// CUSTOM SHAPE CLIPPER
import 'package:flutter/material.dart';

class CustomHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double width = size.width;
    double height = size.height;
    double radius = 30; // Radius untuk semua sudut
    double leftBottomHeight = height - 20; // Kiri bawah lebih tinggi
    double rightBottomHeight = height; // Kanan bawah lebih turun

    path.moveTo(0, radius);

    // Sudut kiri atas
    path.quadraticBezierTo(0, 0, 0, 0);

    // Garis ke kanan atas
    path.lineTo(width - radius, 0);

    // Sudut kanan atas
    path.quadraticBezierTo(width, 0, width, 0);

    // Garis ke kanan bawah (posisi lebih rendah)
    path.lineTo(width, rightBottomHeight - radius);

    // Sudut kanan bawah
    path.quadraticBezierTo(
        width, rightBottomHeight, width - radius, rightBottomHeight);

    // Garis ke kiri bawah (posisi lebih tinggi)
    path.lineTo(radius, leftBottomHeight);

    // Sudut kiri bawah
    path.quadraticBezierTo(0, leftBottomHeight, 0, leftBottomHeight - radius);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true; // Selalu di-reclip jika ada perubahan
  }
}
