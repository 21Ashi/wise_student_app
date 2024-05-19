import 'package:flutter/material.dart';

class NewPostButtons extends StatelessWidget {
  const NewPostButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 230,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Icon(
                                  Icons.schedule,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ' Schedule for later',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xff163760),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.post_add,
                                color: Colors.white,
                              ),
                              Center(
                                  child: Text(
                                ' Post',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}