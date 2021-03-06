import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hola/app_config/app_colors.dart';

final kInterText = GoogleFonts.inter(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.normal,
);

Widget button({
  String buttonTxt,
  VoidCallback onTap,
  Color buttonColor,
  Color txtColor,
  double txtSize,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Text(
          buttonTxt,
          style: kInterText.copyWith(
            fontSize: txtSize,
            color: txtColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}

Widget flatButton({
  dynamic buttonTxt,
  VoidCallback onTap,
  Color buttonColor,
  Color txtColor,
  double txtSize,
  EdgeInsetsGeometry padding,
  EdgeInsetsGeometry margin,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: margin,
      alignment: Alignment.center,
      child: Padding(
        padding: padding,
        child: Text(
          buttonTxt,
          style: kInterText.copyWith(
            fontSize: txtSize,
            color: txtColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}

Widget smallButton({
  String buttonTxt,
  VoidCallback onTap,
  Color buttonColor,
  Color txtColor,
  EdgeInsetsGeometry padding,
  EdgeInsetsGeometry margin,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      margin: margin,
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      child: Padding(
        padding: padding,
        child: Text(
          buttonTxt,
          maxLines: 1,
          style: kInterText.copyWith(
            fontSize: 15,
            color: txtColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}

Widget messageBox({
  String message,
  Color buttonColor,
  Color txtColor,
  BorderRadiusGeometry borderRadius,
  EdgeInsetsGeometry padding,
  EdgeInsetsGeometry margin,
}) {
  return Expanded(
    child: AnimatedContainer(
      margin: margin,
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      child: Padding(
        padding: padding,
        child: Text(
          message,
          overflow: TextOverflow.clip,
          maxLines: 100,
          softWrap: true,
          style: kInterText.copyWith(
            fontSize: 15,
            color: txtColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: borderRadius,
      ),
    ),
  );
}

Widget editProfileButton({
  String buttonTxt,
  VoidCallback onTap,
  Color buttonColor,
  Color txtColor,
  EdgeInsetsGeometry padding,
}) {
  return GestureDetector(
    onTap: onTap,
    child: FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        child: Padding(
          padding: padding,
          child: Row(
            children: [
              Image(
                  height: 17,
                  width: 17,
                  image: AssetImage("assets/images/edit_prof.png")),
              SizedBox(
                width: 5,
              ),
              Text(
                buttonTxt,
                maxLines: 1,
                style: kInterText.copyWith(
                  fontSize: 11,
                  color: txtColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}

Widget editProfileTile(String leadingText, String trailingText) {
  return ListTile(
    leading: Text(
      leadingText,
      style: kInterText.copyWith(
        fontSize: 18,
        color: AppColors.kd1d1d1.withOpacity(0.9),
        fontWeight: FontWeight.w600,
      ),
    ),
    trailing: Text(
      trailingText,
      style: kInterText.copyWith(
        fontSize: 18,
        color: AppColors.k000000.withOpacity(0.9),
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget editProfileRow(String leadingText, String trailingText,
    BuildContext context, TextInputType inputType, String prefixText) {
  return Padding(
    padding: const EdgeInsets.only(left: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingText,
          style: kInterText.copyWith(
            fontSize: 18,
            color: AppColors.kd1d1d1.withOpacity(0.9),
            fontWeight: FontWeight.w600,
          ),
        ),
        /*SizedBox(
          width: 100,
        ),*/
        Container(
          width: MediaQuery.of(context).size.width / 1.5,
          child: TextFormField(
            style: kInterText.copyWith(
              fontSize: 18,
              color: AppColors.k000000.withOpacity(0.9),
              fontWeight: FontWeight.w600,
            ),
            keyboardType: inputType,
            textAlign: TextAlign.start,
            cursorColor: AppColors.kff4165,
            decoration: InputDecoration(
              prefixText: prefixText,
              hintText: trailingText,
              hintStyle: kInterText.copyWith(
                fontSize: 18,
                color: AppColors.k000000.withOpacity(0.9),
                fontWeight: FontWeight.w600,
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
        )
      ],
    ),
  );
}
