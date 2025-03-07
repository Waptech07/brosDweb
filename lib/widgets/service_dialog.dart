import 'package:brosd_web/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceDialog extends StatelessWidget {
  const ServiceDialog({Key? key}) : super(key: key);

  // list of sub services under Construction and Building
  final List<Map<String, String>> subServices = const [
    {
      "title": "Bricklayers",
      "rating": "4",
      "image": "assets/images/bricklayer.png"
    },
    {
      "title": "Carpenters",
      "rating": "4",
      "image": "assets/images/carpenter.png"
    },
    {
      "title": "Civil Engineering",
      "rating": "4",
      "image": "assets/images/civil-engineer.png"
    },
    {
      "title": "Plumbers",
      "rating": "4",
      "image": "assets/images/plumber.png",
    },
    {
      "title": "Welders",
      "rating": "4",
      "image": "assets/images/welder.png",
    },
    {
      "title": "Tilers",
      "rating": "4",
      "image": "assets/images/tilers.png",
    },
    {
      "title": "Painter",
      "rating": "4",
      "image": "assets/images/painter.png",
    },
    {
      "title": "POP Screeding",
      "rating": "4",
      "image": "assets/images/pop-screeding.png"
    },
    {
      "title": "Concrete Work",
      "rating": "4",
      "image": "assets/images/concrete-work.png"
    },
    {
      "title": "Scaffolding",
      "rating": "4",
      "image": "assets/images/scaffolding.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black.withOpacity(0.75),
      insetPadding: EdgeInsets.zero,
      child: Center(
        child: Container(
          width: 750.69.w,
          height: 997.h,
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Construction and Building",
                      style: GoogleFonts.monda(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: GridView.builder(
                        itemCount: subServices.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 0.h,
                          crossAxisSpacing: 20.w,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          final subService = subServices[index];
                          return _buildSubServiceCard(subService);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds each subService card in the grid
  Widget _buildSubServiceCard(Map<String, String> subService) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 157.86.h,
              width: 216.8.w,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  subService["image"]!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 18.93.h),
            Text(
              subService["title"]!,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.monda(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Positioned(
          top: -10.h,
          right: -10.w,
          child: CircleAvatar(
            radius: 38.r,
            backgroundColor: AppColors.primaryGreen,
            child: Text(
              subService["rating"]!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
