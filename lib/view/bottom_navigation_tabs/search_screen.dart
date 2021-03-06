import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:get/get.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';
import 'package:hola/controller/search_screen_controller.dart';
import 'package:hola/view/after_login_screens/filter_screen.dart';
import 'package:hola/view/after_login_screens/likes_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreenController searchCtrl = Get.put(SearchScreenController());
  @override
  Widget build(BuildContext context) {
    CardController cardController;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(LikesScreen());
                      },
                      child: Image(
                        width: 38,
                        height: 38,
                        image: AssetImage("assets/images/your_likes.png"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(FilterScreen());
                      },
                      child: Image(
                        width: 122,
                        height: 32,
                        image: AssetImage("assets/images/filters_category.png"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: TinderSwapCard(
                    allowVerticalMovement: true,
                    swipeDown: true,
                    swipeUp: true,
                    stackNum: 5,
                    swipeEdge: 2,
                    maxWidth: MediaQuery.of(context).size.width + 1,
                    minWidth: MediaQuery.of(context).size.width / 2,
                    maxHeight: MediaQuery.of(context).size.height + 1,
                    minHeight: MediaQuery.of(context).size.height / 2,
                    cardBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.kffffff,
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                      )
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/Charlie.png")),
                                  )),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "Full-time Traveller, Foodie, Love to make new Friends, Always Sleeping.",
                              style: kInterText.copyWith(
                                fontSize: 15,
                                color: AppColors.kD8D8D8,
                                fontWeight: FontWeight.w500,
                              ),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/SuperLike.png"),
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Image(
                                      width: 100,
                                      height: 100,
                                      image: AssetImage(
                                          "assets/images/Cancel.png")),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Image(
                                      width: 100,
                                      height: 100,
                                      image:
                                          AssetImage("assets/images/Like.png")),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Image(
                                      height: 70,
                                      width: 70,
                                      image: AssetImage(
                                          "assets/images/Boost.png")),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    totalNum: 5,
                    cardController: cardController = CardController(),
                    orientation: AmassOrientation.BOTTOM,
                    swipeUpdateCallback:
                        (DragUpdateDetails details, Alignment align) {
                      /// Get swiping card's alignment
                      if (align.x < 0) {
                        //Card is LEFT swiping
                        print("Left swiped");
                      } else if (align.x > 0) {
                        //Card is RIGHT swiping
                        print("Right swiped");
                      }
                    },
                    swipeCompleteCallback:
                        (CardSwipeOrientation orientation, int index) {
                      /// Get orientation & index of swiped card!
                      return Container(
                        child: Text(
                          "No more profiles in this area",
                          style: kInterText.copyWith(
                            color: AppColors.kff4165.withOpacity(0.9),
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
