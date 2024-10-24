import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:godess/presentation/sections/additional_service_widget.dart';
import 'package:godess/presentation/sections/calendar_widget.dart';
import 'package:godess/presentation/sections/news_section_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // CalendarWidget(),
            const SizedBox(height: 20),
            const Text(
              'სიახლეები',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            NewsSectionWidget(),
            const SizedBox(height: 15),
            const Text(
              'დამატებითი სერვისი',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            AdditionalServicesWidget(),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
