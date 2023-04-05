import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/view/home/components/popular_category/popular_category.dart';

import '../../component/main_header.dart';
import '../../controller/controllers.dart';
import 'components/carousel_slider/carousel_loading.dart';
import 'components/carousel_slider/carousel_slider_view.dart';
import 'components/popular_category/popular_category_loading.dart';
import 'components/section_title.dart';

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
            if (homeController.bannerList.isNotEmpty) {
              return CarouselSliderView(bannerList: homeController.bannerList);
            } else {
              return const CarouselLoading();
            }
          }),
          const SectionTitle(title: "Danh mục phổ biến"),
          Obx(() {
            if (homeController.popularCategoryList.isNotEmpty) {
              return PopularCategory(
                  categories: homeController.popularCategoryList);
            } else {
              return const PopularCategoryLoading();
            }
          }),
        ],
      )
    ]));
  }
}
