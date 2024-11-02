
// ignore_for_file: non_constant_identifier_names
import 'package:adminapp/controller/order/pending_controlle.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
 
 RequestPremissionNotifaction()async{
  // ignore: unused_local_variable
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);

 }



fcmnotif(){
  FirebaseMessaging.onMessage.listen((message){
FlutterRingtonePlayer().playNotification();
 Get.snackbar(message.notification!.title!, message.notification!.body!);
  });
}
refresPageOrder(data){

  if(Get.currentRoute=="/pending" && data['pagename']=="order"){
    PendingControlle controlle=Get.find();
    // controlle.refrespage();
  }
}