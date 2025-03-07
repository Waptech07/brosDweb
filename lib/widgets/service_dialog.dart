import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class ServiceDialog extends StatelessWidget {
  final String title;
  final List<Map<String, String>> subServices;

  const ServiceDialog({
    Key? key,
    required this.title,
    required this.subServices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;
    double dialogWidth =
        isMobile ? MediaQuery.of(context).size.width * 0.95 : 750.69.w;
    double dialogHeight =
        isMobile ? MediaQuery.of(context).size.height * 0.8 : 997.h;

    return Dialog(
      backgroundColor: Colors.black.withOpacity(0.75),
      insetPadding: EdgeInsets.zero,
      child: Center(
        child: Container(
          width: dialogWidth,
          height: dialogHeight,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.monda(
                        fontSize: isMobile ? 50.sp : 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: subServices.isNotEmpty
                          ? GridView.builder(
                              itemCount: subServices.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: isMobile ? 2 : 3,
                                mainAxisSpacing: 20.h,
                                crossAxisSpacing: 30.w,
                                childAspectRatio: 0.7,
                              ),
                              itemBuilder: (context, index) {
                                final subService = subServices[index];
                                return _buildSubServiceCard(subService, isMobile);
                              },
                            )
                          : Center(
                              child: Text(
                                "Coming Soon",
                                style: GoogleFonts.monda(
                                  fontSize: isMobile ? 40.sp : 24.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              // Close Button
              Positioned(
                top: 10.h,
                right: 10.w,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close,
                    color: Colors.red,
                    size: isMobile ? 50.sp : 30.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds each sub-service card in the grid.
  Widget _buildSubServiceCard(Map<String, String> subService, bool isMobile) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: isMobile ? 220 : 157.86,
              width: isMobile ? double.infinity : 216.8.w,
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
            SizedBox(height: isMobile ? 40.h : 18.93.h),
            Text(
              subService["title"]!,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.monda(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 30.sp : 18.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Positioned(
          top: isMobile ? -20.h : -10.h,
          right: isMobile ? -20.w : -10.w,
          child: CircleAvatar(
            radius: isMobile ? 50.r : 38.r,
            backgroundColor: AppColors.primaryGreen,
            child: Text(
              subService["rating"]!,
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 40.sp : 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
