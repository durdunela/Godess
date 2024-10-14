import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:godess/presentation/views/calendar_view.dart';
import 'package:godess/presentation/views/goods_view.dart';
import 'package:godess/presentation/views/home_view.dart';
import 'package:godess/presentation/views/map_view.dart';
import 'package:godess/presentation/views/news_view.dart';
import 'package:godess/presentation/views/prayers_view.dart';
import 'package:godess/presentation/views/television_view.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const PrayersPage(),
    const GoodsPage(),
    const TelevisionPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('მაცნე'),
        backgroundColor: const Color(0xFFAA925C),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('სიახლეები'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const NewsPage()));
              },
            ),
            ListTile(
              title: const Text('საკლესიო კალენდარი'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChurchCalendar()));
              },
            ),
            ListTile(
              title: const Text('საეკლესიო რუქა'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ChurchMap()));
              },
            ),
            ListTile(
              title: const Text('შესაწირი'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3);
              },
            ),
            ListTile(
              title: const Text('ჩვენს შესახებ'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3);
              },
            )
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: const Color(0xFFAA925C),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'მთავარი',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bookBible),
            label: 'ლოცვანი',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bagShopping),
            label: 'ნაწარმი',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'ტელევიზია',
          ),
        ],
      ),
    );
  }
}
