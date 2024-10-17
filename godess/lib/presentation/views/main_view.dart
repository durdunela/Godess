import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:godess/presentation/views/goods_view.dart';
import 'package:godess/presentation/views/home_view.dart';
import 'package:godess/presentation/views/prayers_view.dart';
import 'package:godess/presentation/views/television_view.dart';
import 'package:godess/widgets/custom_appbar.dart';
import 'package:godess/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
      appBar: const CustomAppBar(title: 'მაცნე'),
      drawer: const CustomDrawer(),
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
