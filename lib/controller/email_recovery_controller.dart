import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/api/api_routes.dart';
import 'package:hola/controller/phone_no_controller.dart';
import 'package:hola/repository/profile_repository.dart';

class EmailRecover extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  PhoneNoController ctrl = Get.put(PhoneNoController());
  Future<void> addEmailAddress() async {
    try {
      var response = await API.userDetailsApi({
        "mobile_number": ctrl.mobileNo.text.trim(),
        "email ": email.text.toString(),
      });

      if (response.statusCode == 200) {
        print(response.data);
        print("Email Address added successfully");
        pageController.nextPage(
            duration: Duration(milliseconds: 100), curve: Curves.easeInSine);
      }
    } catch (e) {
      print(e);
      print("Error occured ,try again");
    }
  }
}
