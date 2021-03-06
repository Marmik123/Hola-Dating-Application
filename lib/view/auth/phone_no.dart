import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/phone_no_controller.dart';
import 'package:hola/view/auth/otp_verification.dart';

class PhoneNo extends StatelessWidget {
  PhoneNoController ctrl = Get.put(PhoneNoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: ctrl.formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
        child: Column(
          children: [
            Text(
              "What\’s your number?",
              style: kInterText.copyWith(
                color: AppColors.kff4165,
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Please enter your valid phone number \. We will send you 4-digit code to verify your account.",
              style: kInterText.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: AppColors.k000000,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: CountryPickerDropdown(
                        sortComparator: (Country b, Country a) =>
                            a.phoneCode.compareTo(b.phoneCode),
                        iconDisabledColor: AppColors.kD8D8D8,
                        dropdownColor: AppColors.kf1f1f1,
                        underline: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 25, bottom: 0),
                              color: AppColors.kff4165,
                              height: 1.8,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ],
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.kff4165,
                        ),
                        itemBuilder: ctrl.buildDropdownItem,
                        onValuePicked: (Country country) {
                          ctrl.countryCode = country;
                        },
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 13,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: TextFormField(
                        style: kInterText.copyWith(
                          color: AppColors.k000000,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        keyboardType: TextInputType.number,
                        controller: ctrl.mobileNo,
                        validator: (value) {
                          if (!GetUtils.isPhoneNumber(value)) {
                            return "Please enter a valid mobile number";
                          } else if (value.length != 10) {
                            return "Please enter a valid number";
                          } else
                            return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter a Phone Number",
                          hintStyle: kInterText.copyWith(
                            color: AppColors.k000000.withOpacity(0.2),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.kff4165,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            flatButton(
                buttonTxt: "Continue",
                txtSize: 17,
                buttonColor: AppColors.kff4165,
                txtColor: AppColors.kffffff,
                padding:
                    const EdgeInsets.symmetric(horizontal: 72, vertical: 20),
                onTap: () {
                  if (ctrl.formKey.currentState.validate()) {
                    ctrl.isLoading.value = true;
                    ctrl.registerUserMobile();
                    Get.back();
                    Get.to(OtpVerification());
                  }
                })
          ],
        ),
      ),
    ));
  }
}
/*
TextFormField(
style: kInterText.copyWith(
color: AppColors.k000000,
fontSize: 18,
fontWeight: FontWeight.w600,
),
controller: ctrl.countryCodeController,
keyboardType: TextInputType.number,
decoration: InputDecoration(
hintStyle: kInterText.copyWith(
color: AppColors.k000000,
fontSize: 18,
fontWeight: FontWeight.w600,
),
suffixIcon: Icon(
Icons.arrow_drop_down_outlined,
color: AppColors.kCBCBCB,
),
focusedBorder: UnderlineInputBorder(
borderSide: BorderSide(
color: AppColors.kff4165,
width: 2,
),
),
),
textAlign: TextAlign.center,
readOnly: true,
)*/
