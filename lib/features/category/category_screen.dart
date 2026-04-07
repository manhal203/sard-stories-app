import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sard/core/widgets/hex_to_color.dart';
import 'package:sard/routes/route_keys.dart';
import 'package:sizer/sizer.dart';
import 'package:sard/core/bloc/app_bloc.dart';
import 'package:sard/models/category_model.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final List<String> categoryColors = [
    "#FFF59D",
    "#E1BEE7",
    "#F8BBD0",
    "#B3E5FC",
    "#C8E6C9",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          switch (state) {
            case AppLoading _:
              return const Center(child: CircularProgressIndicator());

            case AppLoaded _:
              final categories = state.categories;

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final CategoryModel category = categories[index];
                    final color = hexToColor(
                      categoryColors[index % categoryColors.length],
                    );

                    return GestureDetector(
                      onTap: () {
                        context.push(
                          RouteKeys.categoryDetailScreen,
                          extra: category,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 3.h),
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            category.category,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            case AppError _:
              return Center(child: Text("Error: ${state.message}"));

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
