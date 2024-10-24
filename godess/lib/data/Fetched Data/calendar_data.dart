import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;

class HtmlFetcher extends StatefulWidget {
  @override
  _HtmlFetcherState createState() => _HtmlFetcherState();
}

class _HtmlFetcherState extends State<HtmlFetcher> {
  List<Map<String, String>> calendarItems = [];

  @override
  void initState() {
    super.initState();
    fetchHtml();
  }

  Future<void> fetchHtml() async {
    final response = await http
        .get(Uri.parse('https://www.crkvenikalendar.com/index_ge.php'));

    if (response.statusCode == 200) {
      dom.Document document = html_parser.parse(response.body);

      final calendarElements = document.getElementsByClassName('cssDays1');

      for (var element in calendarElements) {
        var imgElement = element.querySelector('img');
        var imgSrc = imgElement?.attributes['src'] ?? '';
        var altText = imgElement?.attributes['alt'] ?? '';
        var dateText = element.querySelector('b')?.text ?? '';

        if (!imgSrc.startsWith('http')) {
          imgSrc = 'https://www.crkvenikalendar.com/$imgSrc';
        }

        calendarItems.add({
          'image': imgSrc,
          'name': altText,
          'date': dateText,
        });
      }

      setState(() {});
    } else {
      throw Exception('Failed to load HTML');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HTML Calendar Fetcher')),
      body: ListView.builder(
        itemCount: calendarItems.length,
        itemBuilder: (context, index) {
          final item = calendarItems[index];
          return ListTile(
            leading: Image.network(item['image'] ?? ''),
            title: Text(item['name'] ?? ''),
            subtitle: Text('Date: ${item['date']}'),
          );
        },
      ),
    );
  }
}
