import 'package:flutter/material.dart';
import 'package:godess/models/shows.dart';

class VideoListScreen extends StatelessWidget {
  final Show show;

  const VideoListScreen({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(show.title ?? 'Videos')),
      body: ListView.builder(
        itemCount: show.videoLinks?.length ?? 0,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text('Video ${index + 1}'),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  show.imageUrl ?? 'no image',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
