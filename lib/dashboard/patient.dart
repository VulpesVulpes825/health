import 'package:flutter/material.dart';
import 'package:health/dashboard/tag.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Patients",
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontSizeFactor: 2.0),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Upload Patient",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Add Patient",
                    ),
                  ),
                ],
              )
            ],
          ),
          FittedBox(
            child:  DataTable(
              showCheckboxColumn: true,
              columnSpacing: 30,
              columns: const [
                DataColumn(
                  label: Text('Name'),
                ),
                DataColumn(
                  label: Text('Status'),
                ),
                DataColumn(
                  label: Text('DOB'),
                ),
                DataColumn(
                  label: Text('Gender'),
                ),
                DataColumn(
                  label: Text('Email'),
                ),
                DataColumn(
                  label: Text('Upcoming Visit'),
                ),
                DataColumn(
                  label: Text('Action'),
                ),
              ],
              rows: [
                DataRow(
                  onSelectChanged: (selected) {
                    print(selected);
                  },
                  cells: [
                    DataCell(Text('John Smith')),
                    DataCell(tag("Active")),
                    DataCell(Text('01/01/1980')),
                    DataCell(Text('MALE')),
                    DataCell(Text('patient@gmail.com')),
                    DataCell(Text('01/01/1014')),
                    DataCell(ElevatedButton(onPressed: () {  }, child: const Icon(Icons.more_horiz),)),
                  ],
                ),
                DataRow(
                  onSelectChanged: (selected) {
                    print(selected);
                  },
                  cells: [
                    DataCell(Text('John Smith')),
                    DataCell(tag("Active")),
                    DataCell(Text('01/01/1980')),
                    DataCell(Text('FEMALE')),
                    DataCell(Text('patient@gmail.com')),
                    DataCell(Text('01/01/2024')),
                    DataCell(ElevatedButton(onPressed: () {  }, child: const Icon(Icons.more_horiz),)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
