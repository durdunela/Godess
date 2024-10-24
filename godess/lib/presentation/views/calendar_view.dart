import 'package:flutter/material.dart';
import 'package:godess/services/config.dart'; // Assuming this contains ApiService

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late Future<List<Map<String, dynamic>>> _calendarData;
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;

  @override
  void initState() {
    super.initState();
    _calendarData = ApiService().fetchCalendar(selectedYear, selectedMonth);
  }

  void _fetchNewData() {
    setState(() {
      _calendarData = ApiService().fetchCalendar(selectedYear, selectedMonth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('კალენდარი'),
        backgroundColor: const Color(0xFFAA925C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDropdownButton(
                  value: selectedYear,
                  items: List.generate(131, (index) => 1970 + index),
                  onChanged: (newValue) {
                    setState(() {
                      selectedYear = newValue!;
                    });
                    _fetchNewData();
                  },
                  label: 'წელი',
                ),
                const SizedBox(width: 20),
                _buildDropdownButton(
                  value: selectedMonth,
                  items: List.generate(12, (index) => index + 1),
                  onChanged: (newValue) {
                    setState(() {
                      selectedMonth = newValue!;
                    });
                    _fetchNewData();
                  },
                  label: 'თვე',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _calendarData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No calendar data found'));
                  }

                  List<Map<String, dynamic>> calendarItems = snapshot.data!;
                  return ListView.builder(
                    itemCount: calendarItems.length,
                    itemBuilder: (context, index) {
                      final item = calendarItems[index];
                      return _buildCalendarCard(item);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownButton({
    required int value,
    required List<int> items,
    required void Function(int?) onChanged,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        DropdownButton<int>(
          value: value,
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem<int>(
              value: item,
              child: Text(item.toString()),
            );
          }).toList(),
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildCalendarCard(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(item['image'] ?? 'No image'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'] ?? 'No name',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['date'] ?? 'No date',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['alt'] ?? 'No Description',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
