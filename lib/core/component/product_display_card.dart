import 'package:appmatic_test_project/core/extention/extention.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDisplayCard extends StatelessWidget {
  const ProductDisplayCard({super.key});

  @override
  Widget build(BuildContext context) {
    //........................... Overall Container ............................//
    return GestureDetector(
      onTap: () {},
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    color: AppColors.blue,
                  ),
                  // Image.asset(
                  //   product["Imageurl"],
                  //   height: 180,
                  //   width: double.infinity,
                  //   fit: BoxFit.contain,
                  // ),
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
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      "",
                      style: Theme.of(context).textTheme.titleMedium!.apply(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    5.0.toVert,

                    //........................... Product Brand ............................//
                    // product["Brandname"].trim().isNotEmpty
                    //     ? VerifiedBrandName(brandName: product["Brandname"])
                    //     : SizedBox.shrink(),

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
                            "\$100",
                            style: Theme.of(
                              context,
                            ).textTheme.headlineMedium!.copyWith(fontSize: 20),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
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
