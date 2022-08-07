import 'dart:math';

import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  // the controller for the text field associated with "height"
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _result = 0.0;
  String bmi = "";

  void Calculate() {
    setState(() {
      int age = int.parse(_ageController.text);
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      if ((_ageController.toString().isNotEmpty && age > 0) ||
          (_weightController.toString().isNotEmpty && weight > 0) ||
          (_heightController.toString().isNotEmpty && height > 0)) {
        _result = (703 * weight) / pow(height * 12, 2);
      }
      if (_result >= 25.0 && _result < 29.9) {
        bmi = "Overweight";
      } else if (_result >= 18.5 && _result < 25.0) {
        bmi = "Healty";
      } else if (_result >= 29.9) {
        bmi = "Obese";
      } else {
        bmi = "Underweight";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI",
          style:
              TextStyle(fontSize: 25.0, color: Color.fromRGBO(51, 83, 176, 1)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(5.0),
          children: <Widget>[
            Image.asset(
              "assets/bmi2.png",
              height: 90.0,
              width: 90.0,
            ),
            Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Age",
                          hintText: "Enter your age",
                          icon: Icon(Icons.person_outline)),
                    ),
                    TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Height",
                          hintText: "In Feet",
                          icon: Icon(Icons.insert_chart)),
                    ),
                    TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Weight",
                          hintText: "In Lbs",
                          icon: Icon(Icons.line_weight)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text(
                          "Calculate",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        color: Color.fromRGBO(51, 83, 176, 1),
                        onPressed: Calculate,
                      ),
                    ),
                  ],
                )),
            Center(
              child: Text(
                "Your BMI is ${_result.toStringAsFixed(1)}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Color.fromRGBO(51, 83, 176, 1)),
              ),
            ),
            Center(
              child: Text(
                "$bmi",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
