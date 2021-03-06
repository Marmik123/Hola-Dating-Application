import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/slug_screen_controller.dart';
import 'package:hola/view/widgets/circular_loader.dart';

class AboutUs extends StatelessWidget {
  SlugScreenController slugCtrl = Get.put(SlugScreenController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.kf6f6f6,
        appBar: AppBar(
          shadowColor: AppColors.kb0b0b0,
          elevation: 5,
          backgroundColor: AppColors.kffffff,
          centerTitle: true,
          title: Text(
            /*slugCtrl.title ?? */ 'About Us',
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
        body: slugCtrl.isLoading.value
            ? Center(
                child: buildLoader(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        slugCtrl.description ?? buildLoader(),
                        style: kInterText.copyWith(
                          color: AppColors.kB5B5B5,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
