import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:using_provider/provider/auth_api_provider.dart';
import 'package:using_provider/screens/UserModel.dart';
import 'package:using_provider/shared/data_response.dart';
import 'package:using_provider/shared/error_model.dart';

class PostApiProvider with ChangeNotifier {
  AuthApiProvider authApiProvider = AuthApiProvider();
  bool isUserLogin = false;
  bool isLoading=false;

  Future loginApi() async {
    isLoading = true;
    notifyListeners();
    var response = await authApiProvider.signIn(UserModel(
        email: "maqsood@yopmail.com",
        password: "123456789",
        deviceType: "1",
        deviceToken: "123456"));
    if (response is ErrorModel) {
      if (response.code == 202) {
        isLoading = false;
        isUserLogin = true;
        notifyListeners();
      } else {
        isUserLogin = false;
        notifyListeners();
      }
    } else {
      var dataResponse = response as DataResponse;
      if (dataResponse.status == true) {
        var userModel = dataResponse.body as UserModel;
        isLoading = false;
        isUserLogin = true;
        notifyListeners();
      }
    }
  }
}
