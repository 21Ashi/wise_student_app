import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/news.png'),
              Text(
                S.of(context).News,
                style: GoogleFonts.hammersmithOne(
                  fontSize: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 210),
                child: Column(
                  children: [
                    Text(S.of(context).UnderNews1,
                        style: GoogleFonts.karma(
                            fontSize: 12, color: Colors.grey[700])),
                    Text(
                      S.of(context).UnderNews2,
                      style: GoogleFonts.karma(
                          fontSize: 12, color: Colors.grey[700]),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
