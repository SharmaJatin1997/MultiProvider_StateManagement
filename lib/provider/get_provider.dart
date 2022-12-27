

import 'package:flutter/foundation.dart';
import 'package:using_provider/provider/auth_api_provider.dart';
import 'package:using_provider/screens/UserModel.dart';

class GetApiProvider with ChangeNotifier {
  List<UserModel?> supervisorInfo = [];
  AuthApiProvider authApiProvider = AuthApiProvider();
  bool isLoading=false;

  Future getSupervisorInfo() async {
    isLoading = true;
    notifyListeners();
    var model = UserModel();
    var response = await authApiProvider.supervisor(model);
    if (response.body != null) {
      isLoading = false;
      supervisorInfo = response.body!;
      notifyListeners();
    } else {
      if (kDebugMode) {
        print("Error");
      }
    }
  }
}
