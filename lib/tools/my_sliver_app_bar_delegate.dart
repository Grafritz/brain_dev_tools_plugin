import 'package:flutter/material.dart';

class MySliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  MySliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      //color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(MySliverAppBarDelegate oldDelegate) {
    return false;
  }
}
