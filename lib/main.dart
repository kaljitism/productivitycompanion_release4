import 'package:flutter/material.dart';
import 'package:productivitycompanion/provider/homepageProvider.dart';
import 'package:productivitycompanion/screens/homepage.dart';
import 'package:productivitycompanion/screens/settings.dart';
import 'package:productivitycompanion/utils/appbuilder.dart';
import 'package:productivitycompanion/utils/colors.dart';
import 'package:provider/provider.dart';

void main() => runApp(ProductivityCompanion());

class ProductivityCompanion extends StatelessWidget {
  const ProductivityCompanion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return HomePageProvider();
      },
      child: AppBuilder(
        builder: (context) {
          return MaterialApp(
            color: backGroundColor,
            debugShowCheckedModeBanner: false,
            home: HomePage(),
            routes: {
              '/settings': (context) => Settings(),
            },
          );
        },
      ),
    );
  }
}
