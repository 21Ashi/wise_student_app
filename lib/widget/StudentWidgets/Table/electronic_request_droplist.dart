import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/Profile/Student/open_new_selection.dart';
import 'package:wise_student_app/Screens/Profile/Student/request_elective.dart';

class DroplistElectronicRequest extends StatefulWidget {
  const DroplistElectronicRequest({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DroplistSemesterState createState() => _DroplistSemesterState();
}

class _DroplistSemesterState extends State<DroplistElectronicRequest> {
  final List<String> examsItems = [
    'Open New Section',
    'Request Elective Course',
  ];

  String? selectedValue;
  Widget? selectedTable;

  @override
  void initState() {
    super.initState();
    // Set the default value to the latest semester
    selectedValue = examsItems.first;
    selectedTable = _buildTableForSemester(selectedValue!);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              value: selectedValue,
              items: examsItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 11),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(
                  () {
                    selectedValue = value;
                    if (value != null) {
                      selectedTable = _buildTableForSemester(value);
                    }
                  },
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
          const SizedBox(height: 20),
          if (selectedTable != null) selectedTable!,
        ],
      ),
    );
  }

  Widget _buildTableForSemester(String exam) {
    switch (exam) {
      case 'Open New Section':
        return const Opennewsection();
      case 'Request Elective Course':
        return const RequestElective();
      default:
        return Container(); // Return an empty container for unknown semesters
    }
  }
}
