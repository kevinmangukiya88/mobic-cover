import 'package:flutter/material.dart';
import 'package:mobic_cover/component/common_app_bar.dart';
import 'package:mobic_cover/component/common_bottom_bar.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonStartUpWidget(
        body: ListView(
          children: [
            Container(
              height: 500,
              color: Colors.green,
            ),
            CommonBottomBarWidget(),
          ],
        ),
      ),
    );
  }
}
