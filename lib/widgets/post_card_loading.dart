import 'package:flutter/material.dart';
import 'package:hactiv8_bithealth_flutter/sampleDatas/dummy_post_datas.dart';
import 'package:shimmer/shimmer.dart';

class PostCardLoading extends StatelessWidget {
  const PostCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Shimmer.fromColors(
                baseColor: Colors.black.withOpacity(0.4),
                highlightColor: Colors.white.withOpacity(0.7),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    dummyPostDatas.first.userId.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Shimmer.fromColors(
                    baseColor: Colors.black.withOpacity(0.4),
                    highlightColor: Colors.white.withOpacity(0.7),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: const Text(
                        "Placeholder",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.black.withOpacity(0.4),
                    highlightColor: Colors.white.withOpacity(0.7),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: const Text(
                        "Placeholder",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.black.withOpacity(0.4),
                    highlightColor: Colors.white.withOpacity(0.7),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: const Text(
                        "Placeholder",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
