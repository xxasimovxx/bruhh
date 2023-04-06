import 'package:expenses/animation_widget/animated_circle.dart';
import 'package:expenses/pages/ListPage.dart';
import 'package:flutter/material.dart';

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
        children: [
          SizedBox(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListPage(),
                          ));
                    },
                    icon: Icon(
                      Icons.architecture_sharp,
                      size: 30,
                      color: theme.primaryColor,
                    )),
              ),
            ),
          ),
          SizedBox(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListPage(),
                          ));
                    },
                    icon: Icon(
                      Icons.person,
                      size: 30,
                      color: theme.primaryColor,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
