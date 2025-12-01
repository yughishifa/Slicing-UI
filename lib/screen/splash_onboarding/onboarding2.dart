import 'package:flutter/material.dart';
import '../splash_onboarding/onboarding.dart';
import 'clip_paths.dart';
// import '../onboarding.dart' show createRouteSlide;
import '../splash_onboarding/onboarding.dart' show createRouteSlide;

const Color kPrimaryColor = Color(0xFF459489);
const Color kBgDark = Color(0xFF0F3836);
const double kButtonSize = 55.0;
const double kDotsSize = 10.0;


class Dot extends StatelessWidget {
  final bool isActive;
  const Dot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kDotsSize,
      height: kDotsSize,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : Colors.white.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
    );
  }
}

class DotsIndicator extends StatelessWidget {
  final int current;
  final int total;

  const DotsIndicator({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total * 2 - 1, (index) {
        if (index.isOdd) return const SizedBox(width: 8);
        final dotIndex = index ~/ 2;
        return Dot(isActive: dotIndex == current);
      }),
    );
  }
}

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onTap;

  const CircleButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kButtonSize,
      height: kButtonSize,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onTap,
      ),
    );
  }
}

class NavigationRow extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const NavigationRow({
    super.key,
    required this.currentPage,
    required this.pageCount,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleButton(
          icon: Icons.arrow_back,
          backgroundColor: Colors.white.withOpacity(0.2),
          onTap: onBack,
        ),
        DotsIndicator(current: currentPage, total: pageCount),
        CircleButton(
          icon: Icons.arrow_forward,
          backgroundColor: kPrimaryColor,
          onTap: onNext,
        ),
      ],
    );
  }
}


class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key});

  final int _currentPage = 1;
  final int _pageCount = 2;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1.05,
                child: Image.asset(
                  'assets/images/onboarding2.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(child: Container(color: Colors.white)),
            ],
          ),

          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Lewati",
                style: TextStyle(color: Color(0xFF1A9B20)),
              ),
            ),
          ),

Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: OnboardingClipPath(),
              child: Container(
                height: screenHeight * 0.58,
                color: kBgDark,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        SizedBox(height: 50), 
                        Text(
                          "Rawat Tanamanmu dengan Mudah 🌱",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 14),
                        Text(
                          "Pantau pertumbuhan tanamanmu dengan sistem hidroponik otomatis dari HydropoMe!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    NavigationRow(
                      currentPage: _currentPage,
                      pageCount: _pageCount,
                      onBack: () {
                        Navigator.pushReplacement(
                          context,
                          createRouteSlide(
                            page: const OnboardingScreen(),
                            toRight: true, 
                          ),
                        );
                      },
                      onNext: () {
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}