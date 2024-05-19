import 'package:flutter/material.dart';

// ignore: camel_case_types
class privsetting extends StatefulWidget {
  const privsetting({super.key});

  @override
  State<privsetting> createState() => _privsettingState();
}

// ignore: camel_case_types
class _privsettingState extends State<privsetting> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 300,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18))),
              child: Column(children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 125, top: 10),
                      child: Text(
                        'Privacy Settings',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 75),
                      child: Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50, right: 120),
                  child: Text(
                    'Who can view this post ',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Everyone',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Radio(
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Friends   ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Radio(
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Only Me  ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Radio(
                        value: 3,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        })
                  ],
                ),
              ])),
        ),
      ],
    );
  }
}
