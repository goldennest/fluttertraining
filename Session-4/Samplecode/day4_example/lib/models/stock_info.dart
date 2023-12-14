
class StockInfo {
  String? symbol;
  String? name;
  String? description;

  StockInfo({this.symbol, this.name, this.description});

  factory StockInfo.fromMap(Map<String, dynamic> data) => StockInfo(
        symbol: data['symbol'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'symbol': symbol,
        'name': name,
        'description': description,
      };

}
