import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sard/core/widgets/hex_to_color.dart';
import 'package:sard/models/author_model.dart';
import 'package:sard/routes/route_keys.dart';
import 'package:sizer/sizer.dart';

class DisplayAuthors extends StatelessWidget {
  final List<AuthorModel> authors;
  const DisplayAuthors({super.key, required this.authors});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 2.h),
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            "Authors",
            style: TextStyle(
              fontSize: orientation == Orientation.portrait ? 18.sp : 16.sp,
              fontWeight: .w600,
            ),
          ),
        ),
        SizedBox(height: 1.h),
        SizedBox(
          height: orientation == Orientation.portrait ? 30.h : 120.h,
          child: CarouselSlider.builder(
            itemCount: authors.length,
            itemBuilder: (context, index, pageIndex) {
              final author = authors[index];
              return GestureDetector(
                onTap: () => context.push(
                  RouteKeys.authorInfoScreen,
                  extra: author.authorId,
                ),
                child: SizedBox(
                  width: 70.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: orientation == Orientation.portrait ? 65 : 45,
                        backgroundColor: hexToColor(author.color),
                        child: Icon(
                          Icons.person_outline_outlined,
                          size: orientation == Orientation.portrait ? 100 : 70,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        author.authorName,
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? 18.sp
                              : 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              viewportFraction: 0.5,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(milliseconds: 300),
              autoPlayCurve: Curves.easeInOut,
              enableInfiniteScroll: true,
            ),
          ),
        ),
      ],
    );
  }
}
//scrollDirection: Axis.horizontal,
       //     reverse: true,
            