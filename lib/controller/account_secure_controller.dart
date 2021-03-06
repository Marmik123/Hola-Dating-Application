import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/api/api_routes.dart';
import 'package:hola/controller/phone_no_controller.dart';
import 'package:hola/view/after_login_screens/account_created.dart';

class AccountSecureController extends GetxController {
  PhoneNoController ctrl = Get.put(PhoneNoController());
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool hidePassword = false.obs;

  Future<void> addUsernamePass() async {
    try {
      var response = await API.userDetailsApi({
        "mobile_number": ctrl.mobileNo.text.trim(),
        "username ": username.text.trim(),
        "password ": password.text.trim(),
      });

      if (response.statusCode == 200) {
        print(response.data);
        print("Username and password added successfully");
        Get.to(AccountCreated());
      }
    } catch (e) {
      print(e);
      print("Error occured ,try again");
    }
  }
}
