import 'package:brosd_web/widgets/service_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class ServiceSection extends StatelessWidget {
  ServiceSection({super.key});

  final List<Map<String, String>> services = [
    {
      "title": "Construction and Building",
      "image": "assets/images/construction.png",
      "rating": "4",
    },
    {
      "title": "Domestic Services",
      "image": "assets/images/domestic.png",
      "rating": "4",
    },
    {
      "title": "Unskilled Processes",
      "image": "assets/images/unskilled.png",
      "rating": "4",
    },
    {
      "title": "Event Planning\n& Management",
      "image": "assets/images/event-planning.png",
      "rating": "4",
    },
    {
      "title": "Mechanical",
      "image": "assets/images/mechanical.png",
      "rating": "4",
    },
    {
      "title": "Craftsmanship",
      "image": "assets/images/craftsmanship.png",
      "rating": "4",
    },
    {
      "title": "Home Services",
      "image": "assets/images/home-service.png",
      "rating": "4",
    },
    {
      "title": "Electronics",
      "image": "assets/images/electronics.png",
      "rating": "4",
    },
    {
      "title": "Creative",
      "image": "assets/images/creative.png",
      "rating": "4",
    },
    {
      "title": "Engineering",
      "image": "assets/images/engineering.png",
      "rating": "4",
    },
    {
      "title": "Logistic",
      "image": "assets/images/logistic.png",
      "rating": "4",
    },
    {
      "title": "Electrical",
      "image": "assets/images/electrical.png",
      "rating": "4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Three breakpoints:
        bool isDesktop = constraints.maxWidth >= 1200;
        bool isTablet =
            constraints.maxWidth < 1200 && constraints.maxWidth >= 600;
        bool isMobile = constraints.maxWidth < 600;

        if (isDesktop) {
          return _buildDesktopLayout(context);
        } else if (isTablet) {
          return _buildTabletLayout(context);
        } else {
          return _buildMobileLayout(context);
        }
      },
    );
  }

  // Desktop Layout
  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: EdgeInsets.only(
        left: 157.w,
        top: 59.h,
        right: 156.28.w,
        bottom: 40.89.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Services Categories",
            style: GoogleFonts.poppins(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryRed,
            ),
          ),
          SizedBox(height: 20.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 20.h,
              crossAxisSpacing: 19.55.w,
            ),
            itemBuilder: (context, index) {
              final service = services[index];
              return InkWell(
                onTap: () {
                  if (service["title"] == "Construction and Building") {
                    _showConstructionServices(context);
                  }
                },
                child: _buildServiceCard(service, layout: 'desktop'),
              );
            },
          ),
        ],
      ),
    );
  }

  // Tablet Layout
  Widget _buildTabletLayout(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Services Categories",
            style: GoogleFonts.poppins(
              fontSize: 45.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryRed,
            ),
          ),
          SizedBox(height: 20.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 20.h,
              crossAxisSpacing: 30.w,
            ),
            itemBuilder: (context, index) {
              final service = services[index];
              return InkWell(
                onTap: () {
                  if (service["title"] == "Construction and Building") {
                    _showConstructionServices(context);
                  }
                },
                child: _buildServiceCard(service, layout: 'tablet'),
              );
            },
          ),
        ],
      ),
    );
  }

  //Mobile Layout
  Widget _buildMobileLayout(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Services Categories",
            style: GoogleFonts.poppins(
              fontSize: 55.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryRed,
            ),
          ),
          SizedBox(height: 20.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.h,
              crossAxisSpacing: 50.w,
            ),
            itemBuilder: (context, index) {
              final service = services[index];
              return InkWell(
                onTap: () {
                  if (service["title"] == "Construction and Building") {
                    _showConstructionServices(context);
                  }
                },
                child: _buildServiceCard(service, layout: 'mobile'),
              );
            },
          ),
        ],
      ),
    );
  }

  // Reusable Service Card

  Widget _buildServiceCard(Map<String, String> service,
      {required String layout}) {
    double cardHeight;
    double cardWidth;
    double ratingCircleRadius;
    double ratingFontSize;
    double titleFontSize;
    double borderRadius;
    double imageFitHeight;
    double imageFitWidth;

    // Adjust styling based on layout
    switch (layout) {
      case 'desktop':
        cardHeight = 177.45;
        cardWidth = 243.69.w;
        ratingCircleRadius = 38.r;
        ratingFontSize = 18.sp;
        titleFontSize = 18.sp;
        borderRadius = 20.r;
        imageFitHeight = 177.45;
        imageFitWidth = 243.69.w;
        break;

      case 'tablet':
        cardHeight = 150;
        cardWidth = double.infinity;
        ratingCircleRadius = 30.r;
        ratingFontSize = 20.sp;
        titleFontSize = 20.sp;
        borderRadius = 15.r;
        imageFitHeight = 200.h;
        imageFitWidth = double.infinity;
        break;

      default: // mobile
        cardHeight = 150;
        cardWidth = double.infinity;
        ratingCircleRadius = 50.r;
        ratingFontSize = 30.sp;
        titleFontSize = 40.sp;
        borderRadius = 30.r;
        imageFitHeight = 150;
        imageFitWidth = double.infinity;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: cardHeight,
              width: cardWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x40000000),
                    offset: const Offset(-4, 5),
                    blurRadius: 8,
                  ),
                ],
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.asset(
                  service["image"]!,
                  fit: BoxFit.contain,
                  height: imageFitHeight,
                  width: imageFitWidth,
                ),
              ),
            ),
            SizedBox(height: layout == 'desktop' ? 18.93.h : 10.h),
            Text(
              service["title"]!,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.monda(
                fontWeight: FontWeight.bold,
                fontSize: titleFontSize,
                color: Colors.black,
              ),
            ),
          ],
        ),
        // Rating Circle
        Positioned(
          top: layout == 'desktop' ? -10.h : -20.h,
          right: layout == 'desktop' ? -10.w : -20.w,
          child: CircleAvatar(
            radius: ratingCircleRadius,
            backgroundColor: AppColors.primaryGreen,
            child: Text(
              service["rating"]!,
              style: TextStyle(
                color: Colors.white,
                fontSize: ratingFontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Show popup dialog for Construction & Building
  void _showConstructionServices(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => const ServiceDialog(),
    );
  }
}
