import 'package:appmatic_test_project/core/router/app_router.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:appmatic_test_project/features/home/presentation/home_page.dart';
import 'package:appmatic_test_project/features/nav_bar/bloc/nav_bar_cubit.dart';
import 'package:appmatic_test_project/features/nav_bar/presentation/nav_bar_page.dart';
import 'package:appmatic_test_project/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => NavBarCubit())],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        theme: lightMode,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
