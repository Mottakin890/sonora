import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/utils/dimentions/spacings.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';
import 'package:sonora/global/utils/widgets/app_network_image.dart';

class RecentSearchItem extends StatefulWidget {
  final String name;
  final String type;
  final String imageUrl;
  final VoidCallback onRemove;

  const RecentSearchItem({
    super.key,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.onRemove,
  });

  @override
  State<RecentSearchItem> createState() => _RecentSearchItemState();
}

class _RecentSearchItemState extends State<RecentSearchItem> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: _pressed ? AppColors.cWhite.withValues(alpha: .08) : AppColors.cTransparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            AppNetworkImage(
              imageUrl: widget.imageUrl,
              height: 48.r,
              width: 48.r,
              shape: BoxShape.circle,
            ),
            Spacing.horizontal(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: AppColors.cWhite,
                    ),
                  ),
                  Spacing.horizontal(2),
                  Text(
                    widget.type,
                    style: TextStyle(fontSize: 12.sp, color: AppColors.cGrey500),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: widget.onRemove,
              icon: Icon(Icons.close, size: 18.sp, color: AppColors.cGrey500),
              padding: const EdgeInsets.all(4),
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }
}
