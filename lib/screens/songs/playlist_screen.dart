import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_playground/global/appcolors.dart';
import 'package:music_playground/global/loading.dart';
import 'package:music_playground/network/ApiServices.dart';
import 'package:music_playground/network/ApiUrl.dart';
import 'package:music_playground/routes/routes.dart';
import 'package:music_playground/screens/songs/songsresponse.dart';
import 'package:music_playground/screens/youtube_player_screen.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  List<Songs> songsList = [];
  String videoId = "";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    getSongs();
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: songsList.isEmpty
            ? Loading()
            : Column(
          children: [
            Expanded(
                flex: 2,
                child: videoId.isEmpty?Loading():YoutubePlayerControllerProvider( // Provides controller to all the widget below it.
                  controller: _controller,
                  child: const YoutubePlayerIFrame(
                    aspectRatio: 16 / 9,
                  ),
                )),
            Expanded(
                flex: 3,
                child: ListView.builder(
                shrinkWrap: true,
                primary: true,
                itemCount: songsList.length,
                // physics: FixedExtentScrollPhysics(),
                itemBuilder: (context, index) {
                  var song = songsList[index];

                  return Container(
                    child: GestureDetector(
                      onTap: () {
                        var vId = song.url.substring(song.url.indexOf("=") + 1);
                        print(vId);
                        setState(() {
                          videoId = vId;
                          _controller.load(videoId);
                        });
                        // Routes().navigateToPlayerScreen(context, vId);
                      },
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                width: 100,
                                height: 100,
                                child: CachedNetworkImage(
                                    imageUrl: song.thumbnailUrl),
                              )),
                          SizedBox(width: 10,),
                          Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${song.title}",
                                  style: TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Text("${song.description}",
                                  style: TextStyle(color: AppColors.gray),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }

  void getSongs() async {
    var res = await ApiServices().get(ApiUrl.PLAYLIST+"?startDate=1633082525&endDate=1636106525");
    var response = SongsResponse.fromJson(res);
    songsList = response.songsList;
    videoId = songsList[0].url.substring(songsList[0].url.indexOf("=") + 1);


    setState(() {
      _controller.load(videoId);
    });
  }
}
