import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _anim;

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  void _handleGetStarted() {
    Navigator.pushReplacementNamed(context, '/auth-choice');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: _Palette.brown, width: 8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔄 Logo Animation
            AnimatedBuilder(
              animation: _anim,
              builder: (_, __) => Transform.rotate(
                angle: _anim.value * 2 * math.pi,
                child: Transform.scale(
                  scale: Tween(begin: 0.9, end: 1.05).evaluate(
                    CurvedAnimation(parent: _anim, curve: Curves.easeInOut),
                  ),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: _Palette.logoBg,
                    backgroundImage: const AssetImage('assets/logo.jpg'),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ✨ Cursive Brand Text
            Text(
              "Home of Apparel",
              style: GoogleFonts.dancingScript(
                fontSize: 28,
                color: _Palette.brown,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 48),

            // 🚀 Get Started Button
            ElevatedButton(
              onPressed: _handleGetStarted,
              style: ElevatedButton.styleFrom(
                backgroundColor: _Palette.brown,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Palette {
  static const brown = Color(0xFF9C6735);
  static const logoBg = Color(0xFFE7D2C2);
}
