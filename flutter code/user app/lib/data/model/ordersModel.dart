class OrdersModel {
  dynamic? ordersId;
  dynamic? ordersUsersid;
  dynamic? ordersAddress;
  dynamic? ordersType;
  dynamic? ordersPricedelivery;
  dynamic? ordersPrice;
  dynamic? ordersTotalprice;
  dynamic? ordersCoupon;
  dynamic? ordersRatting;
  dynamic? ordersNoteratting;
  dynamic? ordersPaymentmethode;
  dynamic? ordersStatus;
  dynamic? ordersDatetime;
  dynamic? addressId;
  dynamic? addressUersid;
  dynamic? adressName;
  dynamic? addressCity;
  dynamic? addressStreet;
  dynamic? addressLat;
  dynamic? addressLong;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersRatting,
      this.ordersNoteratting,
      this.ordersPaymentmethode,
      this.ordersStatus,
      this.ordersDatetime,
      this.addressId,
      this.addressUersid,
      this.adressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersRatting = json['orders_ratting'];
    ordersNoteratting = json['orders_noteratting'];
    ordersPaymentmethode = json['orders_paymentmethode'];
    ordersStatus = json['orders_status'];
    ordersDatetime = json['orders_datetime'];
    addressId = json['address_id'];
    addressUersid = json['address_uersid'];
    adressName = json['adress_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_ratting'] = this.ordersRatting;
    data['orders_noteratting'] = this.ordersNoteratting;
    data['orders_paymentmethode'] = this.ordersPaymentmethode;
    data['orders_status'] = this.ordersStatus;
    data['orders_datetime'] = this.ordersDatetime;
    data['address_id'] = this.addressId;
    data['address_uersid'] = this.addressUersid;
    data['adress_name'] = this.adressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}