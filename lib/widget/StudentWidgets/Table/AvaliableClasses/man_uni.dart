import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MandatoryUniversity extends StatefulWidget {
  const MandatoryUniversity({super.key});

  @override
  State<MandatoryUniversity> createState() => _MandatoryUniversityState();
}

class _MandatoryUniversityState extends State<MandatoryUniversity> {
  final _firestore = FirebaseFirestore.instance;
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
              return const CircularProgressIndicator(); // Placeholder for loading state
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('No data available'); // Placeholder for no data state
            } else {
              List<DataRow> rows = snapshot.data!.docs.map((doc) {
                Map<String, dynamic> courseData = doc.data() as Map<String, dynamic>;
                return DataRow(
                  cells: [
                    DataCell(Text(courseData['course_name'] ?? '')),
                    DataCell(Text(courseData['period'] ?? '')),
                    DataCell(Text(courseData['location'] ?? '')),
                    DataCell(Text(courseData['instructor_name'] ?? '')),
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
                  ],
                  rows: rows,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}