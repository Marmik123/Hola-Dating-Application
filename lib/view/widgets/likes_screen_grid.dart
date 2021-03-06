import 'package:flutter/material.dart';
import 'package:hola/app_config/app_colors.dart';
import 'package:hola/app_config/app_config.dart';

class LikesScreenGrid extends StatelessWidget {
  const LikesScreenGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 10,
          childAspectRatio: 20 / 27,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      child: Image(
                          image: NetworkImage(
                              "https://via.placeholder.com/150")),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Humble  ",
                          style: kInterText.copyWith(
                            fontSize: 16,
                            color: AppColors.k000000,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "20 km away  ",
                          style: kInterText.copyWith(
                            fontSize: 14,
                            color: AppColors.kB5B5B5.withOpacity(0.9),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: 10,
                bottom: 50,
                child: Image(
                  height: 40,
                  width: 40,
                  image: AssetImage("assets/images/like_back.png"),
                ),
              ),
            ],
          );
        });
  }
}
