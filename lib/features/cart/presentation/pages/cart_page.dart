import 'package:appmatic_test_project/core/component/app_button.dart';
import 'package:appmatic_test_project/core/component/cart_product_item.dart';
import 'package:appmatic_test_project/core/extention/extention.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:appmatic_test_project/features/cart/function/cart_function.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      /// AppBar
      appBar: CupertinoNavigationBar(
        previousPageTitle: "Back",
        middle: Text(
          "Cart",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      /// Body
      body: CartFunction.cartList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_rounded,
                    size: 100,
                    color: AppColors.black,
                  ),
                  10.0.toVert,
                  Text(
                    "Empty Cart",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    30.0.toVert,
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        Map product = CartFunction.cartList[index];
                        return Stack(
                          children: [
                            CartProductItem(product: product),

                            Positioned(
                              top: 10,
                              right: 15,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    CartFunction.cartList.removeAt(index);
                                    setState(() {});
                                  },
                                  child: const Icon(Icons.clear),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 25),
                      itemCount: CartFunction.cartList.length,
                    ),
                  ],
                ),
              ),
            ),

      /// BottomNavBar
      bottomNavigationBar: CartFunction.cartList.isEmpty
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(bottom: 100, left: 16, right: 16),
              child: AppButton.bigButton(
                context,
                child: Text(
                  "Buy Now",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
    );
  }
}
