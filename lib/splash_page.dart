import 'package:appmatic_test_project/core/extention/extention.dart';
import 'package:appmatic_test_project/core/router/app_router.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  autoNavigation() {
    context.router.replaceAll([const NavBarRoute()]);
    ;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Future.delayed(const Duration(seconds: 5), () => autoNavigation()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Appmatic Infotech",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            20.0.toVert,
            const CircularProgressIndicator(color: AppColors.blue),
          ],
        ),
      ),
    );
  }
}
