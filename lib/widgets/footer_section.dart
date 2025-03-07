import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1200) {
        return _buildDesktopLayout(context);
      } else if (constraints.maxWidth >= 600) {
        return _buildTabletLayout(context);
      } else {
        return _buildMobileLayout(context);
      }
    });
  }

  // Desktop Layout
  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 87.w, vertical: 46.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: _buildContactForm(isMobile: false)),
              Expanded(flex: 3, child: _buildMapSection(double.infinity)),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 29.w, top: 75.h),
                  child: _buildFastLinks(false),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          _buildBottomRow(context, isMobile: false),
        ],
      ),
    );
  }

  // Tablet Layout
  Widget _buildTabletLayout(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Two-column row for Contact Form and Map
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _buildContactForm(isMobile: false)),
              Expanded(child: _buildMapSection(double.infinity)),
            ],
          ),
          SizedBox(height: 30.h),
          _buildFastLinks(false),
          SizedBox(height: 30.h),
          _buildBottomRow(context, isMobile: false),
        ],
      ),
    );
  }

  // Mobile Layout
  Widget _buildMobileLayout(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContactForm(isMobile: true),
          SizedBox(height: 20.h),
          _buildMapSection(double.infinity),
          SizedBox(height: 20.h),
          _buildFastLinks(true),
          SizedBox(height: 30.h),
          _buildBottomRow(context, isMobile: true),
        ],
      ),
    );
  }

  /// Bottom row for policies and social icons.
  Widget _buildBottomRow(BuildContext context, {required bool isMobile}) {
    return Container(
      width: double.infinity,
      padding: isMobile
          ? EdgeInsets.all(40.w)
          : EdgeInsets.only(
              top: 23.h, right: 34.05.w, bottom: 23.h, left: 34.05.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: isMobile
          ? Column(
              children: [
                Text(
                  "Privacy Policy | Terms of Use | Refund Policy",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildSocialIcons(isMobile),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Privacy Policy | Terms of Use | Refund Policy",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: _buildSocialIcons(isMobile),
                ),
              ],
            ),
    );
  }

  /// Builds social icon widgets.
  List<Widget> _buildSocialIcons(bool isMobile) {
    double iconSize = isMobile ? 50.w : 22.w;
    double spacing = isMobile ? 30.w : 15.w;
    return [
      Text(
        "We're social: ",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: isMobile ? 50.sp : 22.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(width: spacing),
      InkWell(
        onTap: () {},
        child: Image.asset("assets/images/youtube-icon.png",
            width: iconSize, height: iconSize),
      ),
      SizedBox(width: spacing),
      InkWell(
        onTap: () {},
        child: Image.asset("assets/images/threads-icon.png",
            width: iconSize, height: iconSize),
      ),
      SizedBox(width: spacing),
      InkWell(
        onTap: () {},
        child: Image.asset("assets/images/facebook-icon.png",
            width: iconSize, height: iconSize),
      ),
      SizedBox(width: spacing),
      InkWell(
        onTap: () {},
        child: Image.asset("assets/images/x-icon.png",
            width: iconSize, height: iconSize),
      ),
      SizedBox(width: spacing),
      InkWell(
        onTap: () {},
        child: Image.asset("assets/images/instagram-icon.png",
            width: iconSize, height: iconSize),
      ),
    ];
  }

  /// Contact Form Section.
  Widget _buildContactForm({required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/brosd-logo.png',
          width: isMobile ? 200.w : 147.w,
        ),
        Text(
          "Speak to our Team",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isMobile ? 60.sp : 32.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 7.h),
        _customTextField("Full Name", isMobile),
        SizedBox(height: 10.h),
        _customTextField("Address", isMobile),
        SizedBox(height: 10.h),
        _customTextField("Email", isMobile),
        SizedBox(height: 10.h),
        _customTextField("Phone Number", isMobile),
        SizedBox(height: 17.h),
        SizedBox(
          width: isMobile ? 150.w : 111.w,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: isMobile ? 12.h : 8.h),
              decoration: BoxDecoration(
                color: AppColors.secondaryRed,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFCBD6FF).withOpacity(0.16),
                    spreadRadius: 7,
                    blurRadius: 19.1,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                "Submit",
                style: GoogleFonts.monda(
                  color: Colors.white,
                  fontSize: isMobile ? 20.sp : 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Custom TextField.
  Widget _customTextField(String hint, bool isMobile) {
    return SizedBox(
      height: isMobile ? 70.h : 56.h,
      width: isMobile ? double.infinity : 343.w,
      child: TextField(
        style: GoogleFonts.poppins(
          fontSize: isMobile ? 35.sp : 13.sp,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
            color: const Color(0xFF898A8D),
            fontWeight: FontWeight.w400,
            fontSize: isMobile ? 40.sp : 16.sp,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.r),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        ),
      ),
    );
  }

  /// Map Section.
  Widget _buildMapSection(double? width) {
    return Container(
      padding: EdgeInsets.only(top: 11.h),
      child: Image.asset(
        "assets/images/map.png",
        fit: BoxFit.contain,
        width: width,
      ),
    );
  }

  /// Fast Links Section.
  Widget _buildFastLinks(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Fast Links",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isMobile ? 50.sp : 22.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 20.h),
        _linkItem("Careers", isMobile),
        _linkItem("Contact Us", isMobile),
        _linkItem("WebApp", isMobile),
        _linkItem("FAQs", isMobile),
        _linkItem("About Us", isMobile),
        InkWell(
          onTap: () {},
          child: Text(
            "Download App",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: isMobile ? 50.sp : 22.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _linkItem(String title, bool isMobile) {
    return Padding(
      padding: EdgeInsets.only(bottom: isMobile ? 10.h : 8.h),
      child: InkWell(
        onTap: () {},
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isMobile ? 50.sp : 22.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
