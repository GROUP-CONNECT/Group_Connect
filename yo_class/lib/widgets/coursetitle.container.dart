import 'package:coursehub/utils/index.dart';
import 'package:flutter/material.dart';

class CourseTitleContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;

        final size = width * 0.25;
        const double factor = 0.075;

        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              color: lightGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Stack(
              children: [
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
                  top: height * 0.25,
                  child: Container(
                    height: size,
                    width: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: blueGreyish,
                    ),
                  ),
                ),
                Positioned(
                  left: width * factor - 3,
                  //top: height * 0.32,
                  bottom: -height * 0.1,
                  child: Container(
                    height: size,
                    width: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: blueGreyish,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
