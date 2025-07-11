import 'package:flutter/material.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({super.key, this.usePriceRow = true});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Product Image
              SizedBox(
                width: 90,
                height: 90,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.asset("", fit: BoxFit.contain),
                ),
              ),

              /// Product WriteUp
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nike"),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          width: constraints.maxWidth - 25,
                          child: Text(
                            "",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        );
                      },
                    ),

                    /// Counter && PriceTag  Row
                    usePriceRow
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$100",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontWeight: FontWeight.w600),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          )
                        : Text(
                            "\$100",
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(fontWeight: FontWeight.w600),
                            textAlign: TextAlign.end,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
