import 'package:flutter/material.dart';
import 'package:godess/presentation/views/about_us.dart';
import 'package:godess/presentation/views/calendar_view.dart';
import 'package:godess/presentation/views/news_view.dart';
import 'package:godess/presentation/views/map_view.dart';
import 'package:godess/presentation/views/offering_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFd7cab8),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/drawer_image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OfferingPage()));
              },
            ),
            ListTile(
              title: const Text('ჩვენს შესახებ'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AboutUs()));
              },
            )
          ],
        ),
      ),
    );
  }
}
