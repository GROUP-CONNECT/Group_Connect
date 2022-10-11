import 'package:coursehub/utils/index.dart';
import 'package:flutter/material.dart';

class CourseHubBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;

        final size = width * 0.25;
        const double factor = 0.075;

        return Stack(
          children: [
            Container(
              color: lightGrey,
            ),
            Positioned(
              right: -width * factor,
              top: -5,
              child: Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: -width * factor,
              top: height * 0.12,
              child: Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: width * factor,
              top: height * 0.3,
              child: Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: -width * factor,
              top: height * 0.5,
              child: Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: -width * factor,
              top: height * 0.5,
              child: Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
