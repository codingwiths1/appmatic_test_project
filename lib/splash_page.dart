import 'package:appmatic_test_project/core/extention/extention.dart';
import 'package:appmatic_test_project/core/router/app_router.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:appmatic_test_project/core/utils/notifications.dart';
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
  }

  delayAutoNavigation() {
    Future.delayed(const Duration(seconds: 3), () => autoNavigation());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => delayAutoNavigation());
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
