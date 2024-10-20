import 'package:flutter/material.dart';
import 'package:godess/models/shows.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoListScreen extends StatefulWidget {
  final Show show;

  const VideoListScreen({super.key, required this.show});

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  late List<YoutubePlayerController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = widget.show.videoLinks!.map((link) {
      final videoId = YoutubePlayer.convertUrlToId(link);
      return YoutubePlayerController(
        initialVideoId: videoId ?? '',
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
        ),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.show.title ?? 'Videos')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.show.videoLinks?.length ?? 0,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.width / 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: YoutubePlayer(
                          controller: _controllers[index],
                          showVideoProgressIndicator: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.show.title ?? 'Untitled Video',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
