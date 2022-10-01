import 'package:flutter/material.dart';

void main() {
  runApp(const Personal());
}

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 12,
    );
  }
}
