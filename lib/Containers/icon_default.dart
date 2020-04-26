import 'package:flutter/material.dart';

class IconDefault extends StatelessWidget {
  final IconData icon;
  final String gender;

  IconDefault({this.icon, this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Icon(
            icon,
            size: 80,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Text(
            gender,
            style: TextStyle(
              color: Color(0xff8D8E98),
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
