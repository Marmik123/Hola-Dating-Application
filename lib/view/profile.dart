import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/controller/page_view_controller.dart';
import 'package:hola/repository/profile_repository.dart';

import 'file:///H:/RepoDharmaTech/hola/lib/view/user_info_registration/account_secure.dart';
import 'file:///H:/RepoDharmaTech/hola/lib/view/user_info_registration/email_recovery.dart';
import 'file:///H:/RepoDharmaTech/hola/lib/view/user_info_registration/profile_screen.dart';

import 'user_info_registration/filling_details.dart';

class ProfileScreen extends StatelessWidget {
  PageViewController pageCtrl = Get.put(PageViewController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.kf6f6f6,
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                DotsIndicator(
                  position: pageCtrl.currentIndexPage.value.toDouble(),
                  dotsCount: 4,
                  decorator: DotsDecorator(
                    color: AppColors.kD8D8D8,
                    size: Size(6, 6),
                    activeColor: AppColors.kFF3F66,
                    activeSize: Size(6, 6),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (value) {
                      pageCtrl.currentIndexPage.value = value;
                    },
                    controller: pageController,
                    children: [
                      BuildProfileScreen(),
                      Details(),
                      EmailRecovery(),
                      AccountSecure(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
