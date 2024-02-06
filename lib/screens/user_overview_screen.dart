import 'package:flutter/material.dart';
import 'package:hactiv8_bithealth_flutter/providers/user_provider.dart';
import 'package:hactiv8_bithealth_flutter/widgets/user_card.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder(
          future: Provider.of<UserProvider>(context, listen: false)
              .fetchUserDatas(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Consumer<UserProvider>(
                builder: (ctx, userProvider, ch) {
                  final userDatas = userProvider.userDatas;
                  return ListView(
                    children: userDatas
                        .map((data) => UserCardWidget(userModel: data))
                        .toList(),
                  );
                },
              );
            }
          }),
    );
  }
}
