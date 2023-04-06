import 'package:expenses/animation_widget/animated_circle.dart';
import 'package:expenses/pages/ListPage.dart';
import 'package:expenses/widgets/nice_icon.dart';
import 'package:flutter/material.dart';

import 'ProfilePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: _appBar(context, theme),
      body: Column(
        children: [
          Expanded(
            child: AnimatedCircle(
              circle_color: theme.accentColor,
            ),
          )
        ],
      ),
    );
  }

  AppBar _appBar(context, ThemeData theme) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          NiceIcon(page: ListPage(), icon: Icons.architecture),
          NiceIcon(page: ProfilePage(), icon: Icons.person)
        ],
      ),
    );
  }
}
