export 'dart:io';
export 'package:dio/dio.dart';

import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';

import 'HttpHelper.dart';

class ApiService {
  static String ACCESS_TOKEN = '';
  static String USER_ID = '';
  static String USER_NAME = '';
  static String PIT_WALLET = '';

  static String BASE_URL = "http://oms.adlogistic.vn/";
  static final String API_VERSION = "api/";

  //đăng ký
  static Future<Response> register(String encryptString) {
    final action = "regis";
    final url = ApiService.BASE_URL + ApiService.API_VERSION + action;
    var params = Map<String, String>();
    params["data"] = encryptString;
    return HttpHelper.requestApi(url, params, HttpMethod.post, false, true);
  }

  //đăng nhập
  static Future<Response> login(String encryptString) {
    final action = "login";
    final url = ApiService.BASE_URL + ApiService.API_VERSION + action;
    var params = Map<String, String>();
    params["data"] = encryptString;
    return HttpHelper.requestApi(url, params, HttpMethod.post, false, true);
  }

  //lịch sử
  static Future<Response> histories(String encryptString) {
    final action = "wallet-histories";
    final url = ApiService.BASE_URL + ApiService.API_VERSION + action;
    var params = Map<String, String>();
    params["data"] = encryptString;
    return HttpHelper.requestApi(url, params, HttpMethod.post, false, true);
  }

  //lịch sử
  static Future<Response> balance(String encryptString) {
    final action = "wallet-balance";
    final url = ApiService.BASE_URL + ApiService.API_VERSION + action;
    var params = Map<String, String>();
    params["data"] = encryptString;
    return HttpHelper.requestApi(url, params, HttpMethod.post, false, true);
  }

  //lịch sử
  static Future<Response> countOder(String encryptString) {
    final action = "order-counts";
    final url = ApiService.BASE_URL + ApiService.API_VERSION + action;
    var params = Map<String, String>();
    params["data"] = encryptString;
    return HttpHelper.requestApi(url, params, HttpMethod.post, false, true);
  }

  //lịch sử
  static Future<Response> oderDetail(String encryptString) {
    final action = "order-detail";
    final url = ApiService.BASE_URL + ApiService.API_VERSION + action;
    var params = Map<String, String>();
    params["data"] = encryptString;
    return HttpHelper.requestApi(url, params, HttpMethod.post, false, true);
  }

  //lịch sử
  static Future<Response> oderList(String encryptString) {
    final action = "order-list";
    final url = ApiService.BASE_URL + ApiService.API_VERSION + action;
    var params = Map<String, String>();
    params["data"] = encryptString;
    return HttpHelper.requestApi(url, params, HttpMethod.post, false, true);
  }

  //thêm đơn hàng
  static Future<Response> checkout(String encryptString) {
    final action = "order-checkout";
    final url = ApiService.BASE_URL + ApiService.API_VERSION + action;
    var params = Map<String, String>();
    params["data"] = encryptString;
    return HttpHelper.requestApi(url, params, HttpMethod.post, false, true);
  }
  //thêm đơn hàng
  static Future<Response> systemConfig(String encryptString) {
    final action = "system-config";
    final url = ApiService.BASE_URL + ApiService.API_VERSION + action;
    var params = Map<String, String>();
    params["data"] = encryptString;
    return HttpHelper.requestApi(url, params, HttpMethod.get, false, true);
  }
}
