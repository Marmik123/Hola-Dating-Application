import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/otp_controller.dart';
import 'package:hola/controller/phone_no_controller.dart';
import 'package:hola/view/widgets/circular_loader.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatelessWidget {
  OtpController otpCtrl = Get.put(OtpController());
  PhoneNoController phoneCtrl = Get.put(PhoneNoController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: AppColors.kf6f6f6,
          body: Form(
            key: otpCtrl.formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 80, right: 30),
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: [
                  Text(
                    "Enter Your Code",
                    style: kInterText.copyWith(
                      color: AppColors.kff4165,
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 130,
                  ),
                  PinCodeTextField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter Otp";
                      } else if (value.length < 6) {
                        return "Enter valid Otp";
                      } else
                        return null;
                    },
                    controller: otpCtrl.otpController,
                    autoFocus: true,
                    showCursor: true,
                    backgroundColor: AppColors.kf6f6f6,
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Color(0xFF0CBCC5),
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: false,
                    obscuringCharacter: '*',
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      borderWidth: 2,
                      disabledColor: AppColors.kffffff,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(15),
                      inactiveColor: AppColors.kffffff,
                      inactiveFillColor: AppColors.kffffff,
                      activeColor: AppColors.kff4165,
                      activeFillColor: AppColors.kff4165,
                      selectedColor: AppColors.kff4165,
                      selectedFillColor: otpCtrl.otpFocus.hasFocus ?? false
                          ? AppColors.kCBCBCB
                          : AppColors.kffffff,
                    ),
                    cursorColor: AppColors.kFD4266,
                    boxShadows: [
                      BoxShadow(
                        color: AppColors.kboxshadow.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 60,
                        offset: Offset(0, 30),
                      )
                    ],
                    animationDuration: Duration(milliseconds: 300),
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: AppColors.kffffff,
                    ),
                    focusNode: otpCtrl.otpFocus,
                    enableActiveFill: true,
                    /*errorAnimationController: errorController,
                  controller: otpController,*/
                    keyboardType: TextInputType.number,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onTap: () {
                      print("Pressed");
                    },
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  SizedBox(
                    child: otpCtrl.isLoading.value
                        ? Center(
                            child: buildLoader(),
                          )
                        : flatButton(
                            buttonTxt: "Continue",
                            txtSize: 17,
                            buttonColor: AppColors.kff4165,
                            txtColor: AppColors.kffffff,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 100),
                            onTap: () {
                              if (otpCtrl.formKey.currentState.validate()) {
                                otpCtrl.verifyPhoneManually();
                              }
                            }),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Terms of Service",
                        style: kInterText.copyWith(
                          color: AppColors.k323232,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Privacy Policy",
                        style: kInterText.copyWith(
                          color: AppColors.k323232,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
