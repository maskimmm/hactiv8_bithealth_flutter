import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../utils/enums/provider_state.dart';
import '../widgets/user_card.dart';

class UserOverviewScreen extends StatefulWidget {
  const UserOverviewScreen({super.key});

  @override
  State<UserOverviewScreen> createState() => _UserOverviewScreenState();
}

class _UserOverviewScreenState extends State<UserOverviewScreen> {
  bool _init = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_init) {
      Provider.of<UserProvider>(context)
          .fetchUserDatas()
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
          title: const Text("User JSON Placeholder"),
        ),
        body: Consumer<UserProvider>(
          builder: (ctx, userProvider, ch) {
            switch (userProvider.state) {
              case ProviderState.initState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ProviderState.completedState:
                if (userProvider.userDatas.isEmpty) {
                  return const Center(
                    child: Text("No Data Available"),
                  );
                } else {
                  return ListView(
                    children: userProvider.userDatas
                        .map((data) => UserCardWidget(userModel: data))
                        .toList(),
                  );
                }
            }
          },
        ));
  }
}
