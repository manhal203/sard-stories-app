import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sard/models/category_model.dart';
import 'package:sard/routes/route_keys.dart';
import 'package:sizer/sizer.dart';

class DisplayAllStories extends StatelessWidget {
  final CategoryModel category;

  const DisplayAllStories({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(3.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.6,
      ),
      itemCount: category.stories.length,
      itemBuilder: (context, index) {
        final story = category.stories[index];

        return GestureDetector(
          onTap: () {
            context.push(RouteKeys.storyInfoScreen, extra: story.id);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: AnyImageView(
                  imagePath: story.image,
                  fit: BoxFit.cover,
                  errorWidget: Icon(Icons.error),
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                story.title,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
