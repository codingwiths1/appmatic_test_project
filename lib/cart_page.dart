import 'package:appmatic_test_project/core/component/cart_product_item.dart';
import 'package:appmatic_test_project/core/extention/extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      /// AppBar
      appBar: const CupertinoNavigationBar(
        automaticallyImplyLeading: true,
        previousPageTitle: "Back",
        middle: Text("Cart"),
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            children: [
              20.0.toVert,
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return const Stack(
                    children: [
                      CartProductItem(),

                      Positioned(
                        top: 10,
                        right: 15,
                        child: Material(
                          color: Colors.transparent,
                          child: Icon(Icons.clear),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    25.0.toVert,
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),

      // BottomNavBar
      bottomNavigationBar: SizedBox(
        height: 70,
        child: GestureDetector(
          onTap: () {},
          child: Button(
            margin: aPadding,
            padding: aPadding,
            child: Text(
              "Cashout \$1000",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
