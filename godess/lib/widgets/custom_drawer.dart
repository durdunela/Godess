import 'package:flutter/material.dart';
import 'package:godess/presentation/views/calendar_view.dart';
import 'package:godess/presentation/views/goods_view.dart';
import 'package:godess/presentation/views/news_view.dart';
import 'package:godess/presentation/views/map_view.dart';
import 'package:godess/presentation/views/prayers_view.dart';
import 'package:godess/presentation/views/television_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            },
          ),
          ListTile(
            title: const Text('ჩვენს შესახებ'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
