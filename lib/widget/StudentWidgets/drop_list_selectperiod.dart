import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';

class DroplistSelectPeriod extends StatefulWidget {
  const DroplistSelectPeriod(
      {Key? key, required Null Function(dynamic selected) onChanged})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DroplistSemesterState createState() => _DroplistSemesterState();
}

class _DroplistSemesterState extends State<DroplistSelectPeriod> {
  final List<String> semesterItems = [
    '8:30-9:30',
    '9:30-10:30',
    '10:30-11:30',
    '11:30-12:30',
    '12:30-1:30',
    '1:30-2:30',
  ];

  String? selectedValue;
  Widget? selectedTable;

  @override
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              hint: Text(
                S.of(context).selecttheperion,
                style: const TextStyle(fontSize: 14),
              ),
              value: selectedValue,
              items: semesterItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(
                  () {},
                );
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.only(right: 8),
              ),
              dropdownStyleData: DropdownStyleData(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15))),
              menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16)),
            ),
          ),
          if (selectedTable != null) selectedTable!,
        ],
      ),
    );
  }
}
