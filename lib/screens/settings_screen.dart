import 'package:flutter/material.dart';
import 'package:music_playground/global/appcolors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body:Center(
        child: Text("Settings",style: TextStyle(color: AppColors.gray),),
      )
    );
  }
}
