import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class TopProfessionals extends StatefulWidget {
  const TopProfessionals({super.key});

  @override
  State<TopProfessionals> createState() => _TopProfessionalsState();
}

class _TopProfessionalsState extends State<TopProfessionals> {
  final ScrollController _scrollController = ScrollController();

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

  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    // Start auto scroll after first frame if not mobile.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (MediaQuery.of(context).size.width >= 800) {
        _startAutoScroll();
      }
    });
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(Duration(seconds: 3), (_) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.position.pixels;
        double nextScroll = currentScroll + 100;
        if (nextScroll > maxScroll) {
          nextScroll = 0;
        }
        _scrollController.animateTo(
          nextScroll,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile = constraints.maxWidth < 800;
      return isMobile
          ? _buildMobileLayout(context)
          : _buildDesktopLayout(context);
    });
  }

  /// Desktop layout: Horizontal scrolling row with animated cards.
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
            controller: _scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              children: professionals.map((pro) {
                int index = professionals.indexOf(pro);
                return _buildProfessionalCardDesktop(pro)
                    .animate(delay: (index * 100).ms)
                    .slideY(begin: 0.3, end: 0)
                    .fadeIn(duration: 600.ms);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// Mobile layout: Grid of cards with animated appearance.
  Widget _buildMobileLayout(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 50.h),
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
            physics: NeverScrollableScrollPhysics(),
            itemCount: professionals.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 50.w,
              mainAxisSpacing: 40.h,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return _buildProfessionalCardMobile(professionals[index])
                  .animate(delay: (index * 100).ms)
                  .slideY(begin: 0.3, end: 0)
                  .fadeIn(duration: 600.ms);
            },
          ),
        ],
      ),
    );
  }

  /// Professional card for Desktop layout.
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
        color: const Color(0xFFEEE7E7),
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
              color: const Color(0xFF808080),
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

  /// Professional card for Mobile layout.
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
          Image.asset(pro['image']!),
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
