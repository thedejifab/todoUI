import 'package:flutter/material.dart';

Widget CustomSliverAppBar() {
  return SliverAppBar(
    expandedHeight: 200.0,
    floating: false,
    pinned: false,
    flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: new Container(
            padding: EdgeInsets.only(bottom: 30.0, right: 140.0),
            // alignment: Alignment.center,
            child: new Opacity(
              opacity: 0.95,
              child: new Text("Your \nTodos",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400)),
            )),
        background: new Image.asset(
          'assets/background.jpg',
          fit: BoxFit.cover,
        )),
    leading: new Icon(Icons.menu),
    actions: <Widget>[
      new SingleChildScrollView(
        // padding: EdgeInsets.only(top: 30.0),
        child: new Container(
            alignment: Alignment.bottomCenter,
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Column(
                        children: <Widget>[
                          new Text(
                            "24",
                            style: TextStyle(fontSize: 25.0),
                          ),
                          new Text(
                            "Personal",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          )
                        ],
                      ),
                      new SizedBox(
                        width: 15.0,
                      ),
                      new Column(
                        children: <Widget>[
                          new Text(
                            "15",
                            style: TextStyle(fontSize: 25.0),
                          ),
                          new Text(
                            "Business",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                new Container(
                  child: new Text("65% done"),
                )
              ],
            )),
      )
    ],
  );
}
