import 'package:appmatic_test_project/core/extention/extention.dart';
import 'package:appmatic_test_project/core/router/app_router.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:appmatic_test_project/core/utils/notifications.dart';
import 'package:appmatic_test_project/features/cart/function/cart_function.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDisplayCard extends StatelessWidget {
  const ProductDisplayCard({super.key, required this.product});
  final Map product;
  @override
  Widget build(BuildContext context) {
    checkProduct(Map item) {
      if (CartFunction.cartList.contains(item)) {
        Notifications.message(context, message: "ALREADY ADDED");
      } else {
        CartFunction.cartList.add(item);
        Notifications.message(context, message: "ADDED TO CART");
      }
    }

    return GestureDetector(
      onTap: () {
        context.router.push(ProductDetailsRoute(product: product));
      },
      child: Container(
        height: 331,
        padding: const EdgeInsets.all(1),
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //........................... Stack Widget Image && Discount && Favourite ............................//
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      frameBuilder: (context, child, frame, _) {
                        if (frame != null) {
                          return child;
                        } else {
                          return const SizedBox(
                            height: 180,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.blue,
                              ),
                            ),
                          );
                        }
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                      product["image"],
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "40%",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: AppColors.black),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: InkWell(
                    onTap: () {
                      debugPrint("Tapped");
                    },
                    child: const Icon(
                      color: AppColors.black,
                      Iconsax.heart4,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),

            //........................... Product Name ............................//
            20.0.toVert,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        product["title"],
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    5.0.toVert,

                    //........................... Pricing && Add Icon ............................//// LayoutBuilder(
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 135,
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            "\$${product["price"]}",
                            style: Theme.of(
                              context,
                            ).textTheme.headlineMedium!.copyWith(fontSize: 20),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            checkProduct(product);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            // padding: EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: const Center(
                              child: Icon(Iconsax.add, color: AppColors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
