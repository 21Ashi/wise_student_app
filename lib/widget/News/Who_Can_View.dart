import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class WhoCanView extends StatefulWidget {
  const WhoCanView({Key? key}) : super(key: key);

  @override
  State<WhoCanView> createState() => _WhoCanViewState();
}

class _WhoCanViewState extends State<WhoCanView> {
  int _value = 1;
  String _selectedText = 'Everyone';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).WhoCanSeeThis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Text(_selectedText,
                style: const TextStyle(
                    color: Color.fromARGB(255, 54, 106, 170),
                    fontWeight: FontWeight.bold,
                    fontSize: 12))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 54, 106, 170)),
                fixedSize: MaterialStateProperty.all(const Size(360, 50)),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    side: BorderSide(color: Colors.black26),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.public,
                    color: Colors.white,
                  ),
                  Text(
                    S.of(context).NewPostButton1,
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 11,
                  ),
                ],
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return _PrivacySettingsSheet(
                      initialValue: _value,
                      onValueChange: (value, text) {
                        setState(() {
                          _value = value;
                          _selectedText = text;
                        });
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _PrivacySettingsSheet extends StatefulWidget {
  final int initialValue;
  final Function(int, String) onValueChange;

  const _PrivacySettingsSheet({
    Key? key,
    required this.initialValue,
    required this.onValueChange,
  }) : super(key: key);

  @override
  State<_PrivacySettingsSheet> createState() => _PrivacySettingsSheetState();
}

class _PrivacySettingsSheetState extends State<_PrivacySettingsSheet> {
  late int _value;
  late String _selectedText;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
    _selectedText = _getSelectedText(_value);
  }

  String _getSelectedText(int value) {
    switch (value) {
      case 1:
        return 'Everyone';
      case 2:
        return 'Friends';
      case 3:
        return 'Only Me';
      default:
        return 'Everyone';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).PrivacySettings,
                style: TextStyle(
                    fontSize: 16, color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          Text(
            S.of(context).UnderPrivSettings,
            style: GoogleFonts.karma(
                fontSize: 10, color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Everyone',
                    style: TextStyle(fontSize: 12),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: Radio(
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                          _selectedText = _getSelectedText(_value);
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Friends',
                    style: TextStyle(fontSize: 12),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 211),
                    child: Radio(
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                          _selectedText = _getSelectedText(_value);
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Only Me', style: TextStyle(fontSize: 12)),
                  Padding(
                    padding: const EdgeInsets.only(left: 206),
                    child: Radio(
                      value: 3,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                          _selectedText = _getSelectedText(_value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 54, 106, 170))),
            onPressed: () {
              widget.onValueChange(_value, _selectedText);
              Navigator.pop(context);
            },
            child: Text(S.of(context).save,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.background)),
          ),
        ],
      ),
    );
  }
}
