import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/interested_in_controller.dart';
import 'package:hola/view/main_screen.dart';

class InterestedScreen extends StatelessWidget {
  InterestedInController interestCtrl = Get.put(InterestedInController());
  String userChoice;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: AppColors.kf6f6f6,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Who are you Interested In?",
                        style: kInterText.copyWith(
                          color: AppColors.kff4165,
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        smallButton(
                          buttonTxt: "Man",
                          txtColor: interestCtrl.gender.value == 0
                              ? AppColors.kffffff
                              : AppColors.kff4165,
                          buttonColor: interestCtrl.gender.value == 0
                              ? AppColors.kff4165
                              : AppColors.kffffff,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          onTap: () {
                            interestCtrl.gender.value = 0;
                            userChoice = "Male";
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        smallButton(
                          buttonTxt: "Woman",
                          txtColor: interestCtrl.gender.value == 1
                              ? AppColors.kffffff
                              : AppColors.kff4165,
                          buttonColor: interestCtrl.gender.value == 1
                              ? AppColors.kff4165
                              : AppColors.kffffff,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          onTap: () {
                            interestCtrl.gender.value = 1;
                            userChoice = "Female";
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        smallButton(
                          buttonTxt: "Everyone",
                          txtColor: interestCtrl.gender.value == 2
                              ? AppColors.kffffff
                              : AppColors.kff4165,
                          buttonColor: interestCtrl.gender.value == 2
                              ? AppColors.kff4165
                              : AppColors.kffffff,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          onTap: () {
                            interestCtrl.gender.value = 2;
                            userChoice = "Everyone";
                          },
                        ),
                        SizedBox(
                          height: 160,
                        ),
                      ],
                    ),
                    flatButton(
                        buttonTxt: "Done",
                        txtSize: 17,
                        buttonColor: AppColors.kff4165,
                        txtColor: AppColors.kffffff,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 72, vertical: 20),
                        onTap: () {
                          Get.to(MainScreen());
                        }),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
