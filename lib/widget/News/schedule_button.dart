import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _WhoCanViewState();
}

class _WhoCanViewState extends State<Schedule> {
  DateTime dateTime = DateTime(3000, 2, 1, 10, 20);

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
            fixedSize: MaterialStateProperty.all(const Size(230, 50)),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  side: BorderSide(color: Colors.black26)),
            )),
        child: const Row(
          children: [
            Icon(
              Icons.schedule,
              color: Colors.white,
            ),
            Text(
              '  Schedule for later',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 21,
              ),
            )
          ],
        ),
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return Container(
                  height: 300,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('done')),
                      Expanded(
                          child: CupertinoDatePicker(
                            initialDateTime: dateTime,
                        onDateTimeChanged: (DateTime newTime) {
                          setState(() => dateTime = newTime);
                        },
                      ))
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
