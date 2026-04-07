import 'package:any_image_view/any_image_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sard/models/category_model.dart';
import 'package:sard/routes/route_keys.dart';
import 'package:sizer/sizer.dart';

class DisplayStories extends StatelessWidget {
  final CategoryModel category;

  const DisplayStories({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: orientation == Orientation.portrait ? 30.h : 120.h,
          child: CarouselSlider.builder(
            itemCount: category.stories.length,
            itemBuilder:
                (BuildContext context, int storyIndex, int pageViewIndex) {
                  final stories = category.stories[storyIndex];
                  return GestureDetector(
                    onTap: () {
                      int story = stories.id;
                      context.push(RouteKeys.storyInfoScreen, extra: story);
                    },
                    child: SizedBox(
                      width: 40.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AnyImageView(
                              imagePath: stories.image,
                              fit: BoxFit.cover,
                              errorWidget: Icon(Icons.error),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            stories.title,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: orientation == Orientation.portrait
                                  ? 14.sp
                                  : 16.sp,
                              fontWeight: .bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              viewportFraction: 0.40,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.linear,
              //enlargeCenterPage: true,
            ),
          ),
        ),
      ],
    );
  }
}
