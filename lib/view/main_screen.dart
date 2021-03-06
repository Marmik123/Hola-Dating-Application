import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/controller/main_screen_controller.dart';
import 'package:hola/view/bottom_navigation_tabs/user_profile.dart';

import 'bottom_navigation_tabs/chat_screen.dart';
import 'bottom_navigation_tabs/match_screen.dart';
import 'bottom_navigation_tabs/search_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreenController screenCtrl = Get.put(MainScreenController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        backgroundColor: AppColors.kf6f6f6,
        bottomNavigationBar: SnakeNavigationBar.color(
          currentIndex: screenCtrl.itemIndex.value,
          snakeShape: SnakeShape.indicator,
          snakeViewColor: AppColors.kff4165,
          onTap: (index) {
            screenCtrl.itemIndex.value = index;
            screenCtrl.navigatorIndex.value = index;
            screenCtrl.bottomPageController.animateToPage(
                screenCtrl.navigatorIndex.value,
                duration: Duration(milliseconds: 200),
                curve: Curves.linear);
          },
          items: [
            BottomNavigationBarItem(
                icon: screenCtrl.itemIndex.value == 0
                    ? Image.asset(
                        "assets/images/search.png",
                        color: AppColors.kff4165,
                        height: 24,
                        width: 24,
                      )
                    : Image.asset(
                        "assets/images/search.png",
                        color: AppColors.kd1d1d1,
                        height: 24,
                        width: 24,
                      )),
            BottomNavigationBarItem(
              icon: screenCtrl.itemIndex.value == 1
                  ? Image.asset(
                      "assets/images/heart_like.png",
                      color: AppColors.kff4165,
                      height: 24,
                      width: 24,
                    )
                  : Image.asset(
                      "assets/images/heart_like.png",
                      color: AppColors.kd1d1d1,
                      height: 24,
                      width: 24,
                    ),
            ),
            BottomNavigationBarItem(
                icon: screenCtrl.itemIndex.value == 2
                    ? Image.asset(
                        "assets/images/message.png",
                        color: AppColors.kff4165,
                        height: 24,
                        width: 24,
                      )
                    : Image.asset(
                        "assets/images/message.png",
                        color: AppColors.kd1d1d1,
                        height: 24,
                        width: 24,
                      )),
            BottomNavigationBarItem(
                icon: screenCtrl.itemIndex.value == 3
                    ? Image.asset(
                        "assets/images/profile.png",
                        color: AppColors.kff4165,
                        height: 24,
                        width: 24,
                      )
                    : Image.asset(
                        "assets/images/profile.png",
                        color: AppColors.kd1d1d1,
                        height: 24,
                        width: 24,
                      )),
          ],
        ),
        body: PageView(
          onPageChanged: (value) {
            screenCtrl.navigatorIndex.value = value;
          },
          physics: NeverScrollableScrollPhysics(),
          controller: screenCtrl.bottomPageController,
          children: [
            SearchScreen(),
            MatchScreen(),
            ChatScreen(),
            UserProfile(),
          ],
        )));
  }
}
