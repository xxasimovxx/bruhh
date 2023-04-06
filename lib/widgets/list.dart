import 'package:flutter/material.dart';

class MyAnimatedList extends StatelessWidget {
  final GlobalKey<AnimatedListState> listKey;
  final List widgetList;
  final TextEditingController todoController;
  const MyAnimatedList(
      {super.key,
      required this.listKey,
      required this.widgetList,
      required this.todoController});

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: listKey,
      initialItemCount: widgetList.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation
              .drive(Tween(begin: const Offset(1, 0), end: const Offset(0, 0))),
          child: ListTile(
            title: Text(todoController.text),
          ),
        );
      },
    );
  }
}
