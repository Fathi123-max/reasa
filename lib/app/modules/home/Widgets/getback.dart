import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetBackIcon extends StatelessWidget {
  const GetBackIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ));
  }
}
