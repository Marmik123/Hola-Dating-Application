import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/view/widgets/likes_screen_grid.dart';

class LikesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kf6f6f6,
      appBar: AppBar(
        shadowColor: AppColors.kb0b0b0,
        elevation: 5,
        backgroundColor: AppColors.kffffff,
        centerTitle: true,
        title: Text(
          "Likes",
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
      body: LikesScreenGrid(),
    );
  }
}
