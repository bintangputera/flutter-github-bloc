import 'package:flutter/material.dart';
import 'package:github_bloc/config/themes.dart';
import 'package:github_bloc/modules/home/home_screen.dart';
import 'package:github_bloc/modules/splash/splash_screen.dart';
import 'package:github_bloc/modules/user_detail/user_detail_screen.dart';
import 'package:github_bloc/modules/webview/web_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: AppTheme.primaryFontFamily,
        primarySwatch: AppTheme.primaryColor,
      ),
      home: const HomeScreen(),
      routes: {
        UserDetailScreen.routeName: (context) => UserDetailScreen(ModalRoute.of(context)!.settings.arguments as String ),
        WebViewScreen.routeName : (context) => WebViewScreen(ModalRoute.of(context)!.settings.arguments as String)
      },
    );
  }
}

