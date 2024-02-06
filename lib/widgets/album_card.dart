import 'package:flutter/material.dart';
import 'package:hactiv8_bithealth_flutter/models/album_model.dart';
import 'package:hactiv8_bithealth_flutter/screens/photo_overview_screen.dart';

class AlbumCardWidget extends StatelessWidget {
  final AlbumModel albumModel;
  const AlbumCardWidget({
    Key? key,
    required this.albumModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PhotoOverviewScreen(albumModel: albumModel)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  "${albumModel.userId.toString()}. ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              Expanded(
                flex: 9,
                child: Text(
                  albumModel.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
