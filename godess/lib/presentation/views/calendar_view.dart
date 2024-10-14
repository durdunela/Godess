import 'package:flutter/material.dart';

class ChurchCalendar extends StatelessWidget {
  const ChurchCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        backgroundColor: const Color(0xFFCBAA7A),
      ),
      body: const CalendarBody(),
    );
  }
}

class CalendarBody extends StatelessWidget {
  const CalendarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopImageSection(),
          _buildLiturgicalNavigation(),
          _buildLiturgicalText(),
          _buildTextSection('VI ჟამზე: ეს. 45: 11-17.',
              'მწუხრზე: დაბ. 22: 1-18. იგავ. 17: 17-28; 18: 1-5.'),
          _buildTextSection('ტიპიკონური მითითებები', 'ტექსტი'),
        ],
      ),
    );
  }

  Widget _buildTopImageSection() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image:
              NetworkImage('https://www.etaloni.ge/gallery/ididishabati.jpg'),
        ),
      ),
    );
  }

  Widget _buildLiturgicalNavigation() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          const Text('დიდი მარხვის მე-5 დღე',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildLiturgicalText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'პირველწოდებულის ლიტურგია',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('➤ წმ. ევიქტი კონსტანტინეპოლელი პატრიარქისა (582)'),
          Text('➤ წმ. მეთოდე მორავიელ მთავარეპისკოპოსისა (885);'),
          Text('➤ ღირსისა პლატონიდა ასურისა (308);'),
          Text('➤ 120 სპარსელ მოწამეთა (344-347);'),
          Text('➤ 120 სპარსელ მოწამეთა (344-347);'),
          Text('➤ მოწამეთა იერემიასი და არქილე ხუცისა (III);'),
          Text('➤ ხსენება ზოსიმესი და შიშველმართალთა.'),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildTextSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(content),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
