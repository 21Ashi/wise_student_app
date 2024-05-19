// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 54),
                child: Image.asset('assets/testbank.png'),
              ),
              Text(
                S.of(context).TestBank,
                style: GoogleFonts.hammersmithOne(
                    fontSize: 32, color: Theme.of(context).colorScheme.primary),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 210),
                child: Column(
                  children: [
                    Text(S.of(context).UnderTestBank1,
                        style: GoogleFonts.karma(
                            fontSize: 12, color: Colors.grey[700])),
                    Text(
                      S.of(context).UnderTestBank2,
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
