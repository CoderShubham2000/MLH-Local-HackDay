import 'package:flutter/material.dart';
import 'all.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainUI extends StatefulWidget {
  _MainUIState createState() => _MainUIState();
}

class TestFunction extends StatelessWidget {
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('RecycleData');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        List<DocumentSnapshot> d = snapshot.data.docs;
        return CarouselSlider.builder(
          itemCount: d.length,
          itemBuilder: (context, int index) {
            return Card(d[index]);
          },
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            aspectRatio: 0.7,
            initialPage: 0,
          ),
        );
      },
    );
  }
}


class Card extends StatelessWidget {
  final DocumentSnapshot values;
  Card(this.values);


  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> doc = values.data();
    final String n = (doc['Category']).toLowerCase();
    final String name = "assets/images/" + doc['Category'] + ".png";
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 3,
              child: Text(
                "${doc['Category']}",
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              ),
            ),
            Expanded(
                flex: 9,
                child: Image(image: AssetImage(name))
            ),
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${doc['Count']}",
                    style: TextStyle(
                      fontSize: 50,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Recycled\n$n",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff919191),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.1),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class _MainUIState extends State<MainUI> {
  int index = 0;
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 1,
              child: Text(
                "Hello Team",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Arial"),
              ),
            ),
            Expanded(flex: 8, child: TestFunction()),
          ],
        ));
  }
}

class CardList {}

class StatsPage extends StatefulWidget {
  _CreateStatsPageState createState() => _CreateStatsPageState();
}

class _CreateStatsPageState extends State<StatsPage> {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
                child: Column(children: [
                  Expanded(
                      flex: 9,
                      child: Stack(
                        children: [
                          Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(40),
                                      bottomLeft: Radius.circular(40)),
                                  color: Color(0xffacd8e3)),
                              child: MainUI()),
                          TopBar(0, 0, 0, Color(0xff58a31f))
                        ],
                      )),
                  Expanded(flex: 1, child: BottomNav(0))
                ]))));
  }
}
