import 'package:flutter/material.dart';
import 'QR Generator/QRGenerator.dart';
import 'QR Scanner/ScanQR.dart';
import 'Settings.dart';


class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: Text("IED QR Scanner"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings_sharp),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Settings()));
            },
          )
        ]
      ),
      body: Container(
        child: Container(
          height: (MediaQuery.of(context).size.height),
         
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: (MediaQuery.of(context).size.height) -
                      AppBar().preferredSize.height -
                      kToolbarHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/IED.jpg",
                    ),
                    foregroundColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    radius: 150,
                  ),
                  SizedBox(height: 120),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Hero(
                        tag: "Scan IED QR",
                        child: Container(
                          width: ((MediaQuery.of(context).size.width) - 90),
                          height: 70,
                          child: OutlineButton(

                            focusColor: Colors.red,
                            highlightColor: Colors.blue,
                            hoverColor: Colors.lightBlue[100],
                            splashColor: Colors.blue,
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.blue,
                            ),
                            shape: StadiumBorder(),
                            child: Text(
                              "Scan IED QR",
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScanQR()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: ((MediaQuery.of(context).size.width) - 90),
                        height: 70,
                        child: OutlineButton(
                          focusColor: Colors.red,
                          highlightColor: Colors.blue,
                          hoverColor: Colors.lightBlue[100],
                          splashColor: Colors.blue,
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.blue,
                          ),
                          shape: StadiumBorder(),
                          child: Text(
                            "Generate IED QR",
                            style: TextStyle(fontSize: 20),
                          ),

                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QRGenerator()));
                            //builder: (context) => QRGenerator()));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
