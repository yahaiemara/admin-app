import 'package:adminapp/core/class/curd.dart';
import 'package:adminapp/data/apiconnect/apiconnect.dart';

class OrderData{
  Crud curd;
  OrderData(this.curd);
  vieworderaccepted()async{
    var response=await curd.postData(Apiconnect.viewaccepted, {});
    return response.fold((l)=>l ,(r)=>r);
  }
 vieworderpending()async{
    var response=await curd.postData(Apiconnect.viewpending, {});
    return response.fold((l)=>l ,(r)=>r);
  }
 approve(String orderid,String userid)async{
    var response=await curd.postData(Apiconnect.approve, {"orderid":orderid,"userid":userid});
    return response.fold((l)=>l ,(r)=>r);
  }
   orderviewdetails(String orderid)async{
    var response=await curd.postData(Apiconnect.approve, {"orderid":orderid});
    return response.fold((l)=>l ,(r)=>r);
  }
    archive()async{
    var response=await curd.postData(Apiconnect.archiveorder, {});
    return response.fold((l)=>l ,(r)=>r);
  }
     deleteData(String orderid)async{
    var response=await curd.postData(Apiconnect.deleteorder, {"orderid":orderid});
    return response.fold((l)=>l ,(r)=>r);
  }
      doneprepar(String orderid,String userid,String ordertype)async{
    var response=await curd.postData(Apiconnect.deleteorder, {"orderid":orderid,"userid":userid,"ordertype":ordertype});
    return response.fold((l)=>l ,(r)=>r);
  }
      detailsorder()async{
    var response=await curd.postData(Apiconnect.orderdetails, {});
    return response.fold((l)=>l ,(r)=>r);
  }
   rating(String orderid,String rating,String comment)async{
    var response=await curd.postData(Apiconnect.rating, {"orderid":orderid,"rating":rating,"comment":comment});
    return response.fold((l)=>l ,(r)=>r);
  }
}
