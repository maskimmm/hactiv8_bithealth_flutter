import 'package:flutter/material.dart';

import '../models/album_model.dart';
import '../utils/enums/provider_state.dart';
import '../services/api_service.dart';

class AlbumProvider with ChangeNotifier {
  List<AlbumModel> _albumDatas = <AlbumModel>[];
  ProviderState _state = ProviderState.initState;

  List<AlbumModel> get albumDatas {
    return [..._albumDatas];
  }

  ProviderState get state {
    return _state;
  }

  Future<void> fetchAlbumDatas() async {
    _albumDatas = await APIService.shared.fetchAlbumDatas();
    _state = ProviderState.completedState;
    notifyListeners();
  }
}
