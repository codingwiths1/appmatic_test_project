import 'package:appmatic_test_project/core/router/app_router.dart';
import 'package:appmatic_test_project/core/theme/theme.dart';
import 'package:appmatic_test_project/features/cart/bloc/cart_bloc.dart';
import 'package:appmatic_test_project/features/home/bloc/home_cubit.dart';
import 'package:appmatic_test_project/features/nav_bar/bloc/nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<ScaffoldMessengerState> nav =
    GlobalKey<ScaffoldMessengerState>();

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavBarCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => CartBloc()),


      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        scaffoldMessengerKey: nav,
        theme: lightMode,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

final AppRouter appRouter = AppRouter();
