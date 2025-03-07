import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 79.w,
        top: 29.h,
        bottom: 11.h,
        // right: 43.w,
      ),
      width: double.infinity,
      color: Colors.white,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 677.w,
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.62.r),
                  borderSide: BorderSide(
                    width: 0.84.w,
                    color: const Color(0xFFC8C4C4),
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
                fillColor: const Color(0xFFF1F1F1),
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
      ),
    );
  }
}
