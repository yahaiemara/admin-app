import 'dart:io';

import 'package:adminapp/core/class/curd.dart';
import 'package:adminapp/data/apiconnect/apiconnect.dart';

class ItemsData{
  Crud curd;
  ItemsData(this.curd);
  getData()async{
    var response=await curd.postData(Apiconnect.itemsview, {});
    return response.fold((l)=>l ,(r)=>r);
  }
add(Map data,File file)async{
    var response=await curd.addRequestWithImageOne(Apiconnect.itemsadd, data,file);
    return response.fold((l)=>l ,(r)=>r);
  }
edit(Map data,[File? file])async{
var response;
  if(file==null){
     response=await curd.postData(Apiconnect.itemsedit, data);
  }else{
     response=await curd.addRequestWithImageOne(Apiconnect.itemsedit, data,file);
   
  }
    return response.fold((l)=>l ,(r)=>r);
  }
delete(Map data)async{
    var response=await curd.postData(Apiconnect.itemsdelete, data);
    return response.fold((l)=>l ,(r)=>r);
  }

}
