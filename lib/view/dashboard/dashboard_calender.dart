import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  DateTime? fromDate;
  DateTime? toDate;

  Future<void> _selectDateRange(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(
        start: fromDate ?? DateTime.now(),
        end: toDate ?? DateTime.now(),
      ),
    );

    if (picked != null &&
        picked != DateTimeRange(start: fromDate!, end: toDate!)) {
      setState(() {
        fromDate = picked.start;
        toDate = picked.end;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => DateRangeDialog(),
              );
            },
            child: Text('Select Date Range'),
          ),
        ],
      ),
    );
  }
}

class DateRangeDialog extends StatelessWidget {
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  void selectFromDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: fromDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      fromDate.value = selectedDate;
    }
  }

  void selectToDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: toDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      toDate.value = selectedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Date Range'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('From Date'),
            subtitle: Obx(() => Text(fromDate.value.toString())),
            onTap: () => selectFromDate(context),
          ),
          ListTile(
            title: Text('To Date'),
            subtitle: Obx(() => Text(toDate.value.toString())),
            onTap: () => selectToDate(context),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Perform any action with the selected date range
            Get.back();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
