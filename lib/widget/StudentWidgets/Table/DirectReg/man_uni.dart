import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/Profile/Student/your_schedule.dart';

class MandatoryUniversityC extends StatefulWidget {
  const MandatoryUniversityC({super.key,});

  @override
  State<MandatoryUniversityC> createState() => _MandatoryUniversityCState();
}

class _MandatoryUniversityCState extends State<MandatoryUniversityC> {
  final _firestore = FirebaseFirestore.instance;
  late List<bool> _checkedList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              color: Theme.of(context).colorScheme.secondary,
            )
          ],
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(15),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('MandatoryUniversity').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (_checkedList.isEmpty) {
              _checkedList = List<bool>.filled(snapshot.data!.docs.length, false);
            }
            List<DataRow> rows = snapshot.data!.docs.asMap().entries.map((entry) {
              Map<String, dynamic> courseData = entry.value.data() as Map<String, dynamic>;
              int index = entry.key;
              return DataRow(
                cells: [
                  DataCell(Text(courseData['course_name'] ?? '')),
                  DataCell(Text(courseData['period'] ?? '')),
                  DataCell(Text(courseData['location'] ?? '')),
                  DataCell(Text(courseData['instructor_name'] ?? '')),
                  DataCell(
                    Checkbox(
                      value: _checkedList[index],
                      onChanged: (bool? value) {
                        setState(() {
                          _checkedList[index] = value ?? false;
                          // Call the function to add the selected row to Schedule
                          if (value ?? false) {
                            Schedule.addSelectedRow(
                              DataRow(
                                cells: [
                                  DataCell(Text(courseData['course_name'] ?? '')),
                                  DataCell(Text(courseData['period'] ?? '')),
                                  DataCell(Text(courseData['location'] ?? '')),
                                  DataCell(Text(courseData['instructor_name'] ?? '')),
                                ],
                              ),
                            );
                          }
                        });
                      },
                    ),
                  ),
                ],
              );
            }).toList();

            return FittedBox(
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('Course Name')),
                  DataColumn(label: Text('period')),
                  DataColumn(label: Text('location')),
                  DataColumn(label: Text('instructor Name')),
                  DataColumn(label: Text('Select')),
                ],
                rows: rows,
              ),
            );
          }
        ),
      ),
    );
  }
}
