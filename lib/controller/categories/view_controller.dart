import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/functions/handlingData.dart';
import 'package:adminapp/data/model/categoriesmodel.dart';
import 'package:adminapp/data/remote/categories/categories_data.dart';
import 'package:get/get.dart';

class CategoriesViewController extends GetxController{
  CategoriesData categoriesData=CategoriesData(Get.find());
   List<Categoriesmodel> data=[];
   late StatusRequest statusRequest;
   getData()async{
    statusRequest=StatusRequest.loading;
    var response=await categoriesData.getData();
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
      List listdata=response['data'];
      data.addAll(listdata.map((e)=>Categoriesmodel.fromJson(e)));
    }else{
      statusRequest=StatusRequest.failure;
    }
    }
    update();
   }
   goToEditPage(Categoriesmodel categorieModel){
    Get.toNamed(AppRoute.categoriesedit,arguments: {"categorieModel":categorieModel});
   }
   deleteCategorey(String id,String imagename){
   categoriesData.delete({"id":id,"imagename":imagename});
   data.removeWhere((element)=>element.categoriesId == id);
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