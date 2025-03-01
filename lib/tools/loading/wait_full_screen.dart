import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaitFullScreen extends StatelessWidget {
  const WaitFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(),
            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white70),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Text(
                  'connection_Wait'.tr,
                  style: TextStyle(fontStyle: FontStyle.italic),
                )),
          ],
        ),
      ),
    );
    // return InkWell(
    //   onDoubleTap: ()=> Navigator.of(context).pop(),
    //   onLongPress: ()=> Navigator.pop(context),
    //   child: ,
    // );
  }
}

class Wait extends StatelessWidget {
  const Wait({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircularProgressIndicator(),
          const SizedBox(height: 10),
          Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text('connection_Wait'.tr)),
        ],
      ),
    );
  }
}

class LoadingBallBeatIndicator extends StatelessWidget {
  const LoadingBallBeatIndicator( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50, //280
          child: const CircularProgressIndicator()),
    );
    //return const Center( child: CircularProgressIndicator(), );
    /*return Center(
      child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50, //280
          child: Loading(
              indicator: BallBeatIndicator(),
              size: 60.0,
              color: Theme.of(context).colorScheme.secondary)),
    );*/
  }
}


