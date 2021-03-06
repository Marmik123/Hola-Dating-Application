import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterScreenController extends GetxController {
  RxInt gender = 0.obs;
  RxDouble distance = 10.0.obs;

  RangeValues currentRangeValues = const RangeValues(40, 80);

  //Function to update age range slider
  ageChanged(RangeValues values) {
    currentRangeValues = values;
    update();
  }
}
