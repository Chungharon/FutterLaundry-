import 'package:flutter/material.dart';
import 'package:laundryhub/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:laundryhub/features/shop/screens/home/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// --Appbar -- Tutorial [Section = 3, video = 3]
                  THomeAppBar(),

                  /// -- Searbar -- Tutorial [Section = 3, Video = 4]
                  /// -- Categories -- Tutorial [Section = 3, video = 4]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
