import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget leadingImage(String path) {
  return SizedBox(
    width: 10.w,
    height: 10.h,
    child: Image.network(
      path,
      fit: BoxFit.cover,
    ),
  );
}

Widget subTitleRow(String point, String year) {
  return Row(
    children: [
      Text(
        year,
        style: TextStyle(color: Colors.white, fontSize: 12.sp),
      ),
      SizedBox(
        width: 3.w,
      ),
      Text(
        point,
        style: TextStyle(color: Colors.white, fontSize: 12.sp),
      ),
    ],
  );
}

Widget titleText(String title) {
  return Text(
    title,
    style: TextStyle(color: Colors.white, fontSize: 14.sp),
  );
}
