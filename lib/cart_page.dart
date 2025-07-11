import 'package:appmatic_test_project/core/component/app_button.dart';
import 'package:appmatic_test_project/core/component/cart_product_item.dart';
import 'package:appmatic_test_project/core/extention/extention.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              30.0.toVert,
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
                    const SizedBox(height: 25),
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),

      /// BottomNavBar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 100, left: 16, right: 16),
        child: AppButton.bigButton(
          context,
          child: Text(
            "Cashout \$1000",
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
