import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/widget/StudentWidgets/Table/AvaliableClasses/available_classes_table.dart';
import 'package:wise_student_app/widget/StudentWidgets/name_id_container.dart';

class DroplistSemester extends StatefulWidget {
  const DroplistSemester({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DroplistSemesterState createState() => _DroplistSemesterState();
}

class _DroplistSemesterState extends State<DroplistSemester> {
  final List<String> semesterItems = [
    'Second semester 2024/2025',
    'First semester 2024/2025',
    'Summer semester 2023/2024',
    'Second semester 2023/2024',
    'First semester 2023/2024',
    'Summer semester 2022/2023',
    'Second semester 2022/2023',
    'First semester 2022/2023',
  ];

  String? selectedValue;
  Widget? selectedTable;

  @override
  void initState() {
    super.initState();
    // Set the default value to the latest semester
    selectedValue = semesterItems.first;
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
              hint: const Text(
                'Select your semester',
                style: TextStyle(fontSize: 14),
              ),
              value: selectedValue,
              items: semesterItems
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
          const SizedBox(
            height: 20,
          ),
          const NameIdContainer(),
          const SizedBox(height: 20),
          if (selectedTable != null) selectedTable!,
        ],
      ),
    );
  }

  Widget _buildTableForSemester(String semester) {
    switch (semester) {
      case 'Second semester 2024/2025':
      case 'First semester 2024/2025':
      case 'Summer semester 2023/2024':
      case 'Second semester 2023/2024':
      case 'First semester 2023/2024':
      case 'Summer semester 2022/2023':
      case 'Second semester 2022/2023':
      case 'First semester 2022/2023':
        return const CustomTableWidget2(
          numRows: 8,
        );
      default:
        return Container(); // Return an empty container for unknown semesters
    }
  }
}
