import 'package:flutter/material.dart';
import 'package:wise_student_app/firebase/fire_database.dart';
import 'package:wise_student_app/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class ChatBar extends StatefulWidget {
  final String roomId;
  final Std student;
  final Widget? suffix;

  const ChatBar(
      {super.key, required this.roomId, required this.student, this.suffix});

  @override
  State<ChatBar> createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> alpha;
  final focusNode = FocusNode();
  final TextEditingController msgCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 50,
                  width: 330,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFBA834),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 25,
                          ),
                          onPressed: () {
                            _pickImage(context);
                          },
                        ),
                      ),
                      Expanded(
                          child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: 1,
                        focusNode: focusNode,
                        controller: msgCon,
                        decoration: const InputDecoration(
                          hintText: 'Message...',
                          hintStyle: TextStyle(fontSize: 15),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          border: InputBorder.none,
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: IconButton(
                          icon: Icon(
                            Icons.photo,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {
                            _pickGallery(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (msgCon.text.isNotEmpty) {
                      FireData()
                          .sendMessage(
                              widget.student.id!, msgCon.text, widget.roomId)
                          .then((value) {
                        setState(() {
                          msgCon.text = "";
                        });
                      });
                    }
                  },
                  icon: Icon(
                    Icons.send,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image != null) {
      debugPrint('Image picked: ${image.path}');
    }
  }

  Future<void> _pickGallery(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      debugPrint('Image picked: ${image.path}');
    }
  }

  @override
  void initState() {
    super.initState();
    msgCon.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final lines = msgCon.text.split('\n');
    if (lines.length > 5) {
      msgCon.text = lines.sublist(0, 5).join('\n');
      msgCon.selection = TextSelection.fromPosition(
        TextPosition(offset: msgCon.text.length),
      );
    }
  }

  @override
  void dispose() {
    msgCon.dispose();
    super.dispose();
  }
}
