import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/album_provider.dart';
import '../utils/enums/provider_state.dart';
import '../widgets/album_card.dart';

class AlbumOverviewScreen extends StatefulWidget {
  const AlbumOverviewScreen({super.key});

  @override
  State<AlbumOverviewScreen> createState() => _AlbumOverviewScreenState();
}

class _AlbumOverviewScreenState extends State<AlbumOverviewScreen> {
  bool _init = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_init) {
      Provider.of<AlbumProvider>(context)
          .fetchAlbumDatas()
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
        title: const Text("Album JSON Placeholder"),
      ),
      body: Consumer<AlbumProvider>(
        builder: (ctx, albumProvider, ch) {
          switch (albumProvider.state) {
            case ProviderState.initState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ProviderState.completedState:
              if (albumProvider.albumDatas.isEmpty) {
                return const Center(
                  child: Text("No Data Available"),
                );
              } else {
                return ListView(
                  children: albumProvider.albumDatas
                      .map((data) => AlbumCardWidget(albumModel: data))
                      .toList(),
                );
              }
            default:
              return Container();
          }
        },
      ),
    );
  }
}
