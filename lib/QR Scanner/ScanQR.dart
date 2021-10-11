import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'IEDDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScanQR extends StatefulWidget {
  ScanQR({Key key}) : super(key: key);

  @override
  _ScanQRState createState() => _ScanQRState();
}

String qrData = "No data found!";
String serverUrl = '';
var data;

class _ScanQRState extends State<ScanQR> {

  @override
  void initState(){
    super.initState();
    loadServerUrl();
  }

  void loadServerUrl() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      serverUrl = (prefs.getString('serverUrl') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Scan IED",
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[300],
          title: Text("IED QR Scanner"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "IED Id:  ${(qrData)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.launch_outlined),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IEDDetail(serverUrl + qrData)));
                    }
                  ),
                ],
              ),
              SizedBox(height: 15),
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
                    "Scan IED QR",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    var options = ScanOptions(
                      autoEnableFlash: false,
                    );
                    var data = await BarcodeScanner.scan(options: options);
                    setState(() {
                      qrData = data.rawContent.toString();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
