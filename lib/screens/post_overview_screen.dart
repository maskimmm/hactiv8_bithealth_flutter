import 'package:flutter/material.dart';
import 'package:hactiv8_bithealth_flutter/widgets/post_card_loading.dart';
import 'package:provider/provider.dart';

import '../providers/post_provider.dart';
import '../utils/enums/provider_state.dart';
import '../widgets/post_card.dart';

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
      body: Consumer<PostProvider>(
        builder: (ctx, postProvider, ch) {
          switch (postProvider.state) {
            case ProviderState.initState:
              return ListView(
                children: const <Widget>[
                  PostCardLoading(),
                  PostCardLoading(),
                  PostCardLoading(),
                ],
              );
            case ProviderState.completedState:
              if (postProvider.postDatas.isEmpty) {
                return const Center(
                  child: Text("No Data Available"),
                );
              } else {
                return ListView(
                  children: postProvider.postDatas
                      .map((data) => PostCardWidget(postModel: data))
                      .toList(),
                );
              }
          }
        },
      ),
    );
  }
}
