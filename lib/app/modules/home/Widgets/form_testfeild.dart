import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:reasa/app/data/constants.dart';
import 'package:reasa/app/data/typography.dart';

class FormTextFeild extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;
  final bool showHidePassIcon;
  final bool showCalenderIcon;
  bool? obsecureText = false;

  FormTextFeild(
      {Key? key,
      required this.controller,
      required this.textInputType,
      required this.hintText,
      required this.showHidePassIcon,
      required this.showCalenderIcon,
      this.obsecureText})
      : super(key: key);

  @override
  _FormTextFeildState createState() => _FormTextFeildState();
}

class _FormTextFeildState extends State<FormTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 380.w,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: TextField(
        maxLines: widget.obsecureText == null
            ? null
            : widget.obsecureText == true
                ? 1
                : null,
        expands: widget.obsecureText == null
            ? true
            : widget.obsecureText == true
                ? false
                : true,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        style: CustomTextStyle.kmedium.copyWith(
            color: CustomColor.kgrey900,
            fontWeight: CustomFontWeight.kSemiBoldFontWeight),
        obscureText: widget.obsecureText ?? false,
        readOnly: widget.showCalenderIcon,
        decoration: InputDecoration(
            //prefixIcon : Icon(widget.prefixicon, color: CustomColor.kgrey900, size: 15.sp),
            suffixIcon: widget.showHidePassIcon
                ? Icon(
                    IconlyLight.message,
                    color: CustomColor.kgrey900,
                    size: 18.sp,
                  )
                : Icon(
                    IconlyLight.password,
                    color: CustomColor.kgrey900,
                    size: 18.sp,
                  ),
            // : widget.showCalenderIcon
            //     ? Padding(
            //         padding: EdgeInsets.all(12.sp),
            //         child: InkWell(
            //           onTap: () async {
            //             final DateTime? picked = await showDatePicker(
            //               context: context,
            //               initialDate: DateTime.now(),
            //               firstDate: DateTime(1960),
            //               lastDate: DateTime(DateTime.now().year + 1),
            //               builder: (context, child) {
            //                 return Theme(
            //                     data: ThemeData.light().copyWith(
            //                       colorScheme: ColorScheme.light(
            //                         primary: CustomColor.kprimaryblue,
            //                         onPrimary: Colors.white,
            //                         surface: CustomColor.kbackgroundwhite,
            //                         onSurface: CustomColor.kbackgroundwhite,
            //                       ),
            //                       dialogBackgroundColor:
            //                           CustomColor.kbackgroundwhite,
            //                     ),
            //                     child: child!);
            //               },
            //             );
            //             if (picked != null) {
            //               setState(() {
            //                 widget.controller.text =
            //                     DateFormat('dd-MMM-yyyy')
            //                         .format(picked)
            //                         .toString();
            //               });
            //             }
            //           },
            //           child: Icon(
            //             IconlyLight.calendar,
            //             size: 18.sp,
            //             color: CustomColor.kgrey900,
            //           ),
            //         ),
            //       )
            //     : SizedBox(),
            hintText: widget.hintText,
            hintStyle: CustomTextStyle.kmedium.copyWith(
                color: CustomColor.kgrey500,
                fontWeight: CustomFontWeight.kRegularWeight),
            fillColor: CustomColor.kgrey50,
            filled: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.w),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: CustomColor.kprimaryblue),
                borderRadius: BorderRadius.circular(kContRadius)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(kContRadius)),
            disabledBorder: OutlineInputBorder(
                //borderSide: BorderSide(color: CustomColor.kprimaryblue),
                borderRadius: BorderRadius.circular(kContRadius)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: CustomColor.kblack),
                borderRadius: BorderRadius.circular(kContRadius))),
        cursorColor: CustomColor.kprimaryblue,
      ),
    );
  }
}
