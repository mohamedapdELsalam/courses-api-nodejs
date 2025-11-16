import 'package:courses_app/core/classes/status_request.dart';
import 'package:courses_app/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HandlingStatusRequestWithData extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingStatusRequestWithData({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.none
        ? widget
        : statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
              LottiesAssets.loadingCyan,
              width: 150,
              height: 150,
            ),
          )
        : statusRequest == StatusRequest.serverFailure
        ? Center(
            child: Lottie.asset(LottiesAssets.unknown, width: 200, height: 200),
          )
        : statusRequest == StatusRequest.success
        ? widget
        : Center(
            child: Column(
              children: [
                Lottie.asset(LottiesAssets.offline),
                Text("no internet "),
                TextButton(
                  child: Text("try again"),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          );
  }
}

class HandlingStatusRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final controller;
  const HandlingStatusRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.none
        ? widget
        : statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
              LottiesAssets.loadingCyan,
              width: 150,
              height: 150,
            ),
          )
        :
          // : statusRequest == StatusRequest.serverFailure
          // ? Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Lottie.asset(LottiesAssets.unknown, width: 200, height: 200),
          //         TextButton(
          //           child: Text("back"),
          //           onPressed: () {
          //             controller.resetStatus();
          //           },
          //         ),
          //       ],
          //     ),
          //   )
          widget;
    // statusRequest == StatusRequest.fail
    // ? Center(
    //     child: Column(
    //       children: [
    //         Lottie.asset(LottiesAssets.noDataText),
    //         TextButton(
    //           child: Text("back"),
    //           onPressed: () {
    //             controller.resetStatus();
    //           },
    //         ),
    //       ],
    //     ),
  }
}
