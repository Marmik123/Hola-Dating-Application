import 'dart:core';

import 'package:dio/dio.dart';
import 'package:hola/api/http_service.dart';

class API {
  static HttpService _httpService = HttpService.getInstance();

  //BASE URL
  static String baseUrl = "https://hola.api.dharmatech.in/api/v1/front/auth";
  static String uploadUrl = "https://hola.api.dharmatech.in";

  //ROUTES
  static String registerMobile = baseUrl + "/add-user-mobile-number";
  static String uploadProfilePicture = baseUrl + "/upload-user-profile-picture";
  static String uploadProfilePic = uploadUrl + "/upload/user/image";
  static String userDetails = baseUrl + "/add-user-details";
  /*static String addEmail = baseUrl + "/add-user-details";
  static String addUsername = baseUrl + "/add-user-details";*/
  static String checkUserAvailability =
      baseUrl + "/check-mobile-number-availability";
  static String pagesUrl =
      "https://hola.api.dharmatech.in/api/v1/front/static_pages/static-page-details-from-slug";
  static Future<Response> registerUserMobileApi(Map<String, dynamic> args) {
    return _httpService.post(registerMobile, args);
  }

  static Future<Response> uploadProfilePictureApi(FormData args) {
    return _httpService.postProfilePic(uploadProfilePicture, args);
  }

  static Future<Response> getFileName(FormData args) {
    return _httpService.postProfilePic(uploadProfilePic, args);
  }

  static Future<Response> userDetailsApi(Map<String, dynamic> args) {
    return _httpService.post(userDetails, args);
  }

  static Future<Response> checkUserApi(Map<String, dynamic> args) {
    return _httpService.post(checkUserAvailability, args);
  }

  static Future<Response> getStaticPages(Map<String, dynamic> args) {
    return _httpService.post(pagesUrl, args);
  }
}
