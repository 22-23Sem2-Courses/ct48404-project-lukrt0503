import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_grocery/service/local_service/local_auth_service.dart';
import 'package:my_grocery/service/remote_service/remote_auth_service.dart';

import '../model/user.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> user = Rxn<User>();
  final LocalAuthService _localAuthService = LocalAuthService();

  @override
  void onInit() async {
    await _localAuthService.init();
    super.onInit();
  }

  void signUp(
      {required String fullName,
      required String email,
      required String password}) async {
    try {
      EasyLoading.show(
        status: 'Đang tải...',
        dismissOnTap: false,
      );
      var result = await RemoteAuthService().signUp(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await RemoteAuthService()
            .createProfile(fullName: fullName, token: token);
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          await _localAuthService.addToken(token: token);
          await _localAuthService.addUser(user: user.value!);
          EasyLoading.showSuccess("Chào mừng bạn!");
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError('Có lỗi. Thử lại!');
        }
      } else {
        EasyLoading.showError('Có lỗi. Thử lại!');
      }
    } catch (e) {
      EasyLoading.showError('Có lỗi. Thử lại!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Đang tải...',
        dismissOnTap: false,
      );
      var result = await RemoteAuthService().signIn(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await RemoteAuthService().getProfile(token: token);
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          await _localAuthService.addToken(token: token);
          await _localAuthService.addUser(user: user.value!);
          EasyLoading.showSuccess("Chào mừng bạn");
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError('Có lỗi. Thử lại!');
        }
      } else {
        EasyLoading.showError('Tên người dùng/mật khẩu sai');
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Có lỗi. Thử lại!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    user.value = null;
    await _localAuthService.clear();
  }
}
