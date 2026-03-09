import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/global/utils/dimentions/spacings.dart';
import 'package:sonora/global/utils/themes/app_colors.dart';

class ArtistChip extends StatefulWidget {
  final String name;
  final String imageUrl;
  const ArtistChip({required this.name, required this.imageUrl, super.key});

  @override
  State<ArtistChip> createState() => _ArtistChipState();
}

class _ArtistChipState extends State<ArtistChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _hovered = true),
      onTapUp: (_) => setState(() => _hovered = false),
      onTapCancel: () => setState(() => _hovered = false),
      child: SizedBox(
        width: 100.w,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 92.w,
              height: 92.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _hovered ? AppColors.cSpotifyGreen : AppColors.cTransparent,
                  width: 2.5.w,
                ),
              ),
              padding: const EdgeInsets.all(3),
              child: ClipOval(
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(color: AppColors.cSlate700),
                ),
              ),
            ),
            Spacing.vertical(8),
            Text(
              widget.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.cTextPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
