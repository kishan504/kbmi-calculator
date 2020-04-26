import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final cardChild;
  final Function ontap;

  ReusableCard({@required this.color, this.cardChild, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}
