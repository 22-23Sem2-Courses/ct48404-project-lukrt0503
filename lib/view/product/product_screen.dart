import 'package:flutter/material.dart';

import '../../component/main_header.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [const MainHeader(), Expanded(child: Container())],
      ),
    );
  }
}
