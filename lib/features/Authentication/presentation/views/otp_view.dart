import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:testing2/core/app_colors.dart';
import 'package:testing2/core/core_widgets/custome_button.dart';
import 'package:testing2/features/Authentication/presentation/views/Successed_verify.dart';
import 'package:testing2/features/Authentication/presentation/views/forget_Password.dart';
import 'package:testing2/features/Authentication/presentation/widgets/resend_code.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 50.h,
      textStyle: TextStyle(
        fontSize: 20.sp,
        color: AppColors.primaryColor,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.primaryColor),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ForgetPassword()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18.sp,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Enter the code sent to your email",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Pinput(
                    length: 5,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: AppColors.primaryColor)),
                    ),
                  ),
                  // onCompleted: (pin) => debugPrint(pin),

                  SizedBox(height: 30.h),
                  CustomButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessedVerify()),
                      );
                    },
                    text: 'Verify',
                  ),
                  ResendCodeWidget(),
                  SizedBox(
                    height: 100.h,
                  )
                ])),
      ),
    );
  }
}
