import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

TextEditingController mycontroller = new TextEditingController();
String serverUrl = 'iedQRscanner.com';
class _SettingsState extends State<Settings> {

  @override
  void initState(){
    super.initState();
    loadServerUrl();

  }

  void loadServerUrl() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      serverUrl = (prefs.getString('serverUrl') ?? '');
      mycontroller = TextEditingController(text:serverUrl);
    });
  }

  void setServerUrl() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('serverUrl', mycontroller.text);
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: Text("App Setting"),
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
                  labelText: "Enter the server URL",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  prefixIcon: Icon(
                    Icons.link,
                  ),
                ),
               // onEditingComplete: navigate,
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
                  "Save",
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

  void navigate() async {
    setServerUrl();
    Navigator.pop(context);
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
      title: const Text('Setting'),
      content: const Text('Saving setting successful!'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
    );
  }
}
