import 'package:flutter/material.dart';
import '../widgets/list.dart';

final _listKey = GlobalKey<AnimatedListState>();
final _todoController = TextEditingController();
List _expensesList = [];

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: _appBar(),
      body: const Body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ClipOval(
              child: Image.asset("images/image.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: MyAnimatedList(
            listKey: _listKey,
            widgetList: _expensesList,
            todoController: _todoController,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 1),
                      child: TextField(
                        controller: _todoController,
                        decoration: const InputDecoration(
                          hintText: "   Add Expense",
                          hintStyle: TextStyle(fontSize: 13),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: ElevatedButton(
                  onPressed: () {
                    _expensesList.insert(0, "Item ${_expensesList.length + 1}");
                    _listKey.currentState!.insertItem(0,
                        duration: const Duration(milliseconds: 200));
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text(
                    "+",
                    style: TextStyle(
                        fontSize: 35, color: Color.fromRGBO(40, 40, 43, 1.0)),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
