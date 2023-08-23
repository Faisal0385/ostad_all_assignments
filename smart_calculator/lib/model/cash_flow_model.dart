class CashFlow {
  final int? id;
  final String cash;
  final String status;
  final String date;

  CashFlow(
      {this.id, required this.cash, required this.status, required this.date});

  factory CashFlow.fromJson(Map<String, dynamic> json) =>
      CashFlow(
          id: json['id'],
          cash: json['cash'],
          status: json['status'],
          date: json['date']
      );

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'cash': cash,
        'status': status,
        'date': date,
      };
}