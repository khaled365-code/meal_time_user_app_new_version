


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/commons/commons.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';

class PersonalInfoAppBar extends StatelessWidget {
  const PersonalInfoAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.cECF0F4,
            ),
            child: isArabic()==false?
            Center(
              child: SvgPicture.asset(
                  width: 8,
                  ImageConstants.arrowBackIcon,colorFilter: ColorFilter.mode(AppColors.c181C2E, BlendMode.srcIn)),
            ):
            Center(
              child: Transform.rotate(
                angle: 3.14159,
                child: SvgPicture.asset(
                    width: 8,
                    ImageConstants.arrowBackIcon,colorFilter: ColorFilter.mode(AppColors.c181C2E, BlendMode.srcIn)),
              ),
            ),
          ),
        ),
        SpaceWidget(width: 15,),
        Text('personalInfo'.tr(context), style: AppTextStyles.regular17(
            context).copyWith(color: AppColors.c181C2E),),
        Spacer(),
        GestureDetector(
          onTap: ()
          {
            navigate(context: context, route: Routes.editProfileScreen);
          },
          child: Text('edit'.tr(context), style: AppTextStyles.regular17(context).
          copyWith(color: AppColors.cFF7622),),
        ),
      ],
    );
  }
}
