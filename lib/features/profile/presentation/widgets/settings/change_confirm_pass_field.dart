


import 'package:flutter/material.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/services/internet_connection_service.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../../../../core/widgets/no_internet_connection_dialog.dart';
import '../../cubits/change_password_cubit/change_password_cubit.dart';
import '../../../../../core/utils/app_colors.dart';

class ChangeConfirmPasswordField extends StatelessWidget {
  const ChangeConfirmPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'confirmPasswordChangePassword'.tr(context),
        childWidget: CustomOutlineTextField(
            maxLines: 1,
            keyboardType: TextInputType.text,
            obscureText: ChangePasswordCubit.get(context).confirmPasswordObscure,
            suffixIcon: GestureDetector(
                onTap: ()
                {
                  ChangePasswordCubit.get(context).changeConfirmPasswordIconShape();
                },
                child: Icon(ChangePasswordCubit.get(context).confirmPasswordIcon,color: AppColors.cB4B9CA)),
            onFieldSubmitted: (value)
            {
              onSubmittedAction(context);
            },
            validator: (value)
            {
              if(value!.isEmpty)
              {
                return 'pleaseConfirmYourNewPassword'.tr(context);
              }
              if(value.length<6)
              {
                return 'passwordMustLeast6'.tr(context);
              }
              if(value!=ChangePasswordCubit.get(context).newPasswordController.text)
              {
                return 'passwordsDoNotMatch'.tr(context);
              }
              else
              {
                return null;
              }
            },
            controller: ChangePasswordCubit.get(context).confirmPasswordController));
  }

  void onSubmittedAction(BuildContext context) async
  {
    if (await InternetConnectionCheckingService.checkInternetConnection() ==
        true) {
      if (ChangePasswordCubit.get(context)
          .changePasswordFormKey
          .currentState!
          .validate()) {
        ChangePasswordCubit.get(context)
            .changePasswordFormKey
            .currentState!
            .save();
        ChangePasswordCubit.get(context).changePasswordFun(
            oldPassword:
                ChangePasswordCubit.get(context).oldPasswordController.text,
            newPassword:
                ChangePasswordCubit.get(context).newPasswordController.text,
            confirmPassword: ChangePasswordCubit.get(context)
                .confirmPasswordController
                .text);
      } else {
        ChangePasswordCubit.get(context)
            .activateChangePasswordAutoValidateMode();
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => NoInternetConnectionDialog(),
      );
    }
  }
}
