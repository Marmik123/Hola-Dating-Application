import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/view/auth/phone_no.dart';

class SignInScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kf6f6f6,
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Sign in to continue",
                style: kInterText.copyWith(
                  color: AppColors.k000000,
                ),
              ),
              SizedBox(
                height: 48,
              ),
              button(
                buttonColor: AppColors.kff4165,
                buttonTxt: "Continue With Facebook",
                txtSize: 17,
                txtColor: AppColors.kffffff,
                onTap: () {},
              ),
              SizedBox(
                height: 17,
              ),
              flatButton(
                txtColor: AppColors.kff4165,
                buttonTxt: "Use Phone Number",
                buttonColor: AppColors.kffffff,
                txtSize: 17,
                padding:
                    const EdgeInsets.symmetric(horizontal: 72, vertical: 20),
                onTap: () {
                  Get.to(PhoneNo());
                },
              ),
              SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Terms of Service",
                      style: kInterText.copyWith(
                        color: AppColors.k323232,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Privacy Policy",
                      style: kInterText.copyWith(
                        color: AppColors.k323232,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
