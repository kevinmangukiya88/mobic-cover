import 'package:flutter/material.dart';
import 'package:mobic_cover/constant/app_images.dart';

class NoRouterScreen extends StatelessWidget {
  const NoRouterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.notFound404,
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}
