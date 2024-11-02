import 'package:adminapp/view/screen/auth/language.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/middleware/mymiddleware.dart';
import 'package:adminapp/view/screen/auth/homepage/homepage.dart';
import 'package:adminapp/view/screen/auth/homepage/orderscreen.dart';
import 'package:adminapp/view/screen/auth/login.dart';
import 'package:adminapp/view/screen/auth/onboarding.dart';
import 'package:adminapp/view/screen/categories/categoriesadd.dart';
import 'package:adminapp/view/screen/categories/categoriesedit.dart';
import 'package:adminapp/view/screen/categories/categoriesview.dart';
import 'package:adminapp/view/screen/items/itemsadd.dart';
import 'package:adminapp/view/screen/items/itemsedit.dart';
import 'package:adminapp/view/screen/items/itemsview.dart';

import 'package:adminapp/view/screen/order/archive.dart';
import 'package:adminapp/view/screen/order/pending.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language() , middlewares: [
    MyMiddleWare()
  ]),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.homescreen, page: () => const OrderScreen()),
  GetPage(name: AppRoute.home, page: () => const Homepage()),
  GetPage(name: AppRoute.pending, page: ()=>const PendingDelivery()),
  GetPage(name: AppRoute.archive, page: ()=>const Archive()),
  GetPage(name: AppRoute.onBoarding, page: ()=>const OnBoarding()),
  GetPage(name: AppRoute.categoriesview, page: ()=>const Categoriesview()),
  GetPage(name: AppRoute.categoriesadd, page: ()=>const Categoriesadd()),
  GetPage(name: AppRoute.categoriesedit, page: ()=>const CategoriesEdit()),
  

    GetPage(name: AppRoute.Itemsview, page: ()=>const Itemsview()),
  GetPage(name: AppRoute.Itemsadd, page: ()=>const Itemsadd()),
  GetPage(name: AppRoute.Itemsedit, page: ()=>const Itemsedit()),
];
 