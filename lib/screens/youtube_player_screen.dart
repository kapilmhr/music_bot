import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerScreen extends StatefulWidget {
  String videoId;


  YoutubePlayerScreen(this.videoId);

  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      params: const YoutubePlayerParams(
        // playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
        startAt: Duration(seconds: 1),
        showControls: true,
        showFullscreenButton: true,
        autoPlay: true,
        desktopMode: true
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: YoutubePlayerControllerProvider( // Provides controller to all the widget below it.
        controller: _controller,
        child: const YoutubePlayerIFrame(
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
