import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'constants.dart';

Widget aboutWriters(String first,String second){
  return Row(
    children: [
      SizedBox(
        width: 3.w,
      ),
      Text(first,
        style: TextStyle(color: Colors.white, fontSize: 11.sp),),
      SizedBox(
        width: 4.w,
      ),
      SizedBox(
        width: 80.w,
        child: Text(second,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: mavi, fontSize: 11.sp),),
      ),
    ],
  );
}