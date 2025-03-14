import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

enum ShimmerType {
  carousel,
  listItem,
  categories,
  profileRecipes,
  users,
  cookbook
}

class ShimmerLoading extends StatelessWidget {
  final ShimmerType? type;
  final int? crossAxisCount;

  const ShimmerLoading({super.key, this.type, this.crossAxisCount});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ShimmerType.carousel:
        return _buildCarouselShimmer();
      case ShimmerType.listItem:
        return _buildRecipesShimmer();
      case ShimmerType.categories:
        return _buildCategoriesShimmer();
      case ShimmerType.profileRecipes:
        return _buildProfileRecipeShimmer(context, crossAxisCount!);
      case ShimmerType.users:
        return _buildUsersShimmer(context);
      case ShimmerType.cookbook:
        return _buildCookbookRecipeShimmer(context);
      default:
        return Container();
    }
  }

  _buildCarouselShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Shimmer.fromColors(
        baseColor: (Colors.grey[300])!,
        highlightColor: (Colors.grey[100])!,
        child: _container(double.infinity, 180, radius: 15),
      ),
    );
  }

  _buildRecipesShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Shimmer.fromColors(
        baseColor: (Colors.grey[300])!,
        highlightColor: (Colors.grey[100])!,
        child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  _container(
                    80,
                    80,
                    radius: 15,
                    margin: const EdgeInsets.only(top: 10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _container(
                        70,
                        15,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                      ),
                      _container(
                        200,
                        18,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),
                      ),
                      Row(
                        children: [
                          _container(
                            15,
                            15,
                            radius: 15,
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                          ),
                          _container(100, 15),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }

  _buildCategoriesShimmer() {
    return Shimmer.fromColors(
      baseColor: (Colors.grey[300])!,
      highlightColor: (Colors.grey[100])!,
      child: GridView.builder(
          itemCount: 10,
          padding: const EdgeInsets.all(15),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            return _container(200, 80);
          }),
    );
  }

  _buildProfileRecipeShimmer(BuildContext context, int crossAxisCount) {
    var queryData = MediaQuery.of(context);
    return Shimmer.fromColors(
      baseColor: (Colors.grey[300])!,
      highlightColor: (Colors.grey[100])!,
      child: GridView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio:
                queryData.size.width / queryData.size.height / 0.7,
            crossAxisSpacing: 6,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                _container(double.infinity, 100, radius: 15),
                _container(double.infinity, 20,
                    margin: const EdgeInsets.only(top: 5)),
              ],
            );
          }),
    );
  }

  _buildCookbookRecipeShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: (Colors.grey[300])!,
      highlightColor: (Colors.grey[100])!,
      child: AlignedGridView.count(
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
          itemBuilder: (context, index) {
            return Column(
              children: [
                _container(double.infinity, 120, radius: 15),
                _container(double.infinity, 20,
                    margin: const EdgeInsets.only(top: 10, bottom: 10)),
              ],
            );
          }),
    );
  }

  _container(double width, double height,
      {double radius = 0, EdgeInsetsGeometry? margin}) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  _buildUsersShimmer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Shimmer.fromColors(
        baseColor: (Colors.grey[300])!,
        highlightColor: (Colors.grey[100])!,
        child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  _container(
                    50,
                    50,
                    radius: 30,
                    margin: const EdgeInsets.only(top: 10),
                  ),
                  _container(
                    150,
                    18,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 6,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
