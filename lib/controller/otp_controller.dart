import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/controller/phone_no_controller.dart';
import 'package:hola/view/main_screen.dart';
import 'package:hola/view/profile.dart';

class OtpController extends GetxController {
  String verificationId;
  FocusNode otpFocus = FocusNode();
  String otpValue = "";
  RxBool isLoading = false.obs;
  String token;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  PhoneNoController phoneCtrl = Get.put(PhoneNoController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    registerUser();
    isLoading.value = true;
    token = await phoneCtrl.checkUserAvailability();
  }

  // Firebase function for registeration and user login
  Future registerUser() async {
    print("Register user called");
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber:
            "+${phoneCtrl.countryCode.phoneCode}" + phoneCtrl.mobileNo.text,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          isLoading.value = false;
          print("Verification Successful");
          UserCredential result = await _auth.signInWithCredential(credential);
          User user = result.user;
          if (user != null && token == 'registered') {
            print("User is already registered");
            Get.offAll(MainScreen());
          } else if (user != null && token == 'newuser') {
            print("New user registered");
            Get.to(ProfileScreen());
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Verification Failed Auth Exception");
          Get.snackbar(
            "Firebase Exception",
            e.message,
            backgroundColor: AppColors.kffffff,
            duration: Duration(seconds: 4),
            colorText: AppColors.kff4165,
          );
          phoneCtrl.isLoading.value = false;

          print(e.message);
        },
        codeSent: (String verificationId, int code) async {
          isLoading.value = false;
          print("code sent $verificationId $code");
          this.verificationId = verificationId;
          print("Code is sent");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          isLoading.value = false;
          Get.snackbar(
            "Enter Otp Manually",
            "Automatic Otp verification failed",
            backgroundColor: AppColors.kffffff,
            duration: Duration(seconds: 2),
            colorText: AppColors.kff4165,
          );
          print("Timeout");
          print(verificationId);
        },
      );
    } catch (e) {
      print("Verfication Failed");
    }
  }

//Function to verify manually and verify added otp if not automatically verified
  verifyPhoneManually() {
    phoneCtrl.isLoading.value = false;
    print("verify phone manually");
    AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpController.text,
    );

    _auth.signInWithCredential(credential).then((value) {
      print("Result is $value");
      if (value != null && token == 'registered') {
        print("User already registered");
        Get.offAll(MainScreen());
        print("login successful");
      } else if (value != null && token == 'newuser') {
        print("New user");
        Get.to(ProfileScreen());
      } else {
        otpController.clear();
        //errorController.add(ErrorAnimationType.shake);
      }
    });
  }

  /*displaySnackBar(FirebaseAuthException exception) {
    final snackBar = SnackBar(
      backgroundColor: AppColors.kffffff,
      content: Text(exception.message,
          style: kInterText.copyWith(
            color: AppColors.kff4165,
            fontSize: 15,
          )),

      elevation: 2,
      behavior: SnackBarBehavior.floating,
    );

    return snackBar;
  }
*/

}
