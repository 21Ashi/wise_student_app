import 'package:flutter/material.dart';
import 'package:wise_student_app/nav_bar.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class AddedNewsDetails extends StatefulWidget {
  const AddedNewsDetails({super.key});

  @override
  State<AddedNewsDetails> createState() => _NewsState();
}

class _NewsState extends State<AddedNewsDetails> {
  // ignore: unused_field
  final int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/topDetails.png'),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20),
            child: InkWell(
                onTap: () {
                  Get.to(() => const NavBar());
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30,
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 670,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border.all(color: Colors.black38)),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 38, top: 15),
                    child: Text(
                      'The Omani Embassy meets its students at the Wise University',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Image.asset('assets/New1Page.png'),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 150, left: 240),
                          child: Row(
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.white,
                                    ),
                                    shape: MaterialStateProperty.all(
                                      const CircleBorder(),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Icon(
                                    Icons.bookmark,
                                    size: 20,
                                    color: Color(0xff000000),
                                  )),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.white,
                                    ),
                                    shape: MaterialStateProperty.all(
                                      const CircleBorder(),
                                    ),
                                  ),
                                  onPressed: () {
                                    _shareContent(
                                        'Copy link or share it from below');
                                  },
                                  child: const Icon(
                                    Icons.share,
                                    size: 20,
                                    color: Color(0xff000000),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Row(
                      children: [
                        Image.asset('assets/user.png'),
                        const Column(
                          children: [
                            Text(
                              ' Wise Admin',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                'Author',
                                style: TextStyle(color: Colors.black54),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Text(
                        'In a meeting filled with love and friendliness, His Excellency Professor Dr. Jaafar Mahmoud Al-Fanatsa, President of the University, met with His Excellency First Secretary Salem bin Sulaiman Al-Wahaibi, Charge d’Affairs of the Cultural Department at the Embassy of the Sultanate of Oman.\n On the sidelines of the visit, which was attended by the head of the academic department at the embassy, Dr. Abdullah Obaidat, and a number of faculty and administrative staff members at the university, they met with our students at the university from the sisterly Sultanate of Oman and listened to their observations.\nAt the conclusion of the visit, the two parties exchanged shields of appreciation.'),
                  )
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(left: 285, bottom: 20, right: 0),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time_filled,
                    color: Color(0xff4E84C1),
                    size: 12,
                  ),
                  Text(
                    ' 20.NOV.2023',
                    style: TextStyle(color: Color(0xff4E84C1), fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _shareContent(String message) async {
    try {
      await Share.share(message);
    } catch (e) {
      // Handle sharing error, e.g., show an error message to the user
    }
  }
}
