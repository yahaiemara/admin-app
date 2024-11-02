class OrderViewDetails {
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImages;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCategories;
  String? itemspice;
  String? countitems;
  String? cartId;
  String? cartUserisd;
  String? cartItemsid;
  String? cartOrders;

  OrderViewDetails(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImages,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCategories,
      this.itemspice,
      this.countitems,
      this.cartId,
      this.cartUserisd,
      this.cartItemsid,
      this.cartOrders});

  OrderViewDetails.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImages = json['items_images'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategories = json['items_categories'];
    itemspice = json['itemspice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUserisd = json['cart_userisd'];
    cartItemsid = json['cart_itemsid'];
    cartOrders = json['cart_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_images'] = itemsImages;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_date'] = itemsDate;
    data['items_categories'] = itemsCategories;
    data['itemspice'] = itemspice;
    data['countitems'] = countitems;
    data['cart_id'] = cartId;
    data['cart_userisd'] = cartUserisd;
    data['cart_itemsid'] = cartItemsid;
    data['cart_orders'] = cartOrders;
    return data;
  }
}