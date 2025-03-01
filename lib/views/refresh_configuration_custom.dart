import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshConfigurationCustom extends StatelessWidget {
  const RefreshConfigurationCustom({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: RefreshConfiguration.copyAncestor(
        context: context,
        enableLoadingWhenFailed: true,
        headerBuilder: () => WaterDropMaterialHeader(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        footerTriggerDistance: 100,
        child: child,
      ),
    );
  }
}

class SmartRefresherCustom extends StatelessWidget {
  const SmartRefresherCustom({super.key,
    required this.child,
    required this.controller,
    this.onRefresh,
    this.onLoading,
    this.enablePullDown= true,
    this.enablePullUp= true,
    this.enableTwoLevel= false,
  });
  final Widget child;
  /// Controll inner state
  final RefreshController controller;
  /// callback when header refresh
  ///
  /// when the callback is happening,you should use [RefreshController]
  /// to end refreshing state,else it will keep refreshing state
  final VoidCallback? onRefresh;
  /// callback when footer loading more data
  ///
  /// when the callback is happening,you should use [RefreshController]
  /// to end loading state,else it will keep loading state
  final VoidCallback? onLoading;
  // This bool will affect whether or not to have the function of drop-up load.
  final bool enablePullUp;

  /// controll whether open the second floor function
  final bool enableTwoLevel;

  /// This bool will affect whether or not to have the function of drop-down refresh.
  final bool enablePullDown;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      key: key,//refreshKey,
      controller: controller,
      enablePullUp: enablePullUp,
      physics: const BouncingScrollPhysics(),
      footer: const ClassicFooter(loadStyle: LoadStyle.ShowAlways),
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: child
    );
  }
}
