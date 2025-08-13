import 'package:flutter/material.dart';

import '../../utils/comman/customappbar.dart';
import '../../utils/utils.dart';
import 'custom_order_list_item.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showaBackArrow: true,
        title: Utils.customText(
          "My Order",
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        
        child: CustomOrderListItem(),
      ),
    );
  }
}
