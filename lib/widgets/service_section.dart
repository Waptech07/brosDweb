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
    return Container(
      color: AppColors.background,
      padding: EdgeInsets.only(
        left: 157.w,
        top: 59.h,
        right: 156.28.w,
        bottom: 40.89.h,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
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
                  mainAxisSpacing: 15.h,
                  crossAxisSpacing: 39.55.w,
                ),
                itemBuilder: (context, index) {
                  final service = services[index];
                  return InkWell(
                      onTap: () {
                        if (service["title"] == "Construction and Building") {
                          _showConstructionServices(context);
                        } else {
                          // nothing yet
                        }
                      },
                      child: _buildServiceCard(service));
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildServiceCard(Map<String, String> service) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 177.45,
              width: 243.69.w,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(-4, 5),
                    blurRadius: 8,
                  ),
                ],
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  service["image"]!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 18.93.h),
            Text(
              service["title"]!,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.monda(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: Colors.black,
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
              service["rating"]!,
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

  /// Shows the construction jobs in a popup dialog
  void _showConstructionServices(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => const ServiceDialog(),
    );
  }
}
