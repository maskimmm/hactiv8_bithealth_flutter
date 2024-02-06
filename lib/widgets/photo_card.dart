import 'package:flutter/material.dart';
import 'package:hactiv8_bithealth_flutter/models/photo_model.dart';

class PhotoCardWidget extends StatelessWidget {
  final PhotoModel photoModel;
  const PhotoCardWidget({
    Key? key,
    required this.photoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      photoModel.url,
      fit: BoxFit.cover,
      height: 150,
      width: double.infinity,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: child,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Text(
                        photoModel.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
