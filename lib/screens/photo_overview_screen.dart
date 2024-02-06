import 'package:flutter/material.dart';
import 'package:hactiv8_bithealth_flutter/models/album_model.dart';
import 'package:hactiv8_bithealth_flutter/providers/photo_provider.dart';
import 'package:hactiv8_bithealth_flutter/widgets/photo_card.dart';
import 'package:provider/provider.dart';

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
        title: const Text("Posts JSON Placeholder"),
      ),
      body: FutureBuilder(
          future: Provider.of<PhotoProvider>(context, listen: false)
              .fetchPhotoDatas(id: widget.albumModel.id),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Consumer<PhotoProvider>(
                builder: (ctx, photoProvider, ch) {
                  final photoDatas = photoProvider.photoDatas;
                  return ListView(
                    children: photoDatas
                        .map((data) => PhotoCardWidget(photoModel: data))
                        .toList(),
                  );
                },
              );
            }
          }),
    );
  }
}
