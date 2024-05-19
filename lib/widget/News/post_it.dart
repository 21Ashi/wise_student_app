import 'package:flutter/material.dart';
import 'package:wise_student_app/nav_bar.dart';
import 'package:wise_student_app/generated/l10n.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _WhoCanViewState();
}

class _WhoCanViewState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const NavBar();
          }));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 54, 106, 170),
            ),
            fixedSize: MaterialStateProperty.all(const Size(168, 50)),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  side: BorderSide(color: Colors.black26)),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.post_add,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                S.of(context).PostIT,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 21,
              ),
            )
          ],
        ),
      ),
    );
  }
}
