import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Studenthrs extends StatefulWidget {
  const Studenthrs({super.key});

  @override
  State<Studenthrs> createState() => _StudenthrsState();
}

class _StudenthrsState extends State<Studenthrs> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Get the current user
    User? currentUser = _auth.currentUser;

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
          stream: _firestore.collection('MarksReport').where('id', isEqualTo: currentUser?.uid).snapshots(), // Filter data based on the current user's UID
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
                    DataCell(Text(courseData['ch'] ?? '')),
                    DataCell(Text(courseData['total_ch'] ?? '')),
                    DataCell(Text(courseData['sch'] ?? '')),
                    DataCell(Text(courseData['cgpa'] ?? '')),
                    DataCell(Text(courseData['sgpa'] ?? '')),
                  ],
                );
              }).toList();

              return FittedBox(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Credit Hours per Semester')),
                    DataColumn(label: Text('Total Credit Hours')),
                    DataColumn(label: Text('Successful Credit Hours')),
                    DataColumn(label: Text('Cumulative GPA')),
                    DataColumn(label: Text('Semester GPA')),
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