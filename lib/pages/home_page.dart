import 'package:flutter/material.dart';

import '../model/order.dart';

class HomePage extends StatefulWidget {
  final  ValueChanged<OrderModel> onJumpOrderDetail;
  const HomePage({Key? key, required this.onJumpOrderDetail}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text('首页'),
            MaterialButton(
              onPressed: () => widget.onJumpOrderDetail(OrderModel(1)),
              child: const Text('详情'),
            )

          ],
        ),
      ),
    );
  }
}
