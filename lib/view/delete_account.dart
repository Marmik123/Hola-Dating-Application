import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/view/splash_screen.dart';

class DeleteAccount extends StatelessWidget {
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
          "Delete Account",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Image(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 4,
                image: AssetImage("assets/images/delete_icon.png")),
            Text(
              "Are you Sure?",
              style: kInterText.copyWith(
                color: AppColors.kff4165,
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "If you delete your account ,you will lose all your profile, messages, photos, and your matches. \n \n Are you sure you want to delete your account?",
              style: kInterText.copyWith(
                color: AppColors.k000000,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 120,
            ),
            flatButton(
              txtSize: 17,
              buttonColor: AppColors.kff4165,
              txtColor: AppColors.kffffff,
              onTap: () {
                Get.offAll(SplashScreen());
              },
              buttonTxt: "Confirm",
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 80),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Center(
                child: Text(
                  "Cancel",
                  style: kInterText.copyWith(
                    color: AppColors.kff4165,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
