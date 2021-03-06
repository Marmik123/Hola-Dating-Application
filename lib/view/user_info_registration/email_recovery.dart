import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/email_recovery_controller.dart';
import 'package:hola/repository/profile_repository.dart';

class EmailRecovery extends StatelessWidget {
  EmailRecover emailCtrl = Get.put(EmailRecover());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kf6f6f6,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
          physics: ClampingScrollPhysics(),
          child: Form(
            key: emailCtrl.formKey,
            child: Column(
              children: [
                Text(
                  "Add Recovery Email",
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
                  "Your email will be used for security purpose, such as helping you get back into your account if you ever forget your password.",
                  style: kInterText.copyWith(
                    color: AppColors.k000000,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Email",
                      style: kInterText.copyWith(
                        color: AppColors.kff4165,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    TextFormField(
                      controller: emailCtrl.email,
                      keyboardType: TextInputType.emailAddress,
                      // ignore: missing_return
                      validator: (value) {
                        if (!GetUtils.isEmail(value)) {
                          return "Please enter a valid email address";
                        }
                      },
                      textAlign: TextAlign.start,
                      cursorColor: AppColors.kff4165,
                      decoration: InputDecoration(
                        hintText: "Bobby.brown@email.com",
                        hintStyle: kInterText.copyWith(
                          color: AppColors.k000000,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: AppColors.kffffff,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.kffffff),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 110,
                    ),
                    flatButton(
                        buttonTxt: "Continue",
                        txtSize: 17,
                        buttonColor: AppColors.kff4165,
                        txtColor: AppColors.kffffff,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 72, vertical: 20),
                        onTap: () {
                          if (emailCtrl.formKey.currentState.validate()) {
                            emailCtrl.addEmailAddress();
                          }
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInSine);
                      },
                      child: Center(
                        child: Text(
                          "Skip",
                          style: kInterText.copyWith(
                            color: AppColors.kB5B5B5,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
