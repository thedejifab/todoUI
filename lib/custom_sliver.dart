import 'package:flutter/material.dart';

class CustomSliverBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      bottom: TabBar(
        labelColor: Colors.black87,
        unselectedLabelColor: Colors.grey,
        tabs: [
          new Container(
            height: 100.0,
            alignment: Alignment.bottomLeft,
            child: new Tab(
              child: new Text(
                "Nov 6, 2018",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          new Container(
            child: new Tab(
              child: new Container(
                child: new Container(
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
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
      // leading: new Icon(Icons.),
      leading: new Icon(Icons.menu),
      actions: <Widget>[],
    );
  }
}

class CustomSliverPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SliverPadding(
      padding: new EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      sliver: new SliverList(
        delegate: new SliverChildListDelegate([
          new Text(
            "INBOX",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
