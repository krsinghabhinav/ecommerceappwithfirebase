import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappwithfirebase/controller/product/allproduct_controller.dart';
import 'package:ecommerceappwithfirebase/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/comman/CustomSortableProducts.dart';
import '../../utils/comman/customappbar.dart';
import '../../utils/utils.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({
    super.key,
    this.futureMethod,
    this.query,
    required this.title,
  });

  final Future<List<ProductModel>>? futureMethod;
  final Query? query;
  final String title;

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  late final AllproductController allproductController;
  late final Future<List<ProductModel>> _productFuture;

  @override
  void initState() {
    super.initState();

    // ✅ Reuse controller or put permanently
    allproductController =
        Get.isRegistered<AllproductController>()
            ? Get.find<AllproductController>()
            : Get.put(AllproductController(), permanent: true);

    // ✅ Freeze future, safe for multiple navigations
    _productFuture =
        widget.futureMethod ??
        allproductController.fetchAllProductByQuery(widget.query!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showaBackArrow: true,
        title: Utils.customText(
          widget.title,
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _productFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("⚠️ Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("🚫 No products found"));
          }

          final products = snapshot.data!;

          return SingleChildScrollView(
            child: CustomSortableProducts(products: products),
          );
        },
      ),
    );
  }
}
