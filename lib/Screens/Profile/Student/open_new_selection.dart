import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/StudentWidgets/drop_list_selectdays.dart';
import 'package:wise_student_app/widget/StudentWidgets/drop_list_selectperiod.dart';

class Opennewsection extends StatefulWidget {
  const Opennewsection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OpennewsectionState createState() => _OpennewsectionState();
}

class _OpennewsectionState extends State<Opennewsection> {
  final TextEditingController _entercourseid = TextEditingController();
  bool _isPressed = false;
  bool _accepted = false;
  Timer? _timer;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _timer?.cancel(); // Dispose timer when widget is disposed
    super.dispose();
  }

  String? _validateCourseId(String? value) {
    if (value == null || value.isEmpty) {
      return 'Course ID is required';
    } else if (value.length != 10) {
      return 'Course ID must be exactly 10 digits';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 80, // Increased height to accommodate error message
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: TextFormField(
                        cursorHeight: 16,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10)
                        ],
                        controller: _entercourseid,
                        decoration: InputDecoration(
                          hintText: S.of(context).entercourseid,
                          hintStyle: const TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: _validateCourseId,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: DroplistSelectDays(
              onChanged: (selected) {},
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: DroplistSelectPeriod(
              onChanged: (selected) {},
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  S.of(context).requestStatus,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 40,
                width: MediaQuery.of(context).size.width - 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  color: _accepted
                      ? Colors.green
                      : (_isPressed ? const Color(0xff81beef) : Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    _isPressed
                        ? S.current.inProgress
                        : (_accepted
                            ? S.current.accepted
                            : S.current.noprogress),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  if (_isPressed) {
                    // If it's already pressed, cancel it
                    _timer?.cancel();
                    _isPressed = false;
                  } else {
                    // If it's not pressed, start the process
                    _isPressed = true;
                    _timer = Timer(const Duration(seconds: 10), () {
                      setState(() {
                        _accepted = true;
                        _isPressed = false; // Reset _isPressed after 10 seconds
                      });
                    });
                  }
                });
              }
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0x20000000)),
                borderRadius: BorderRadius.circular(20),
                color: _isPressed ? Colors.white : const Color(0xff4b62a9),
              ),
              child: Center(
                child: Text(
                  _isPressed
                      ? S.of(context).Cancel
                      : S.of(context).confirmation,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _isPressed ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
