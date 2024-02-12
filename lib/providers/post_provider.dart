import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../utils/enums/provider_state.dart';
import '../services/api_service.dart';

class PostProvider with ChangeNotifier {
  List<PostModel> _postDatas = <PostModel>[];
  ProviderState _state = ProviderState.initState;

  List<PostModel> get postDatas {
    return [..._postDatas];
  }

  ProviderState get state {
    return _state;
  }

  Future<void> fetchPostDatas() async {
    _postDatas = await APIService.shared.fetchPostDatas();
    _state = ProviderState.completedState;
    notifyListeners();
  }
}
