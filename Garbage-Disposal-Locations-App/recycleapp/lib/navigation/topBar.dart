import 'package:flutter/material.dart';
import 'dart:ui';

class TopBar extends StatelessWidget {
  final double one;
  final double two;
  final double three;
  final Color col;
  const TopBar(this.one, this.two, this.three, this.col);
 
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45)
        ),
        border: Border.all(color: Colors.white.withOpacity(three)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white.withOpacity(one), Colors.white.withOpacity(two)]
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Icon(
              Icons.eco,
              size: 35,
              color: col
            ),
          ),
          Expanded(
            flex: 6,
            child: SizedBox()
          ),
          Expanded(
            flex: 2,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              foregroundColor: Colors.white,
              child: Text('M'),
            )
          ),
          
        ]
      )
     );
  }
}