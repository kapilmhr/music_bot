import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_playground/global/appcolors.dart';
import 'package:music_playground/global/loading.dart';
import 'package:music_playground/network/ApiServices.dart';
import 'package:music_playground/network/ApiUrl.dart';
import 'package:music_playground/routes/routes.dart';
import 'package:music_playground/screens/songs/songsresponse.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  _SongsScreenState createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  List<Songs> songsList = [];

  @override
  void initState() {
    getSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        child: songsList.isEmpty
            ? Loading()
            : ListView.builder(itemBuilder: (context, index) {
                var song = songsList[index];
                /*return ListTile(
                  onTap: () {
                    var vId = song.url.substring(song.url.indexOf("=") + 1);
                    print(vId);
                    setState(() {});
                    Routes().navigateToPlayerScreen(context, vId);
                  },
                  leading: CachedNetworkImage(
                    imageUrl: song.thumbnailUrl,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    "${song.title}",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  subtitle: Text(
                    "${song.description}",
                    style: TextStyle(color: AppColors.gray),
                  ),
                );*/
                return Container(
                  child: GestureDetector(
                    onTap: () {
                      var vId = song.url.substring(song.url.indexOf("=") + 1);
                      print(vId);
                      setState(() {});
                      Routes().navigateToPlayerScreen(context, vId);
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
                        SizedBox(
                          width: 10,
                        ),
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
                              Text(
                                "${song.description}",
                                style: TextStyle(color: AppColors.gray),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
      ),
    );
  }

  void getSongs() async {
    var res = await ApiServices().get(ApiUrl.SONGS);
    var response = SongsResponse.fromJson(res);
    songsList = response.songsList;
    setState(() {});
  }
}
