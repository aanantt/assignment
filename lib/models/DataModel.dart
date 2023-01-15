class Data {
  String  pName;
  int  pId;
  int  pCost;
  int  pAvailability;
  String  pDetails;
  String  pCategory;

  Data(
      {this.pName,
      this.pId,
      this.pCost,
      this.pAvailability,
      this.pDetails,
      this.pCategory});

  Data.fromJson(Map<String, dynamic> json) {
    pName = json['p_name'];
    pId = json['p_id'];
    pCost = json['p_cost'];
    pAvailability = json['p_availability'];
    pDetails = json['p_details'];
    pCategory = json['p_category'];
  }
 
}
