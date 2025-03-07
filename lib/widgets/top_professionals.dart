import 'package:brosd_web/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TopProfessionals extends StatelessWidget {
  TopProfessionals({super.key});

  final List<Map<String, String>> professionals = [
    {
      "name": "Seun Aba",
      "job": "Plumber",
      "image": "assets/images/brosd-profile.png",
    },
    {
      "name": "Seun Aba",
      "job": "Plumber",
      "image": "assets/images/brosd-profile.png",
    },
    {
      "name": "Seun Aba",
      "job": "Plumber",
      "image": "assets/images/brosd-profile.png",
    },
    {
      "name": "Seun Aba",
      "job": "Plumber",
      "image": "assets/images/brosd-profile.png",
    },
    {
      "name": "Seun Aba",
      "job": "Plumber",
      "image": "assets/images/brosd-profile.png",
    },
    {
      "name": "Seun Aba",
      "job": "Plumber",
      "image": "assets/images/brosd-profile.png",
    },
    {
      "name": "Seun Aba",
      "job": "Plumber",
      "image": "assets/images/brosd-profile.png",
    },
  ];

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
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 107.w,
        top: 73.h,
        right: 0,
        bottom: 159.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Bros-D Professionals",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20.h),
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: professionals
                  .map((pro) => _buildProfessionalCardDesktop(pro))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  // Mobile layout
  Widget _buildMobileLayout(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 100.w,
        vertical: 50.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Bros-D Professionals",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 50.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: professionals.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 50.w,
              mainAxisSpacing: 40.h,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return _buildProfessionalCardMobile(professionals[index]);
            },
          ),
        ],
      ),
    );
  }

  // Professional card for Desktop layout.
  Widget _buildProfessionalCardDesktop(Map<String, String> pro) {
    return Container(
      width: 205.w,
      height: 269,
      margin: EdgeInsets.only(right: 94.w),
      padding: EdgeInsets.only(
        left: 30.w,
        top: 16.h,
        right: 30.w,
        bottom: 29.39.h,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFEEE7E7),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8.2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            pro['image']!,
            // height: 123,
            width: 114.w,
          ),
          SizedBox(height: 21.h),
          Text(
            pro["name"]!,
            style: GoogleFonts.monda(
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              color: Colors.black,
            ),
          ),
          Text(
            pro["job"]!,
            style: GoogleFonts.monda(
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
              color: Color(0xFF808080),
            ),
          ),
          SizedBox(height: 10.49.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Icon(
                Icons.star_rounded,
                color: AppColors.starYellow,
                size: 26.67.sp,
              );
            }),
          ),
        ],
      ),
    );
  }

  // Professional card for Mobile layout.
  Widget _buildProfessionalCardMobile(Map<String, String> pro) {
    return Container(
      height: 600.h,
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEEE7E7),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            pro['image']!,
          ),
          SizedBox(height: 10.h),
          Text(
            pro["name"]!,
            style: GoogleFonts.monda(
              fontWeight: FontWeight.w400,
              fontSize: 70.sp,
              color: Colors.black,
            ),
          ),
          Text(
            pro["job"]!,
            style: GoogleFonts.monda(
              fontWeight: FontWeight.w400,
              fontSize: 50.sp,
              color: const Color(0xFF808080),
            ),
          ),
          // SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Icon(
                Icons.star_rounded,
                color: AppColors.starYellow,
                size: 70.sp,
              );
            }),
          ),
        ],
      ),
    );
  }
}
