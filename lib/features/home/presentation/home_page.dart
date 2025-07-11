import 'package:appmatic_test_project/core/component/clipper_container.dart';
import 'package:appmatic_test_project/core/extention/extention.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    const Text("Good day, Happy Shopping"),
                    const Text("Benjamin"),
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
