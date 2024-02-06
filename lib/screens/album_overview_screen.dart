import 'package:flutter/material.dart';
import 'package:hactiv8_bithealth_flutter/providers/album_provider.dart';
import 'package:hactiv8_bithealth_flutter/widgets/album_card.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder(
          future: Provider.of<AlbumProvider>(context, listen: false)
              .fetchAlbumDatas(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Consumer<AlbumProvider>(
                builder: (ctx, albumProvider, ch) {
                  final albumDatas = albumProvider.albumDatas;
                  return ListView(
                    children: albumDatas
                        .map((data) => AlbumCardWidget(albumModel: data))
                        .toList(),
                  );
                },
              );
            }
          }),
    );
  }
}
