class TransactionHistory {
  final String title;
  final String cover;
  final int totalPrice;

  TransactionHistory({
    required this.title,
    required this.cover,
    required this.totalPrice,
  });
}

List<TransactionHistory> transactionHistories = [];
