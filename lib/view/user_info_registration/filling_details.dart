import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/filling_detials_controller.dart';
import 'package:hola/controller/phone_no_controller.dart';

class Details extends StatelessWidget {
  DetailsController detailCtrl = Get.put(DetailsController());
  PhoneNoController ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kf6f6f6,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          physics: ClampingScrollPhysics(),
          child: Form(
            key: detailCtrl.formKey,
            child: Column(
              children: [
                Text(
                  "Identify Yourself",
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
                  "Introduce yourself fill out the details so people know about you.",
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
                    Text(
                      "I am a",
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
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: smallButton(
                              buttonTxt: "Male",
                              txtColor: detailCtrl.gender() == 0
                                  ? AppColors.kffffff
                                  : AppColors.k000000,
                              buttonColor: detailCtrl.gender() == 0
                                  ? AppColors.kff4165
                                  : AppColors.kffffff,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 50),
                              onTap: () {
                                detailCtrl.gender(0);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            child: smallButton(
                              buttonTxt: "Female",
                              txtColor: detailCtrl.gender() == 1
                                  ? AppColors.kffffff
                                  : AppColors.k000000,
                              buttonColor: detailCtrl.gender() == 1
                                  ? AppColors.kff4165
                                  : AppColors.kffffff,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              onTap: () {
                                detailCtrl.gender(1);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Birthday",
                      style: kInterText.copyWith(
                        color: AppColors.kff4165,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    GetBuilder(
                      init: DetailsController(),
                      builder: (value) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: smallButton(
                              buttonTxt: detailCtrl.selectedDate != null
                                  ? "${detailCtrl.selectedDate.month}"
                                  : "MM",
                              txtColor: AppColors.k000000,
                              buttonColor: AppColors.kffffff,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 21),
                              onTap: () {
                                detailCtrl.selectDate(Get.context);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            child: smallButton(
                              buttonTxt: detailCtrl.selectedDate != null
                                  ? "${detailCtrl.selectedDate.day}"
                                  : "DD",
                              txtColor: AppColors.k000000,
                              buttonColor: AppColors.kffffff,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 31),
                              onTap: () {
                                detailCtrl.selectDate(Get.context);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            child: smallButton(
                              buttonTxt: detailCtrl.selectedDate != null
                                  ? "${detailCtrl.selectedDate.year}"
                                  : "YYYY",
                              txtColor: AppColors.k000000,
                              buttonColor: AppColors.kffffff,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 21),
                              onTap: () {
                                detailCtrl.selectDate(Get.context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Name",
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
                      controller: detailCtrl.name,
                      cursorColor: AppColors.kff4165,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.start,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter name";
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        errorBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Add your name here",
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
                      height: 40,
                    ),
                    flatButton(
                        buttonTxt: "Continue",
                        txtSize: 17,
                        buttonColor: AppColors.kff4165,
                        txtColor: AppColors.kffffff,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 72, vertical: 20),
                        onTap: () {
                          if (detailCtrl.gender.value == null) {
                            Get.snackbar(
                              'Error',
                              'Please select a gender and birthday',
                              colorText: AppColors.kff4165,
                              backgroundColor: AppColors.kffffff,
                              duration: Duration(seconds: 3),
                            );
                          } else if (detailCtrl.formKey.currentState
                                  .validate() &&
                              detailCtrl.gender != null) {
                            detailCtrl.addUserDetails();
                          }
                        })
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
