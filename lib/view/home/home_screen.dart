import 'package:flutter/material.dart';

import '../../component/main_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Column(
        children: const [MainHeader()],
      ),
    ]));
  }
}
