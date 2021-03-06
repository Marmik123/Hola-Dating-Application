import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  PageController bottomPageController = PageController();

  RxInt navigatorIndex = 0.obs;
  RxInt itemIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    navigatorIndex.value = 0;
    itemIndex = 0.obs;
  }
}
