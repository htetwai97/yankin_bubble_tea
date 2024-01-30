class SaleAmountVO {
  int? totalSales;
  int? thisMonthSales;
  int? todaySales;

  SaleAmountVO({
    this.totalSales,
    this.thisMonthSales,
    this.todaySales,
  });

  SaleAmountVO.fromJson(Map<String, dynamic> json) {
    totalSales = json['total_sales'];
    thisMonthSales = json['this_month_sales'];
    todaySales = json['today_sales'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_sales'] = this.totalSales;
    data['this_month_sales'] = this.thisMonthSales;
    data['today_sales'] = this.todaySales;
    return data;
  }
}
