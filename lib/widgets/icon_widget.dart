import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;

  const IconWidget({this.icon, this.color});

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Icon(icon, color: Colors.white));
}
