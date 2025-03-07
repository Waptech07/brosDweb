import 'package:brosd_web/utils/colors.dart';
import 'package:brosd_web/widgets/nav_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 50.w,
        ),
        color: AppColors.primaryGreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 30.h,
              ),
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/logo.png',
                // height: 40.h,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    NavDropdown(
                      title: "Home",
                      isDropdown: false,
                      onTap: () {},
                    ),
                    SizedBox(height: 20.h),
                    NavDropdown(
                      title: "Product",
                      isDropdown: true,
                      onTap: () {},
                    ),
                    SizedBox(height: 20.h),
                    NavDropdown(
                      title: "Company",
                      isDropdown: true,
                      onTap: () {},
                    ),
                    SizedBox(height: 20.h),
                    NavDropdown(
                      title: "Help",
                      isDropdown: true,
                      onTap: () {},
                    ),
                    SizedBox(height: 40.h),
                    // Download Button
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Center(
                          child: Text(
                            'Download Now',
                            style: GoogleFonts.monda(
                              fontSize: 70.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondaryRed,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
