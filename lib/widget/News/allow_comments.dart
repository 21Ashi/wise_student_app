import 'package:flutter/material.dart';

class AllowComments extends StatefulWidget {
   const AllowComments({super.key});

  @override
  State<AllowComments> createState() => _AllowCommentsState();
}

class _AllowCommentsState extends State<AllowComments> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return  Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, top: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.comment,color: Colors.black,),
                        const Text(
                          ' Allow Comments',
                          style: TextStyle(fontSize: 16,color: Colors.black),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12, left: 90),
                          child: Switch(
                              inactiveTrackColor: const Color.fromARGB(255, 255, 255, 255),
                              inactiveThumbColor: const Color(0xff163760),
                              activeColor: const Color(0xff163760),
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              }
                              ),
                        )
                      ],
                    ),
                  ),
                ),
              );
  }
}