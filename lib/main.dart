import 'package:flutter/material.dart';
import 'package:hactiv8_bithealth_flutter/providers/album_provider.dart';
import 'package:hactiv8_bithealth_flutter/providers/photo_provider.dart';
import 'package:hactiv8_bithealth_flutter/providers/post_provider.dart';
import 'package:hactiv8_bithealth_flutter/providers/user_provider.dart';
import 'package:hactiv8_bithealth_flutter/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AlbumProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PhotoProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xffEF6137),
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
