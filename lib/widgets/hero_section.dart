import 'package:brosd_web/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
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
                ),

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
                ),
                SizedBox(height: 41.89.h),
                Image.asset("assets/images/app-play-store.png", width: 363.w),
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
                ),
                Positioned(
                  right: 0,
                  top: 118,
                  child: Image.asset(
                    'assets/images/green-overlay.png',
                    fit: BoxFit.cover,
                    // height: 326.h,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 180.w,
                  child: Image.asset(
                    "assets/images/iPhone.png",
                    // height: 325.38,
                    // height: 350,
                    // width: 161.23.w,
                  ),
                ),
                Positioned(
                  top: 116.73,
                  left: 43.87.w,
                  child: Image.asset(
                    "assets/images/iPhone2.png",
                    // height: 305.26,
                  ),
                ),
              ],
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
          style: TextStyle(fontSize: bulletSize.sp),
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
