import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/StudentWidgets/drop_list_semester.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule extends StatefulWidget {
  static List<DataRow> selectedRows = [];

  const Schedule({
    super.key,
  });

  static void addSelectedRow(DataRow row) {
    selectedRows.add(row);
  }

  static void addToFirebase() {
    final CollectionReference myTable =
        FirebaseFirestore.instance.collection('StudentSchedual');

    List<Map<String, dynamic>> allRowData = [];

    for (var row in selectedRows) {
      String courseName = (row.cells[0].child as Text).data ?? '';
      String period = (row.cells[1].child as Text).data ?? '';
      String location = (row.cells[2].child as Text).data ?? '';
      String instructorName = (row.cells[3].child as Text).data ?? '';

      Map<String, dynamic> rowData = {
        'course_name': courseName,
        'period': period,
        'location': location,
        'instructor_name': instructorName,
      };
      allRowData.add(rowData);
    }

    myTable.add({'rows': allRowData});

    selectedRows.clear();
  }

  @override
  // ignore: library_private_types_in_public_api
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        shadowColor: Theme.of(context).colorScheme.secondary,
        elevation: 2,
        title: Text(
          S.of(context).YourSchedule,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const DroplistSemester(),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: Schedule.selectedRows.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(label: Text('Course Name')),
                          DataColumn(label: Text('Period')),
                          DataColumn(label: Text('Location')),
                          DataColumn(label: Text('Instructor Name')),
                        ],
                        rows: [
                          Schedule.selectedRows[index],
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Schedule.addToFirebase();
                Schedule.selectedRows.clear();
                setState(() {});
              },
              child: const Text('Confirm'),
            ),
            if (Schedule.selectedRows.isEmpty) const ConfirmedSchedual(),
          ],
        ),
      ),
    );
  }
}

class ConfirmedSchedual extends StatefulWidget {
  const ConfirmedSchedual({
    super.key,
  });

  @override
  State<ConfirmedSchedual> createState() => _ConfirmedSchedualState();
}

class _ConfirmedSchedualState extends State<ConfirmedSchedual> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
          stream: _firestore.collection('StudentSchedual').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Text('');
            } else {
              List<DataRow> rows = snapshot.data!.docs.expand((doc) {
                // Extract rows from each document
                List<Map<String, dynamic>> rowDataList =
                    List<Map<String, dynamic>>.from(doc['rows']);
                return rowDataList.map((rowData) {
                  return DataRow(
                    cells: [
                      DataCell(Text(rowData['course_name'] ?? '')),
                      DataCell(Text(rowData['period'] ?? '')),
                      DataCell(Text(rowData['location'] ?? '')),
                      DataCell(Text(rowData['instructor_name'] ?? '')),
                    ],
                  );
                });
              }).toList();

              return FittedBox(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Course Name')),
                    DataColumn(label: Text('Period')),
                    DataColumn(label: Text('Location')),
                    DataColumn(label: Text('Instructor Name')),
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
