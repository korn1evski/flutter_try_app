import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lesson2/cubit/app_cubit_states.dart';
import 'package:flutter_lesson2/misc/colors.dart';
import 'package:flutter_lesson2/widgets/app_buttons.dart';
import 'package:flutter_lesson2/widgets/app_text.dart';
import 'package:flutter_lesson2/widgets/responsive_button.dart';
import '../cubit/app_cubits.dart';
import '../widgets/app_large_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('http://mark.bslmeiyu.com/uploads/' + detail.place.img),
                          fit: BoxFit.cover,
                        )),
                  )),
              Positioned(
                top: 50,
                left: 20,
                child: IconButton(
                    onPressed: () {
                      BlocProvider.of<AppCubits>(context).goHome();
                    },
                    icon: Icon(Icons.menu),
                    color: Colors.white),
              ),
              Positioned(
                top: 50,
                right: 20,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                    color: Colors.white),
              ),
              Positioned(
                  top: 320,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(25)),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppLargeText(
                                    text: detail.place.name,
                                    size: 28,
                                    color: Colors.black54.withOpacity(0.8)),
                                AppLargeText(
                                    text: '\$' + detail.place.price.toString(),
                                    color: AppColors.mainColor,
                                    size: 28),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: AppColors.mainColor),
                                SizedBox(
                                  width: 5,
                                ),
                                AppText(
                                    text: detail.place.location,
                                    color: AppColors.textColor1),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Wrap(
                                    children: List.generate(5, (index) {
                                      return Icon(Icons.star,
                                          color: index < detail.place.stars
                                              ? AppColors.starColor
                                              : AppColors.textColor2);
                                    })),
                                SizedBox(
                                  width: 10,
                                ),
                                AppText(
                                  text: "(${detail.place.stars}.0)",
                                  color: AppColors.textColor2,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            AppLargeText(
                                text: "People",
                                color: Colors.black.withOpacity(0.8),
                                size: 20),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(
                                text: "Number of people in your group",
                                color: AppColors.mainTextColor),
                            SizedBox(
                              height: 10,
                            ),
                            Wrap(
                              children: List.generate(5, (index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                      print(selectedIndex);
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: AppButtons(
                                      backgroundColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      size: 50,
                                      borderColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      text: (index + 1).toString(),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AppLargeText(
                                text: 'Description',
                                color: Colors.black.withOpacity(0.8),
                                size: 20),
                            SizedBox(
                              height: 10,
                            ),
                            AppText(
                                text:
                                detail.place.decsription,
                                color: AppColors.mainTextColor),
                          ],
                        ),
                      ))),
              Positioned(
                bottom: 30,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                      color: AppColors.textColor2,
                      backgroundColor: Colors.white,
                      size: 60,
                      borderColor: AppColors.textColor1,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ResponsiveButton(
                      isResponsive: true,
                    )
                  ],
                ),
              )
            ]),
          ));
    });
  }
}
