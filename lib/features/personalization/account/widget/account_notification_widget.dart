import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountNotificationWidget extends StatelessWidget {
  const AccountNotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Stack(
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            alignment: Alignment.center,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(
                side: BorderSide(width: 0.50, color: Color(0xFFC2C7D6)),
              ),
            ),
          ),
          const Center(child: Icon(Icons.notifications_none_outlined)),
          Positioned(
            left: 21,
            top: 0,
            child: Container(
              width: 6,
              height: 6,
              decoration: const ShapeDecoration(
                color: Color(0xFFD12B2F),
                shape: OvalBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
