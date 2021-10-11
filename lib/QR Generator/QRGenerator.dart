import 'package:flutter/material.dart';

import 'GeneratedQR.dart';

class QRGenerator extends StatefulWidget {
  QRGenerator({Key key}) : super(key: key);

  @override
  _QRGeneratorState createState() => _QRGeneratorState();
}

TextEditingController mycontroller = new TextEditingController();

class _QRGeneratorState extends State<QRGenerator> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: Text("IED QR Generator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: mycontroller,
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                  labelText: "Enter the IED Id for generating a QR",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  prefixIcon: Icon(
                    Icons.link,
                  ),
                ),
                onEditingComplete: navigate,
              ),
            ),
            Container(
              width: ((MediaQuery.of(context).size.width) -90),
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
                  style: TextStyle(fontSize: 17),
                ),
                onPressed: navigate,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigate() {
    print(mycontroller.text);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GeneratedQR(mycontroller.text)));
  }
}
