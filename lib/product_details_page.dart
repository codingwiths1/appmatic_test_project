import 'package:appmatic_test_project/core/clipper/clipper.dart';
import 'package:appmatic_test_project/core/component/app_button.dart';
import 'package:appmatic_test_project/core/extention/extention.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

@RoutePage()
class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, this.product});
  final Map? product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CupertinoNavigationBar(
        backgroundColor: AppColors.transparent,
        enableBackgroundFilterBlur: false,
        automaticallyImplyLeading: true,
        previousPageTitle: "Back",
        transitionBetweenRoutes: true,
        trailing: Icon(Iconsax.heart),
      ),
      body: SingleChildScrollView(
        //........................... Overall Column ............................//
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: Clipper(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 300,
                    width: double.maxFinite,
                    color: AppColors.white,
                  ),
                  Positioned(
                    bottom: 40,
                    child: SizedBox(
                      height: 250,
                      width: 250,
                      child: Image.network(frameBuilder: (context, child, frame, _){
                        if(frame != null){
                          return child;
                        }else{
                          return const SizedBox(
                              height: 250,
                              width: 250,child: Center(child: CircularProgressIndicator(color: AppColors.blue,)));
                        }
                      } ,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                        product!["image"],
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Body Column
            ///Rating && Share Button
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Rating && share button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Iconsax.star5,
                            color: Colors.amber,
                            size: 25,
                          ),
                          Text(
                            "5.0",
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge!.copyWith(fontSize: 18),
                          ),
                          Text(
                            "(199)",
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge!.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                      const Icon(Icons.share),
                    ],
                  ),

                  /// Discount Container && Text Row
                  10.0.toVert,
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "20%",
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(color: AppColors.black),
                        ),
                      ),
                      5.0.toHor,

                      Text(
                        "\$400",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(decoration: TextDecoration.lineThrough),
                      ),
                      10.0.toHor,

                      Text(
                        "\$${product!["price"]}",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  20.0.toVert,

                  /// Product Title Row
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    product!["title"],
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                  ),
                  10.0.toVert,

                  /// Product Status Row
                  Row(
                    children: [
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "Status:",
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(fontSize: 14),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "In Stock",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                      ),
                    ],
                  ),

                  30.0.toVert,

                  /// Checkout Button
                  AppButton.bigButton(
                    context,
                    child: Center(
                      child: Text(
                        "Checkout",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  20.0.toVert,

                  /// RowText
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),

                  /// Product Description
                  ReadMoreText(
                    product!["description"],
                    trimExpandedText: "...Read less \u2191",
                    trimCollapsedText: "Read more",
                    trimMode: TrimMode.Line,
                    style: Theme.of(context).textTheme.titleMedium,
                    moreStyle: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: AppColors.blue),
                    lessStyle: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: AppColors.blue),
                    trimLines: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /// BottomNavBar
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.only(right: 15.0),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppButton.circularButton(
                  context,
                  child: const Icon(Iconsax.minus, color: AppColors.white),
                ),
                Text("3", style: Theme.of(context).textTheme.titleMedium),
                AppButton.circularButton(
                  context,
                  child: const Icon(Iconsax.add, color: AppColors.white),
                ),
              ],
            ),

            /// Add To Cart
            AppButton.bigButton(
              onPressed: () {
                debugPrint("Tapped");
              },
              context,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(Iconsax.shopping_cart, color: AppColors.white),
                    5.0.toHor,
                    Text(
                      "Cart",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: AppColors.white),
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
