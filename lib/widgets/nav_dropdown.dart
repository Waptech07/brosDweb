import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class NavDropdown extends StatelessWidget {
  final String title;
  final bool isDropdown;
  final VoidCallback? onTap;

  const NavDropdown({
    Key? key,
    required this.title,
    required this.isDropdown,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isDropdown) {
      return PopupMenuButton<String>(
        tooltip: "",
        onSelected: (value) {
          if (onTap != null) onTap!();
        },
        itemBuilder: (context) => [
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
        child: _itemContent(showDropdown: true),
      );
    } else {
      return InkWell(
        onTap: onTap,
        child: _itemContent(showDropdown: false),
      );
    }
  }

  Widget _itemContent({required bool showDropdown}) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.monda(
            fontSize: 50.62.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        if (showDropdown) ...[
          SizedBox(width: 1.75.w),
          Icon(
            Icons.arrow_drop_down_rounded,
            color: Colors.white,
            size: 50.62.sp,
          ),
        ],
      ],
    );
  }
}
