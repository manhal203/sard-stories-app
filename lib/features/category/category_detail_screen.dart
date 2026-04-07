import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sard/models/category_model.dart';
import 'package:sard/routes/route_keys.dart';
import 'package:sizer/sizer.dart';

class CategoryDetailScreen extends StatelessWidget {
  final CategoryModel category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.category)),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: ListView.builder(
          itemCount: category.stories.length,
          itemBuilder: (context, index) {
            final stories = category.stories[index];
            return GestureDetector(
              onTap: () {
                int story = stories.id;
                context.push(RouteKeys.storyInfoScreen, extra: story);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 2.h),
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: AnyImageView(
                        imagePath: stories.image,
                        fit: BoxFit.cover,
                        errorWidget: Icon(Icons.error),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        stories.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
