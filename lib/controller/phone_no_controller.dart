import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/api/api_routes.dart';
import 'package:hola/model/user.dart';
import 'package:hola/repository/user_repository.dart';

class PhoneNoController extends GetxController {
  TextEditingController mobileNo = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String verificationId;
  Country countryCode;
  RxBool isLoading = false.obs;

  Future<String> checkUserAvailability() async {
    try {
      var response = await API.checkUserApi({
        "mobile_number": mobileNo.text.trim(),
      });

      if (response.statusCode == 200) {
        print("Check User availability response");
        print(response.data);
        print(response.data['data'].runtimeType);
        if (response.data['data'].runtimeType == bool) {
          print('returned new user');
          return 'newuser';
        } else if (response.data['data']['token'] != null) {
          setUserData(User.fromMap(response.data['data']['user']),
              response.data['data']['token']);
          print("returned registered");
          return 'registered';
        }
      }
    } catch (e) {
      print(e);
      print("Error occured ,try again");
    }
  }

  Future<void> registerUserMobile() async {
    try {
      var response = await API.registerUserMobileApi({
        "mobile_number": mobileNo.text.trim(),
      });

      if (response.statusCode == 200) {
        print(response.data);
        print("User register successfully");
      }
    } catch (e) {
      print(e);
      print("Error occured while registering user");
    }
  }

  Widget buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}"),
          ],
        ),
      );
}
