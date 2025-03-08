import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile = constraints.maxWidth < 800;

      return Container(
        padding: EdgeInsets.only(
          left: isMobile ? 20.w : 79.w,
          top: isMobile ? 20.h : 29.h,
          bottom: isMobile ? 20.h : 11.h,
          right: isMobile ? 20.w : 0,
        ),
        width: double.infinity,
        color: Colors.white,
        child: isMobile
            ? _buildMobileLayout(context)
            : _buildDesktopLayout(context),
      );
    });
  }

  /// Desktop layout
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 667.w,
          height: 55.h,
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: Image.asset(
                'assets/images/search-icon.png',
                height: 21.88.h,
                width: 25.24.w,
              ),
              enabled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.62.r),
                borderSide: BorderSide(
                  width: 0.84.w,
                  color: Color.fromARGB(167, 200, 196, 196),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.62.r),
                borderSide: BorderSide(
                  width: 0.84.w,
                  color: AppColors.primaryGreen,
                ),
              ),
              filled: true,
              fillColor: AppColors.background,
            ),
          ),
        ),
        SizedBox(width: 233.w),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, Amanda',
                style: GoogleFonts.poppins(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGreen,
                ),
              ),
              Text(
                'Tue, 07 November 2024',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 51.w),
        Row(
          children: [
            Image.asset('assets/images/notification-icon.png'),
            SizedBox(width: 34.w),
            Image.asset('assets/images/profile.png'),
          ],
        ),
      ],
    );
  }

  // Mobile layout
  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, Amanda',
                      style: GoogleFonts.poppins(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                    Text(
                      'Tue, 07 November 2024',
                      style: GoogleFonts.poppins(
                        fontSize: 44.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/notification-icon.png',
                  ),
                  SizedBox(width: 50.w),
                  Image.asset(
                    'assets/images/profile.png',
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          width: double.infinity,
          height: 55.h,
          padding: EdgeInsets.symmetric(
            horizontal: 40.w,
          ),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: Image.asset(
                'assets/images/search-icon.png',
              ),
              enabled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.62.r),
                borderSide: BorderSide(
                  width: 0.84.w,
                  color: Color.fromARGB(167, 200, 196, 196),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.62.r),
                borderSide: BorderSide(
                  width: 0.84.w,
                  color: AppColors.primaryGreen,
                ),
              ),
              filled: true,
              fillColor: AppColors.background,
            ),
          ),
        ),
      ],
    );
  }
}
