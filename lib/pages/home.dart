import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();

  static List<String> menuItems = <String>[
    'One',
    'Two',
    'Three',
    'Four',
  ];

  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  String _btn1SelectedVal = 'One';

  bool _switchVal = true;

  bool _checkBoxVal = true;

  int _radioVal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Icon(
              Icons.add,
              size: 60,
              color: Colors.black,
            ),
            Text(
              'Simple text demo.',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 32.0,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Nama Anda"),
              onChanged: (value) {
                setState(() {});
              },
              controller: controller,
            ),
            Text(controller.text),
            Image.asset("assets/coffe.jpg"),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {},
              child: Text(
                "Apply this buttom",
                style: TextStyle(fontSize: 15),
              ),
            ),
            DropdownButton<String>(
              // Must be one of items.value.
              value: _btn1SelectedVal,
              items: this._dropDownMenuItems,
              onChanged: (String newValue) {
                setState(() {
                  _btn1SelectedVal = newValue;
                });
              },
            ),
            Center(
              child: Switch(
                value: this._switchVal,
                onChanged: (bool value) {
                  setState(() => this._switchVal = value);
                },
              ),
            ),
            Center(child: CircularProgressIndicator()),
            Row(
              children: [0, 1, 2, 3]
                  .map((int index) => Radio<int>(
                        value: index,
                        groupValue: this._radioVal,
                        onChanged: (int value) {
                          setState(() => this._radioVal = value);
                        },
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
