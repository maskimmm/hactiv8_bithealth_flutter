import 'package:flutter/material.dart';

import '../models/photo_model.dart';
import '../utils/enums/provider_state.dart';
import '../services/api_service.dart';

class PhotoProvider with ChangeNotifier {
  List<PhotoModel> _photoDatas = <PhotoModel>[];
  ProviderState state = ProviderState.initState;

  List<PhotoModel> get photoDatas {
    return [..._photoDatas];
  }

  Future<void> fetchPhotoDatas({required int id}) async {
    _photoDatas = await APIService.shared.fetchPhotoDatas(id: id);
    state = ProviderState.completedState;
    notifyListeners();
  }
}
