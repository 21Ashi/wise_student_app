import 'package:flutter/material.dart';
import 'package:wise_student_app/firebase/fire_database.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor:
                    Colors.black.withOpacity(0.5), // Darkened background
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      border: Border.all(color: Colors.black26),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Enter Friend Email",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: const Icon(
                              Icons.inbox_rounded,
                              color: Colors.black38,
                            ),
                            hintStyle: const TextStyle(color: Colors.black38),
                            fillColor: const Color.fromARGB(255, 214, 210, 210),
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            if (email.text.isNotEmpty) {
                              FireData().createRoom(email.text).then((value) {
                                setState(() {
                                  email.text = "";
                                });
                                Navigator.of(context).pop();
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.zero,
                            elevation: 0,
                            textStyle: const TextStyle(color: Colors.white),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xffF9AD70), Color(0xffFF5717)],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(
                                minWidth: 88,
                                minHeight: 46,
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "Create Chat",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              padding: const EdgeInsets.all(15),
              child: const Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
