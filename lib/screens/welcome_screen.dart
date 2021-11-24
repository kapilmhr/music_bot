import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_playground/global/appcolors.dart';
import 'package:music_playground/routes/routes.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                SvgPicture.asset("assets/ic_icon.svg"),
                const SizedBox(
                  height: 50,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: const [
                    Text(
                      "Feel the music, set yourself",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "yourself ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      " free.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.accentColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Invite your friends and listen to\nmusic together.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 50,
                ),
                MaterialButton(
                    height: 50,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: AppColors.accentColor,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      Routes().navigateToDashboardScreen(context);
                    },
                    color: AppColors.accentColor,
                    child: Text("Start the party",
                        style: TextStyle(color: Colors.white))),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                    height: 50,
                    onPressed: () {
                      Routes().navigateToDashboardScreen(context);
                    },
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text("Join the party",
                        style: TextStyle(color: Colors.white))),
              ],
            ),
            Image.asset(
              "assets/ic_wave.png",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
