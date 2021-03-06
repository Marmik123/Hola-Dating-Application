import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:get/get.dart';
import 'package:hola/api/api_routes.dart';
import 'package:hola/controller/phone_no_controller.dart';
import 'package:hola/repository/profile_repository.dart';

class DetailsController extends GetxController {
  PhoneNoController ctrl = Get.find();
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  DateTime date;
  DateTime month;
  DateTime year;
  RxInt gender = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedDate = null;
  }

  //Function for Date Picker for birthday
  Future selectDate(BuildContext context) async {
    final DateTime pickedDate = await showRoundedDatePicker(
        height: MediaQuery.of(context).size.height / 3,
        context: context,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        initialDate: DateTime(DateTime.now().year - 18),
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year - 18));
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      update();
    }
  }

  Future<void> addUserDetails() async {
    try {
      var response = await API.userDetailsApi({
        "mobile_number": ctrl.mobileNo.text.trim(),
        "gender": gender() == 0 ? "Male" : "Female",
        "date_of_birth":
            "${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}",
        "name": name.text.trim(),
      });

      if (response.statusCode == 200) {
        print(response.data);
        print("User Details added successfully");
        pageController.nextPage(
            duration: Duration(milliseconds: 100), curve: Curves.easeInSine);
      }
    } catch (e) {
      print(e);
    }
  }
}
