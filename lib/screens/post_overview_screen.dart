import 'package:flutter/material.dart';
import 'package:hactiv8_bithealth_flutter/providers/post_provider.dart';
import 'package:hactiv8_bithealth_flutter/widgets/post_card.dart';
import 'package:provider/provider.dart';

class PostOverviewScreen extends StatefulWidget {
  const PostOverviewScreen({super.key});

  @override
  State<PostOverviewScreen> createState() => _PostOverviewScreenState();
}

class _PostOverviewScreenState extends State<PostOverviewScreen> {
  bool _init = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_init) {
      Provider.of<PostProvider>(context)
          .fetchPostDatas()
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
          future: Provider.of<PostProvider>(context, listen: false)
              .fetchPostDatas(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Consumer<PostProvider>(
                builder: (ctx, postProvider, ch) {
                  final postDatas = postProvider.postDatas;
                  return ListView(
                    children: postDatas
                        .map((data) => PostCardWidget(postModel: data))
                        .toList(),
                  );
                },
              );
            }
          }),
    );
  }
}
