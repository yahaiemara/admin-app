

import 'package:adminapp/data/remote/auth/order_data.dart';
import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/functions/handlingData.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/data/model/order.dart';

import 'package:get/get.dart';

class PendingControlle extends GetxController {
  OrderData orderData = OrderData(Get.find());
  MyServices myServices = Get.find();
  late OrderModel orderModel;
  List<OrderModel> data = [];
  late StatusRequest statusRequest;
  
  String PrintPaymenMethod(String val){
  if(val=="0"){
    return "Cash On Delivery";
}else{
  return "Payment Card";
}
  }
  String PrintDeliveryType(String val){
    if(val=="0"){
      return "Delivery";
    }else
    {
      return "Revice";
    }
  }
  String PrintStatus(String val){
    if(val=="2"){
      return "Waiting for approval";
    }else if(val=="3"){
      return "The Order is been Approved";
    }else if(val=="4"){
      return "It was received";
    }
    else{
      return "Archive";
    }
  }
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderData
        .vieworderpending();
        print("=====================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrderModel.fromJson(e)));
        
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
    approveorder(String orderid,String userid) async {
      data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderData
        .approve(orderid,userid);
        print("=====================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
     refrespage();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  refrespage(){
    getData();
  }
  @override
  void onInit() {
   getData();
    super.onInit();
  }
}
