import 'package:appmatic_test_project/app_widget.dart';
import 'package:appmatic_test_project/core/api/api.dart';
import 'package:appmatic_test_project/core/component/clipper_container.dart';
import 'package:appmatic_test_project/core/component/product_display_card.dart';
import 'package:appmatic_test_project/core/extention/extention.dart';
import 'package:appmatic_test_project/core/router/app_router.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:appmatic_test_project/features/cart/function/cart_function.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Api.fetchProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipperContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    40.0.toVert,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Good day, Happy Shopping",
                              style: Theme.of(context).textTheme.titleSmall!
                                  .copyWith(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              "Benjamin",
                              style: Theme.of(context).textTheme.titleSmall!
                                  .copyWith(
                                    color: AppColors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                        //........................... Shopping Bag Icon Stack ............................//
                        GestureDetector(
                          onTap: () {
                          context.router.push(const CartRoute());
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                const Icon(
                                  Iconsax.shopping_bag,
                                  color: AppColors.white,
                                  size: 27,
                                ),
                                Positioned(
                                  right: -6,
                                  top: -13,
                                  child: Container(
                                    clipBehavior: Clip.none,
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${CartFunction.cartList.length}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .apply(
                                              color: AppColors.white,
                                              fontSizeFactor: 0.7,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.0.toVert,
                    //........................... Search Bar ............................//
                    TextFormField(
                      textInputAction: TextInputAction.search,

                      onFieldSubmitted: (value) {},
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.apply(color: AppColors.black),
                      decoration: InputDecoration(
                        suffixIcon: const SizedBox.shrink(),
                        contentPadding: EdgeInsets.zero,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(
                          Iconsax.search_normal,
                          color: AppColors.black,
                        ),
                        fillColor: AppColors.white,
                        hintText: "Search in Store",
                        hintStyle: Theme.of(
                          context,
                        ).textTheme.bodySmall!.apply(color: AppColors.black),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
              child: Text(
                "Popular Products",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
            30.0.toVert,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Api.productList.isEmpty? MasonryGridView.builder(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                itemBuilder: (context, _) {
                  return Container(
                    height: 200,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(color: AppColors.blue),
                    ),
                  );
                },
              ):
              MasonryGridView.builder(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Api.productList.length,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                itemBuilder: (context, index) {
                  Map product = Api.productList[index];
                  return ProductDisplayCard(product: product,);
                },
              ),
            ),
            50.0.toVert,
          ],
        ),
      ),
    );
  }
}
