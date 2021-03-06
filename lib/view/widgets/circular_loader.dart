import 'package:flutter/material.dart';
import 'package:hola/app_config/app_colors.dart';

buildLoader({Color color = AppColors.kff4165}) {
  return CircularProgressIndicator(
    strokeWidth: 1,
    valueColor: AlwaysStoppedAnimation<Color>(color),
    backgroundColor: AppColors.kD8D8D8,
  );
}
