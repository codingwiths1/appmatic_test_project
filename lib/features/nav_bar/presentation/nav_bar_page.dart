import 'package:appmatic_test_project/features/cart/presentation/pages/cart_page.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:appmatic_test_project/features/home/presentation/home_page.dart';
import 'package:appmatic_test_project/features/nav_bar/bloc/nav_bar_cubit.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
@RoutePage()

class NavBarPage extends StatelessWidget {
  const NavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = [HomePage(), CartPage()];
    return BlocBuilder<NavBarCubit, int>(
      builder: (context, state) {
        return Scaffold(extendBody: true,
          body: pages[state],
          bottomNavigationBar: Container(height: 90,padding: const EdgeInsets.only(bottom: 10.0),
            child: GNav(
              onTabChange: (indx) =>
                  context.read<NavBarCubit>().changeState(indx),
              padding: const EdgeInsets.all(20.0),
              textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              iconSize: 30,
              mainAxisAlignment: MainAxisAlignment.center,
              color: Colors.grey[400],
              gap: 10,
              tabBorderRadius: 20,
              activeColor: AppColors.black,
              tabBackgroundColor: AppColors.white,
              tabs: const <GButton>[
                GButton(
                  icon: Iconsax.home,
                  iconColor: AppColors.black,
                  text: "Home",
                  iconSize: 30,
                ),
                GButton(
                  icon: Iconsax.shopping_cart,
                  iconColor: AppColors.black,
                  text: "Cart",
                  iconSize: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
