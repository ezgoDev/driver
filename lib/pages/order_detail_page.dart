import 'package:driver/model/order_model.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  final OrderModel orderModel;
  const OrderDetailPage({Key? key, required this.orderModel}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text("order detail ${widget.orderModel.id}"),
      ),
    );
  }
}
