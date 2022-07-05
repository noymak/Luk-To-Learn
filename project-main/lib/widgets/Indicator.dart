import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.indigoAccent.shade700 : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
