import 'package:flutter/material.dart';

import '../pages/ListPage.dart';

class NiceIcon extends StatelessWidget {
  final Widget page;
  final IconData icon;

  const NiceIcon({super.key, required this.page, required this.icon});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
      width: 60,
      height: 60,
      child: Card(
        color: theme.accentColor,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.0),
            side: const BorderSide(width: 1.5, color: Colors.black)),
        child: Center(
          child: IconButton(
              padding: const EdgeInsets.all(1),
              onPressed: () {
                _pushPage(context, page);
              },
              icon: Icon(
                icon,
                size: 30,
                color: theme.primaryColor,
              )),
        ),
      ),
    );
  }

  void _pushPage(
    BuildContext context,
    Widget page,
  ) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }
}
