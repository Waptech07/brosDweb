import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class MainNavbar extends StatefulWidget {
  const MainNavbar({super.key});

  @override
  State<MainNavbar> createState() => _MainNavbarState();
}

class _MainNavbarState extends State<MainNavbar> {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      height: 81.h,
      padding: EdgeInsets.symmetric(horizontal: 79.w),
      color: AppColors.primaryGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Image.asset(
            'assets/images/logo.png',
            height: 44.42.h,
          ),

          if (!isMobile)
            Row(
              children: [
                _buildNavDropdown("Home", false),
                _buildNavDropdown("Product", true),
                _buildNavDropdown("Company", true),
                _buildNavDropdown("Help", true),
              ],
            )
          else
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),

          if (!isMobile)
            // Download Button
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(
                  top: 6.h,
                  bottom: 10.24.h,
                  right: 10.w,
                  left: 9.7.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Text(
                  'Download Now',
                  style: GoogleFonts.monda(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondaryRed,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavDropdown(
    String title,
    bool isDropdown,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: PopupMenuButton<String>(
        tooltip: "",
        onSelected: (value) {},
        itemBuilder: (context) => [
          if (isDropdown)
            PopupMenuItem(
              value: title,
              child: Text(
                title,
                style: GoogleFonts.monda(
                  color: AppColors.secondaryRed,
                ),
              ),
            ),
        ],
        offset: Offset(0, 40.h),
        color: Colors.white,
        elevation: 1,
        child: Row(
          children: [
            Text(
              title,
              style: GoogleFonts.monda(
                fontSize: 20.62.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 1.75.w),
            // if (isDropdown) SizedBox(width: 1.75.w),
            if (isDropdown)
              Icon(
                Icons.arrow_drop_down_rounded,
                color: Colors.white,
                size: 20.62.sp,
              ),
          ],
        ),
      ),
    );
  }
}
