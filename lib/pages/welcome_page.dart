import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lesson2/cubit/app_cubits.dart';
import 'package:flutter_lesson2/widgets/app_large_text.dart';
import 'package:flutter_lesson2/widgets/app_text.dart';
import '../misc/colors.dart';
import '../widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
      'welcome-one.png',
      'welcome-two.png',
      'welcome-three.png',
  ];

  List headers1 = [
    'Trips', 'Discover', 'Every object',
  ];

  List headers2 = [
    'Mountain', 'Something new', 'Something special',
  ];

  List texts = [
    'Mountain hikes give you an incredible sense of freedom along with endurance tests',
    'You can read very interesting information here',
    'With the help of trips you can feel really better',
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "img/" + images[index]
                    ),
                    fit: BoxFit.cover
                  )
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            AppLargeText(text: headers1[index]),
                            AppText(text: headers2[index], size: 30),
                            SizedBox(height: 20),
                            Container(
                              width: 250,
                              child: AppText(
                                text: texts[index],
                                color: AppColors.textColor2,
                                size: 14
                              )
                            ),
                            SizedBox(height: 40),
                            GestureDetector(
                              onTap: (){
                                BlocProvider.of<AppCubits>(context).getData();
                              },

                              child: Container(
                                width: 200,
                                  child: Row(children: [ResponsiveButton(width: 120),])),
                            ),
                        ]
                      ),
                      Column(
                        children: List.generate(3, (indexDots) {
                         return  Container(
                                margin: const EdgeInsets.only(bottom: 2),
                                width: 8,
                                height: indexDots == index ? 25 : 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: indexDots == index ? AppColors.mainColor.withOpacity(0.3) : AppColors.mainColor,
                                ),
                        );}
                        ),
                      )
                    ],
                  ),
                ),
              );
          }),
    );
  }
}
