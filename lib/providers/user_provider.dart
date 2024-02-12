import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../utils/enums/provider_state.dart';
import '../services/api_service.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> _userDatas = <UserModel>[];
  ProviderState _state = ProviderState.initState;

  List<UserModel> get userDatas {
    return [..._userDatas];
  }

  ProviderState get state {
    return _state;
  }

  Future<void> fetchUserDatas() async {
    _userDatas = await APIService.shared.fetchUserDatas();
    _state = ProviderState.completedState;
    notifyListeners();
  }
}
