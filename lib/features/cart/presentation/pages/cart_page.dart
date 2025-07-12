import 'package:appmatic_test_project/core/component/app_button.dart';
import 'package:appmatic_test_project/core/component/cart_product_item.dart';
import 'package:appmatic_test_project/core/extention/extention.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:appmatic_test_project/features/cart/bloc/cart_bloc.dart';
import 'package:appmatic_test_project/features/cart/bloc/cart_event.dart';
import 'package:appmatic_test_project/features/cart/bloc/cart_state.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
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
          body: state.addToCart.isEmpty
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
                            Map product = state.addToCart[index];
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
                                        context.read<CartBloc>().add(
                                          RemoveFromCart(index),
                                        );
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
                          itemCount: state.addToCart.length,
                        ),
                      ],
                    ),
                  ),
                ),

          /// BottomNavBar
          bottomNavigationBar: state.addToCart.isEmpty
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(
                    bottom: 100,
                    left: 16,
                    right: 16,
                  ),
                  child: AppButton.bigButton(
                    onPressed: () {},
                    context,
                    child: Text(
                      "Checkout \$${state.totals}",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
