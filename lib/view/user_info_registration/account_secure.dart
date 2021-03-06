import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/account_secure_controller.dart';

class AccountSecure extends StatelessWidget {
  AccountSecureController accCtrl = AccountSecureController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kf6f6f6,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 40, right: 40),
          physics: ClampingScrollPhysics(),
          child: Form(
            key: accCtrl.formKey,
            child: Column(
              children: [
                Text(
                  "Secure Your Account",
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
                  "Add a username and password  to keep your account safe",
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
                      "Username",
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
                      controller: accCtrl.username,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter username";
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Bobby.20",
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
                      height: 20,
                    ),
                    Text(
                      "Password",
                      style: kInterText.copyWith(
                        color: AppColors.kff4165,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Obx(
                      () => TextFormField(
                        controller: accCtrl.password,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter a password";
                          } else
                            return null;
                        },
                        obscureText: accCtrl.hidePassword.value,
                        keyboardType: TextInputType.visiblePassword,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              accCtrl.hidePassword.value =
                                  !accCtrl.hidePassword.value;
                            },
                            child: accCtrl.hidePassword.value
                                ? Icon(
                                    Icons.visibility_off,
                                    color: AppColors.kff4165,
                                  )
                                : Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: AppColors.kff4165,
                                  ),
                          ),
                          hintText: "Enter Your password",
                          hintStyle: kInterText.copyWith(
                            color: AppColors.k2A1C37,
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
                    ),
                    SizedBox(
                      height: 110,
                    ),
                    flatButton(
                        buttonTxt: "Done",
                        txtSize: 17,
                        buttonColor: AppColors.kff4165,
                        txtColor: AppColors.kffffff,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 72, vertical: 20),
                        onTap: () {
                          if (accCtrl.formKey.currentState.validate()) {
                            accCtrl.addUsernamePass();
                          }
                        }),
                    SizedBox(
                      height: 30,
                    ),
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
