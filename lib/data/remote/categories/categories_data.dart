import 'dart:io';

import 'package:adminapp/core/class/curd.dart';
import 'package:adminapp/data/apiconnect/apiconnect.dart';

class CategoriesData{
  Crud curd;
  CategoriesData(this.curd);
  getData()async{
    var response=await curd.postData(Apiconnect.categoriesview, {});
    return response.fold((l)=>l ,(r)=>r);
  }
add(Map data,File file)async{
    var response=await curd.addRequestWithImageOne(Apiconnect.categoriesadd, data,file);
    return response.fold((l)=>l ,(r)=>r);
  }
edit(Map data,[File? file])async{
var response;
  if(file==null){
     response=await curd.postData(Apiconnect.categoriesedit, data);
  }else{
     response=await curd.addRequestWithImageOne(Apiconnect.categoriesedit, data,file);
   
  }
    return response.fold((l)=>l ,(r)=>r);
  }
delete(Map data)async{
    var response=await curd.postData(Apiconnect.categoriesdelete, data);
    return response.fold((l)=>l ,(r)=>r);
  }

}
