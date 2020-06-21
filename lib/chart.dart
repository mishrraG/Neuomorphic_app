import 'dart:math';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {

  final List<double> data;

  const Chart({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipPath(
        clipper: ChartClipper(
          data: data,
          maxValue: data.reduce(max),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF89F7FE),
                Color(0xFF66A6FF),
                Color(0xFF13547A),
                Color(0xFF80D0C7),
                Color(0xFFFF57AC),
                Color(0xFFFF6D91),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChartClipper extends CustomClipper<Path> {

  final double maxValue;
  final List<double> data;

  ChartClipper({this.maxValue, this.data});

  @override
  Path getClip(Size size) {
    double sectionWidth = size.width / (data.length - 1);

    Path path  = Path();

    path.moveTo(0, size.height);

    for (int i = 0; i < data.length; i++) {
      path.lineTo(i * sectionWidth, size.height - size.height * (data[i]/maxValue));
    }

    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}
