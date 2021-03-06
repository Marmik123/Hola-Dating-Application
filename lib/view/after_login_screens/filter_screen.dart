import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/filter_screen_controller.dart';

class FilterScreen extends StatelessWidget {
  FilterScreenController filterCtrl = Get.put(FilterScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            shadowColor: AppColors.kb0b0b0,
            elevation: 5,
            backgroundColor: AppColors.kffffff,
            centerTitle: true,
            title: Text(
              "Apply Filters",
              style: kInterText.copyWith(
                fontSize: 25,
                color: AppColors.kff4165,
                fontWeight: FontWeight.w700,
              ),
            ),
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.keyboard_backspace_sharp,
                  size: 18,
                  color: AppColors.k000000,
                )),
          ),
          backgroundColor: AppColors.kf6f6f6,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " Age Range",
                                style: kInterText.copyWith(
                                  fontSize: 20,
                                  color: AppColors.kff4165,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              GetBuilder(
                                init: FilterScreenController(),
                                builder: (value) => Text(
                                  "${filterCtrl.currentRangeValues.start.round()}-${filterCtrl.currentRangeValues.end.round()}",
                                  style: kInterText.copyWith(
                                    fontSize: 18,
                                    color: AppColors.k000000,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GetBuilder(
                              init: FilterScreenController(),
                              builder: (value) => SliderTheme(
                                    data: SliderThemeData(
                                      minThumbSeparation: 10,
                                    ),
                                    child: RangeSlider(
                                      values: filterCtrl.currentRangeValues,
                                      activeColor: AppColors.kff4165,
                                      onChanged: (value) {
                                        filterCtrl.ageChanged(value);
                                      },
                                      min: 18,
                                      max: 120,
                                      inactiveColor: AppColors.kD8D8D8,
                                    ),
                                  )),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Maximum Distance",
                                style: kInterText.copyWith(
                                  fontSize: 20,
                                  color: AppColors.kff4165,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "${filterCtrl.distance.value?.round() ?? 10}km",
                                style: kInterText.copyWith(
                                  fontSize: 18,
                                  color: AppColors.k000000,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                              minThumbSeparation: 10,
                            ),
                            child: Slider(
                              divisions: 100,
                              value: filterCtrl.distance.value ?? 10,
                              activeColor: AppColors.kff4165,
                              onChanged: (value) {
                                if (value != null) {
                                  filterCtrl.distance.value = value;
                                } else {
                                  print("value is null");
                                }
                              },
                              min: 1,
                              max: 100,
                              inactiveColor: AppColors.kD8D8D8,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ListTile(
                        title: Text(
                          "Show Me",
                          style: kInterText.copyWith(
                            fontSize: 20,
                            color: AppColors.kff4165,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            smallButton(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 60),
                              buttonTxt: "Man",
                              txtColor: filterCtrl.gender.value == 0
                                  ? AppColors.kffffff
                                  : AppColors.kff4165,
                              buttonColor: filterCtrl.gender.value == 0
                                  ? AppColors.kff4165
                                  : AppColors.kffffff,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 50),
                              onTap: () {
                                filterCtrl.gender.value = 0;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            smallButton(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 60),
                              buttonTxt: "Woman",
                              txtColor: filterCtrl.gender.value == 1
                                  ? AppColors.kffffff
                                  : AppColors.kff4165,
                              buttonColor: filterCtrl.gender.value == 1
                                  ? AppColors.kff4165
                                  : AppColors.kffffff,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 50),
                              onTap: () {
                                filterCtrl.gender.value = 1;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            smallButton(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 60),
                              buttonTxt: "Everyone",
                              txtColor: filterCtrl.gender.value == 2
                                  ? AppColors.kffffff
                                  : AppColors.kff4165,
                              buttonColor: filterCtrl.gender.value == 2
                                  ? AppColors.kff4165
                                  : AppColors.kffffff,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 50),
                              onTap: () {
                                filterCtrl.gender.value = 2;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
