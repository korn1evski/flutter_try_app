import 'package:flutter/material.dart';
import 'package:flutter_lesson2/misc/colors.dart';

import 'app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double? width;


  const ResponsiveButton({Key? key, this.isResponsive = false, this.width = 120}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            isResponsive ? Container(margin: const EdgeInsets.only(left: 20), child: AppText(text: "Book Trip Now", color: Colors.white)) : Container(),
            Image.asset('img/button-one.png'),

          ],
        )
      ),
    );
  }
}
