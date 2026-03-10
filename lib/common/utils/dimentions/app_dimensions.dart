import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimensions {
  static final double xxs = 4.r;
  static final double xs = 8.r;
  static final double sm = 12.r;
  static final double md = 16.r;
  static final double lg = 20.r;
  static final double xl = 24.r;
  static final double xxl = 32.r;

  static final REdgeInsets paddingAllXs = REdgeInsets.all(xs);
  static final REdgeInsets paddingAllSm = REdgeInsets.all(sm);
  static final REdgeInsets paddingAllMd = REdgeInsets.all(md);

  static final REdgeInsets paddingHorizontalXs = REdgeInsets.symmetric(
    horizontal: xs,
  );
  static final REdgeInsets paddingHorizontalSm = REdgeInsets.symmetric(
    horizontal: sm,
  );
  static final REdgeInsets paddingHorizontalMd = REdgeInsets.symmetric(
    horizontal: md,
  );

  static final REdgeInsets paddingVerticalXs = REdgeInsets.symmetric(
    vertical: xs,
  );
  static final REdgeInsets paddingVerticalSm = REdgeInsets.symmetric(
    vertical: sm,
  );
  static final REdgeInsets paddingVerticalMd = REdgeInsets.symmetric(
    vertical: md,
  );
}
