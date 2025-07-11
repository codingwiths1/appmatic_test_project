import 'package:appmatic_test_project/core/extention/extention.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    super.key,
    this.usePriceRow = true,
    required this.product,
  });
  final Map product;
  final bool usePriceRow;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onTertiary,
        borderRadius: BorderRadius.circular(15),
      ),

      /// Overall Column
      child: Column(
        children: [
          Row(


            children: [
              /// Product Image
              SizedBox(
                width: 90,
                height: 90,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child:  Image.network(
                    frameBuilder: (context, child, frame, _) {
                      if (frame != null) {
                        return child;
                      } else {
                        return const SizedBox(
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
              10.0.toHor,

              /// Product WriteUp
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product["title"],
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  /// Counter && PriceTag  Row
                  Text(
                    "\$${product["price"]}",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
