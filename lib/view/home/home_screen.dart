import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/main_header.dart';
import '../../controller/controllers.dart';
import 'components/carousel_slider/carousel_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Column(
        children: [
          const MainHeader(),
          Obx(() {
            if (homeController.isBannerLoading.value) {
              return CarouselLoading();
            } else {
              return CarouselLoading();
            }
          })
        ],
      )
    ]));
  }
}
