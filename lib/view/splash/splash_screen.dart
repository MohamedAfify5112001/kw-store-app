import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_store_app/core/paths/app_image_paths.dart';
import 'package:kw_store_app/core/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _initSplashTimer();
  }

  void _initSplashTimer() => _timer = Timer(
        const Duration(seconds: 4),
        () => Navigator.of(context).pushReplacementNamed(AppRoutes.onBoarding),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RepaintBoundary(
          child: FadeInLeftBig(
            duration: const Duration(seconds: 2),
            child: SvgPicture.asset(
              AppImagePaths.kwLogo,
            ),
          ),
        ),
      ),
    );
  }
}
