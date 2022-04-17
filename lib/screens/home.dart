// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = "";
  bool submit = false;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _heightController.addListener(() {
      setState(() {
        submit = _heightController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Llogaritësi i BMI",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.amber,
          elevation: 5.0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: _heightController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Gjatësia',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                            onPressed: _heightController.clear,
                            icon: Icon(
                              Icons.clear,
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 179, 179, 179),
                                width: 3.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: _weightController,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Pesha',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                            onPressed: _weightController.clear,
                            icon: Icon(
                              Icons.clear,
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 238, 238, 238),
                                width: 3.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double _h = double.tryParse(_heightController.text);
                  double _w = double.tryParse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if (_bmiResult > 25) {
                      _textResult = "Ju jeni mbi peshë";
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResult = "Ju keni peshë normale";
                    } else {
                      _textResult = "Ju jeni nën peshë";
                    }
                  });
                },
                // ignore: avoid_unnecessary_containers
                child: Container(
                  width: 250,
                  // ignore: missing_required_param
                  child: TextButton(
                    child: Text(
                      "Llogarit",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.transparent)))),

                    //
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Text(
                  "Indeksi i masës trupore tuaj është\n\n" +
                      _bmiResult.toStringAsFixed(2) +
                      " kg/m2",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.amber, // red as border color
                        width: 5,
                      ),
                    ),
                    child: Text(
                      _textResult,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
