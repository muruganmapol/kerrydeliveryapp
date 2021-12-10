import 'package:flutter/material.dart';
import 'package:fml/pages/pickupgcnform.dart';
import 'package:fml/pages/pickupperson.dart';

class Pickupgcnname extends StatefulWidget {
  const Pickupgcnname({Key? key}) : super(key: key);

  @override
  _PickupgcnnameState createState() => _PickupgcnnameState();
}

class _PickupgcnnameState extends State<Pickupgcnname> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 126, 61),
        centerTitle: true,
        title: const Text(
          "Pickup GCN Name",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5),
            Card(
              color: Colors.orange[50],
              child: ListTile(
                leading: Icon(
                  Icons.contacts,
                  color: Colors.blue[900],
                ),
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name : karthi",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ]),
                trailing: new Column(
                  children: <Widget>[
                    new Container(
                      child: new IconButton(
                        icon: new Icon(Icons.arrow_forward_ios),
                        iconSize: 20,
                        color: Colors.lightBlue[900],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pickupgcnform()),
                          );
                        },
                      ),
                      // margin: EdgeInsets.only(top: 5.0),
                    )
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.orange[50],
              child: ListTile(
                leading: Icon(
                  Icons.contacts,
                  color: Colors.blue[900],
                ),
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name : karthi",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ]),
                trailing: new Column(
                  children: <Widget>[
                    new Container(
                      child: new IconButton(
                        icon: new Icon(Icons.arrow_forward_ios),
                        iconSize: 20,
                        color: Colors.lightBlue[900],
                        onPressed: () {},
                      ),
                      // margin: EdgeInsets.only(top: 5.0),
                    )
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.orange[50],
              child: ListTile(
                leading: Icon(
                  Icons.contacts,
                  color: Colors.blue[900],
                ),
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name : karthi",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ]),
                trailing: new Column(
                  children: <Widget>[
                    new Container(
                      child: new IconButton(
                        icon: new Icon(Icons.arrow_forward_ios),
                        iconSize: 20,
                        color: Colors.lightBlue[900],
                        onPressed: () {},
                      ),
                      // margin: EdgeInsets.only(top: 5.0),
                    )
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.orange[50],
              child: ListTile(
                leading: Icon(
                  Icons.contacts,
                  color: Colors.blue[900],
                ),
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name : karthi",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ]),
                trailing: new Column(
                  children: <Widget>[
                    new Container(
                      child: new IconButton(
                        icon: new Icon(Icons.arrow_forward_ios),
                        iconSize: 20,
                        color: Colors.lightBlue[900],
                        onPressed: () {},
                      ),
                      // margin: EdgeInsets.only(top: 5.0),
                    )
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.orange[50],
              child: ListTile(
                leading: Icon(
                  Icons.contacts,
                  color: Colors.blue[900],
                ),
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name : karthi",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ]),
                trailing: new Column(
                  children: <Widget>[
                    new Container(
                      child: new IconButton(
                        icon: new Icon(Icons.arrow_forward_ios),
                        iconSize: 20,
                        color: Colors.lightBlue[900],
                        onPressed: () {},
                      ),
                      // margin: EdgeInsets.only(top: 5.0),
                    )
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.orange[50],
              child: ListTile(
                leading: Icon(
                  Icons.contacts,
                  color: Colors.blue[900],
                ),
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name : karthi",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ]),
                trailing: new Column(
                  children: <Widget>[
                    new Container(
                      child: new IconButton(
                        icon: new Icon(Icons.arrow_forward_ios),
                        iconSize: 20,
                        color: Colors.lightBlue[900],
                        onPressed: () {},
                      ),
                      // margin: EdgeInsets.only(top: 5.0),
                    )
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.orange[50],
              child: ListTile(
                leading: Icon(
                  Icons.contacts,
                  color: Colors.blue[900],
                ),
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name : karthi",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ]),
                trailing: new Column(
                  children: <Widget>[
                    new Container(
                      child: new IconButton(
                        icon: new Icon(Icons.arrow_forward_ios),
                        iconSize: 20,
                        color: Colors.lightBlue[900],
                        onPressed: () {},
                      ),
                      // margin: EdgeInsets.only(top: 5.0),
                    )
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.orange[50],
              child: ListTile(
                leading: Icon(
                  Icons.contacts,
                  color: Colors.blue[900],
                ),
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name : karthi",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ]),
                trailing: new Column(
                  children: <Widget>[
                    new Container(
                      child: new IconButton(
                        icon: new Icon(Icons.arrow_forward_ios),
                        iconSize: 20,
                        color: Colors.lightBlue[900],
                        onPressed: () {},
                      ),
                      // margin: EdgeInsets.only(top: 5.0),
                    )
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.orange[50],
              child: ListTile(
                leading: Icon(
                  Icons.contacts,
                  color: Colors.blue[900],
                ),
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name : karthi",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ]),
                trailing: new Column(
                  children: <Widget>[
                    new Container(
                      child: new IconButton(
                        icon: new Icon(Icons.arrow_forward_ios),
                        iconSize: 20,
                        color: Colors.lightBlue[900],
                        onPressed: () {},
                      ),
                      // margin: EdgeInsets.only(top: 5.0),
                    )
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.orange[50],
              child: ListTile(
                leading: Icon(
                  Icons.contacts,
                  color: Colors.blue[900],
                ),
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name : karthi",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ]),
                trailing: new Column(
                  children: <Widget>[
                    new Container(
                      child: new IconButton(
                        icon: new Icon(Icons.arrow_forward_ios),
                        iconSize: 20,
                        color: Colors.lightBlue[900],
                        onPressed: () {},
                      ),
                      // margin: EdgeInsets.only(top: 5.0),
                    )
                  ],
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
