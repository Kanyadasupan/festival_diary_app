class fest_tb {
  int? festId;
  String? festName;
  String? festDetial;
  String? festState;
  int? festNumdate;
  int? festCost;
  int? userId;
  String? festImage;

  fest_tb({
    this.festId,
    this.festName,
    this.festDetial,
    this.festState,
    this.festNumdate,
    this.festCost,
    this.userId,
    this.festImage,
  });

  fest_tb.fromJson(Map<String, dynamic> json) {
    festId = json['festId'];
    festName = json['festName'];
    festDetial = json['festDetial'];
    festState = json['festState'];
    festNumdate = json['festNumdate'];
    festCost = json['festCost'];
    userId = json['userId'];
    festImage = json['festImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['festId'] = this.festId;
    data['festName'] = this.festName;
    data['festDetial'] = this.festDetial;
    data['festState'] = this.festState;
    data['festNumdate'] = this.festNumdate;
    data['festCost'] = this.festCost;
    data['userId'] = this.userId;
    data['festImage'] = this.festImage;
    return data;
  }
}
