import 'package:adminapp/core/class/curd.dart';
import 'package:adminapp/data/apiconnect/apiconnect.dart';

class ArchiveData{
  Crud curd;
 ArchiveData (this.curd);
  getData()async{
    var response=await curd.postData(Apiconnect.archiveorder, {});
    return response.fold((l)=>l ,(r)=>r);
  }
 rating(String orderid,String rating,String comment)async{
    var response=await curd.postData(Apiconnect.rating, {"orderid":orderid,"rating":rating,"comment":comment});
    return response.fold((l)=>l ,(r)=>r);
  }


}
