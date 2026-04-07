import 'package:flutter/material.dart';
import 'package:sard/models/story_model.dart';
import 'package:sizer/sizer.dart';

class StoryScreen extends StatelessWidget {
  final StoryModel story;

  const StoryScreen({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          story.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(story.image),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.5),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.15),
                Card(
                  color: Color.fromARGB(
                    255,
                    244,
                    211,
                    162,
                  ).withValues(alpha: .85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Text(
                      story.content,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: orientation == Orientation.portrait
                            ? 18.sp
                            : 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 74, 38, 2),
                        height: 1.6,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
