import 'package:api_app/core/constant/app_assets.dart';
import 'package:api_app/core/constant/app_colors.dart';
import 'package:api_app/features/auth/data/auth_repo.dart';
import 'package:api_app/features/auth/view/sign_in_view.dart';
import 'package:api_app/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _logoSlideAnimation;
  late Animation<Offset> _imageSlideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _logoSlideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0.5),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutBack,
          ),
        );

    _imageSlideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutQuart,
          ),
        );

    _controller.forward(); // start animation
    AuthRepo authRepo = AuthRepo();
    Future<void> checkLogin() async {
      try {
        final user = await authRepo.autoLogin();
        if (!mounted) return;
        if (authRepo.isGuest) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (c) => const Root()),
          );
        } else if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (c) => const Root()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (c) => const SignInView()),
          );
        }
      } catch (e) {
        debugPrint('Auto login failed: $e');
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const SignInView()),
          );
        }
      }
    }

    Future.delayed(const Duration(seconds: 3), checkLogin);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            const Gap(200),
            FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _logoSlideAnimation,
                child: SvgPicture.asset(
                  SvgAssets.splashLogo,
                  width: 200,
                ),
              ),
            ),
            const Spacer(),
            SlideTransition(
              position: _imageSlideAnimation,
              child: Image.asset(
                ImageAssets.splashImage,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
