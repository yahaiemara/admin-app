import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/functions/handlingData.dart';
import 'package:adminapp/data/model/itemsmodel.dart';
import 'package:adminapp/data/remote/items/categories_data.dart';
import 'package:get/get.dart';

class ItemsViewController extends GetxController{
  ItemsData itemsData=ItemsData(Get.find());
   List<Itemsmodel> data=[];
   late StatusRequest statusRequest;
   getData()async{
    statusRequest=StatusRequest.loading;
    var response=await itemsData.getData();
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
      List listdata=response['data'];
      data.addAll(listdata.map((e)=>Itemsmodel.fromJson(e)));
    }else{
      statusRequest=StatusRequest.failure;
    }
    }
    update();
   }
   goToEditPage(Itemsmodel itemsmModel){
    Get.toNamed(AppRoute.Itemsedit,arguments: {"itemsmModel":itemsmModel});
   }
   deleteitems(String id,String imagename){
   itemsData.delete({"id":id,"imagename":imagename});
   data.removeWhere((element)=>element.itemsId == id);
   update();
   }
   myback(){
    Get.offAllNamed(AppRoute.home);
    return Future.value(false);
   }
   @override
  void onInit() {
    getData();
    super.onInit();
  }
}