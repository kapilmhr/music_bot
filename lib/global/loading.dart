import 'package:flutter/material.dart';

import 'appcolors.dart';

class Loading extends StatelessWidget {
  Color color;
  Loading({this.color = AppColors.primaryColor});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 2,
      ),
    );
  }
}
