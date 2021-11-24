import 'package:flutter/material.dart';
import 'package:music_playground/screens/dashboard_screen.dart';
import 'package:music_playground/screens/songs/playlist_screen.dart';
import 'package:music_playground/screens/songs/songs_screen.dart';
import 'package:music_playground/screens/youtube_player_screen.dart';

class Routes{
  navigateToPlayerScreen(context,id){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => YoutubePlayerScreen(id)),
    );
  }

  navigateToSongsScreen(context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SongsScreen()),
    );
  }

  navigateToPlaylistScreen(context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlaylistScreen()),
    );
  }

  navigateToDashboardScreen(context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
  }
}