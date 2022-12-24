class TradeModel {
  int? status;
  String? message;
  List<Trade>? data;
  int? newTrades;

  TradeModel({this.status, this.message, this.data, this.newTrades});

  TradeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Trade>[];
      json['data'].forEach((v) {
        data!.add(Trade.fromJson(v));
      });
    }
    newTrades = json['new_trades'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['new_trades'] = newTrades;
    return data;
  }
}

class Trade {
  int? id;
  int? mentorId;
  String? type;
  num? entryPrice;
  String? name;
  String? stock;
  num? exitPrice;
  num? exitHigh;
  num? stopLossPrice;
  String? action;
  String? result;
  String? status;
  String? postedDate;
  String? fee;
  int? isSubscribe;
  User? user;

  Trade(
      {this.id,
      this.mentorId,
      this.type,
      this.entryPrice,
      this.name,
      this.stock,
      this.exitPrice,
      this.exitHigh,
      this.stopLossPrice,
      this.action,
      this.result,
      this.status,
      this.postedDate,
      this.fee,
      this.isSubscribe,
      this.user});

  Trade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mentorId = json['mentor_id'];
    type = json['type'];
    entryPrice = json['entry_price'];
    name = json['name'];
    stock = json['stock'];
    exitPrice = json['exit_price'];
    exitHigh = json['exit_high'];
    stopLossPrice = json['stop_loss_price'];
    action = json['action'];
    result = json['result'];
    status = json['status'];
    postedDate = json['posted_date'];
    fee = json['fee'];
    isSubscribe = json['is_subscribe'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mentor_id'] = mentorId;
    data['type'] = type;
    data['entry_price'] = entryPrice;
    data['name'] = name;
    data['stock'] = stock;
    data['exit_price'] = exitPrice;
    data['exit_high'] = exitHigh;
    data['stop_loss_price'] = stopLossPrice;
    data['action'] = action;
    data['result'] = result;
    data['status'] = status;
    data['posted_date'] = postedDate;
    data['fee'] = fee;
    data['is_subscribe'] = isSubscribe;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? profileImage;

  User({this.id, this.name, this.profileImage});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['profile_image'] = profileImage;
    return data;
  }
}
