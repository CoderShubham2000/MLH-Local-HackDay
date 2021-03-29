import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'all.dart';

class BottomNav extends StatefulWidget {
  final control;
  BottomNav(this.control);
  _BottomNavState createState() => _BottomNavState(control);
}

class SubText extends StatelessWidget {
  final int current;
  final int actual;
  final String text;
  SubText(this.current, this.actual, this.text);
  Widget build(BuildContext context) {
    if (this.current == this.actual) {
      return Align(
          alignment: Alignment.center,
          child: Text(
            this.text,
          ));
    } else {
      return Container();
    }
  }
}

class _BottomNavState extends State<BottomNav> {
  final int control;
  _BottomNavState(this.control);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.bar_chart_outlined,
                      size: 30,
                      color: control == 0 ? Colors.green : Colors.black),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: StatsPage(),
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 600)));
                  }),
              SubText(control, 0, "History")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.location_on_outlined,
                      size: 30,
                      color: control == 1 ? Colors.green : Colors.black),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: HomePage(),
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 600)));
                  }),
              SubText(control, 1, "Map")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.account_circle_outlined,
                      size: 30,
                      color: control == 2 ? Colors.green : Colors.black),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: Authenticate(),
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 600)));
                  }),
              SubText(control, 2, "Account")
            ],
          ),
        ]));
  }
}
