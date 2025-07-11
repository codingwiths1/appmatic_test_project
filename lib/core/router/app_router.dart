import 'package:appmatic_test_project/features/cart/presentation/pages/cart_page.dart';
import 'package:appmatic_test_project/features/nav_bar/presentation/nav_bar_page.dart';
import 'package:appmatic_test_project/product_details_page.dart';
import 'package:appmatic_test_project/splash_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';

part 'app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: NavBarRoute.page),
    AutoRoute(page: CartRoute.page),
    AutoRoute(page: ProductDetailsRoute.page),
  ];
}
