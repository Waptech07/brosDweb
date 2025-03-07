import 'package:brosd_web/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile = constraints.maxWidth < 800;
      return isMobile
          ? _buildMobileLayout(context)
          : _buildDesktopLayout(context);
    });
  }

  // Desktop layout
  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      height: 452,
      padding: EdgeInsets.only(
        left: 146.w,
        bottom: 0,
        right: 0,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 87.h,
                ),
                Text(
                  "Artisans Onboarding",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.1),

                // using the BulletItem widget
                BulletItem(
                  text:
                      "Access to a network of skilled local artisans,\nincluding electricians, plumbers, carpenters, and\nmore.",
                  textStyle: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                BulletItem(
                  text:
                      "Review your artisan profiles and schedule services\nfor home repairs, renovations, or specialized tasks.",
                  textStyle: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 15.h,
                      bottom: 14.11.h,
                      right: 35.w,
                      left: 34.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryRed,
                      borderRadius: BorderRadius.circular(17.r),
                    ),
                    child: Text(
                      'Discover More',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ).animate().scaleXY(begin: 0.9).fadeIn(duration: 800.ms),
                SizedBox(height: 41.89.h),
                Image.asset("assets/images/app-play-store.png", width: 363.w)
                    .animate()
                    .fadeIn(duration: 1.seconds)
                    .slideY(begin: 0.1),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned(
                  right: 20.w,
                  top: 104,
                  child: Image.asset(
                    'assets/images/hero.png',
                    fit: BoxFit.cover,
                    // height: 326.h,
                    width: 582.24.w,
                  ),
                ).animate().fadeIn(duration: 800.ms).slideX(begin: 0.2),
                Positioned(
                  right: 0,
                  top: 118,
                  child: Image.asset(
                    'assets/images/green-overlay.png',
                    fit: BoxFit.cover,
                    // height: 326.h,
                  ),
                ).animate().fadeIn(duration: 1.seconds),
                Positioned(
                  top: 0,
                  left: 180.w,
                  child: Image.asset(
                    "assets/images/iPhone.png",
                    // height: 325.38,
                    // height: 350,
                    // width: 161.23.w,
                  ),
                ).animate().scaleXY(begin: 0.8).fadeIn(duration: 1.2.seconds),
                Positioned(
                  top: 116.73,
                  left: 43.87.w,
                  child: Image.asset(
                    "assets/images/iPhone2.png",
                    // height: 305.26,
                  ),
                ).animate().scaleXY(begin: 0.8).fadeIn(duration: 1.4.seconds),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Mobile layout
  Widget _buildMobileLayout(BuildContext context) {
    return Container(
      height: 700.h,
      child: Stack(
        children: [
          Positioned.fill(
            top: 300.h,
            child: Image.asset(
              'assets/images/hero.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              'assets/images/green-overlay.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
                vertical: 20.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100.h),
                  Text(
                    "Artisans Onboarding",
                    style: GoogleFonts.poppins(
                      fontSize: 100.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  BulletItem(
                    bulletSize: 70,
                    text:
                        "Access to a network of skilled local artisans,\nincluding electricians, plumbers, carpenters, and more.",
                    textStyle: GoogleFonts.poppins(
                      fontSize: 44.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  BulletItem(
                    bulletSize: 70,
                    text:
                        "Review your artisan profiles and schedule services\nfor home repairs, renovations, or specialized tasks.",
                    textStyle: GoogleFonts.poppins(
                      fontSize: 44.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryRed,
                        borderRadius: BorderRadius.circular(17.r),
                      ),
                      child: Text(
                        'Discover More',
                        style: GoogleFonts.poppins(
                          fontSize: 50.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 70.h),
                  Center(
                    child: Image.asset(
                      "assets/images/app-play-store.png",
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BulletItem extends StatelessWidget {
  final String text;
  final double bulletSize;
  final TextStyle textStyle;

  const BulletItem({
    Key? key,
    required this.text,
    this.bulletSize = 29,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "•",
          style: TextStyle(
            fontSize: bulletSize.sp,
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.only(top: 12.h),
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
