import 'package:flutter/material.dart';
import 'package:godess/models/calendar_model.dart';

class CalendarWidget extends StatelessWidget {
  final List<Event> events = Event.getEvent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: events.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: index == 1 ? Colors.amber : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          events[index].date,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: index == 1 ? Colors.amber : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Image.asset(
                          events[index].image,
                          height: 50,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          events[index].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
