import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constant/imageasset.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class Handlingdataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const Handlingdataview({super.key, required this.statusRequest, required this.widget});


  @override
  Widget build(BuildContext context) {
    return statusRequest==StatusRequest.loading?  Center(child:Lottie.asset(AppImageAsset.loading,width: 250,height: 250) ,)
    :statusRequest==StatusRequest.serverfailure?  Center(child:Lottie.asset(AppImageAsset.notfound),)
    :statusRequest==StatusRequest.offlinefailure? Center(child: Lottie.asset(AppImageAsset.failure),)
    :statusRequest==StatusRequest.failure? Center(child: Lottie.asset(AppImageAsset.nodata),)
    :widget;
  }
}

class Handlingdatarequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const Handlingdatarequest({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest==StatusRequest.loading?  Center(child:Lottie.asset(AppImageAsset.loading,width: 250,height: 250) ,)
    :statusRequest==StatusRequest.serverfailure?  Center(child:Lottie.asset(AppImageAsset.notfound),)
    :statusRequest==StatusRequest.offlinefailure? Center(child: Lottie.asset(AppImageAsset.failure),)
    :widget;
  }
}