import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/album_model.dart';
import '../providers/photo_provider.dart';
import '../utils/enums/provider_state.dart';
import '../widgets/photo_card.dart';

class PhotoOverviewScreen extends StatefulWidget {
  final AlbumModel albumModel;

  const PhotoOverviewScreen({
    Key? key,
    required this.albumModel,
  }) : super(key: key);

  @override
  State<PhotoOverviewScreen> createState() => _PhotoOverviewScreenState();
}

class _PhotoOverviewScreenState extends State<PhotoOverviewScreen> {
  bool _init = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_init) {
      Provider.of<PhotoProvider>(context).state = ProviderState.initState;
      Provider.of<PhotoProvider>(context)
          .fetchPhotoDatas(id: widget.albumModel.id)
          .then((_) {})
          .catchError((_) {})
          .whenComplete(() {
        _init = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.albumModel.id}. Photo JSON Placeholder"),
      ),
      body: Consumer<PhotoProvider>(
        builder: (ctx, photoProvider, ch) {
          switch (photoProvider.state) {
            case ProviderState.initState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ProviderState.completedState:
              if (photoProvider.photoDatas.isEmpty) {
                return const Center(
                  child: Text("No Data Available"),
                );
              } else {
                return ListView(
                  children: photoProvider.photoDatas
                      .map((data) => PhotoCardWidget(photoModel: data))
                      .toList(),
                );
              }
          }
        },
      ),
    );
  }
}
