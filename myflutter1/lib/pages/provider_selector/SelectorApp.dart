import 'package:flutter/material.dart';
import 'package:myfltter1/states/Count2State.dart';
import 'package:provider/provider.dart';

class SelectorApp extends StatefulWidget {
  const SelectorApp({Key? key}) : super(key: key);

  @override
  _SelectorAppState createState() => _SelectorAppState();
}

class _SelectorAppState extends State<SelectorApp> {
  Count2State _model = Count2State()..initData();

  @override
  void initState() {
    super.initState();
    _model = Count2State()..initData();
  }

  @override
  Widget build(BuildContext context) {
    List<SelectorItem> _children = _model.contentMap.keys
        .map((key) => SelectorItem(content: key))
        .toList();
    return ChangeNotifierProvider.value(
      value: _model,
      child: ListView(children: _children),
    );
  }
}

class SelectorItem extends StatelessWidget {
  final String content;
  SelectorItem({required this.content});

  @override
  Widget build(BuildContext context) {
    print('SelectorItemWidget:build');
    return Container(
        decoration: const BoxDecoration(
        color: Color.fromARGB(66, 193, 149, 149),
      ),
        height: 80,
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () => Provider.of<Count2State>(context, listen: false)
              .increment(content),
          child: Selector<Count2State, int>(
              //从 Count2State得到对应字母的count
              selector: (context, model) => model.contentMap[content]!,
              //如果前后两次的count不相等，则刷新
              shouldRebuild: (preCount, nextCount) => preCount != nextCount,
              builder: (context, count, child) {
                print("$content Selector:builder");
                return Text("$content : $count");
              }),
        ));
  }
}
