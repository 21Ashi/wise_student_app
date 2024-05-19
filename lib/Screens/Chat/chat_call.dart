import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatCall extends StatefulWidget {
  const ChatCall({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ChatCallState createState() => _ChatCallState();
}

class _ChatCallState extends State<ChatCall> {
  bool isMicMuted = false;
  bool isCallEnded = false;
  bool isSpeakerOn = true;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  isDarkMode ? 'assets/CallDT.png' : 'assets/callbg.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Image.asset('assets/user1call.png'),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                S.of(context).Calling,
                style: GoogleFonts.karma(
                  decoration: TextDecoration.none,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).Sender,
                style: GoogleFonts.karma(
                  decoration: TextDecoration.none,
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMicMuted = !isMicMuted;
                      });
                    },
                    child: Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: isMicMuted
                          ? const Icon(Icons.mic_off)
                          : const Icon(Icons.mic),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.red,
                      ),
                      child: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSpeakerOn = !isSpeakerOn;
                      });
                    },
                    child: Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: isSpeakerOn
                          ? const Icon(Icons.volume_up)
                          : const Icon(Icons.volume_off),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
