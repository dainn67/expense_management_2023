import '../../../data/models/ExpenseRecord.dart';

class AppState {
  double balance;
  double walletBalance;
  double bankBalance;
  double stockBalance;

  List<ExpenseRecord> records;

  AppState(
      {required this.balance,
      required this.walletBalance,
      required this.bankBalance,
      required this.stockBalance,
      required this.records});

  AppState copyWith(
      {double? balance,
      double? walletBalance,
      double? bankBalance,
      double? stockBalance,
      List<ExpenseRecord>? records}) {
    return AppState(
        balance: balance ?? this.balance,
        walletBalance: walletBalance ?? this.walletBalance,
        bankBalance: bankBalance ?? this.bankBalance,
        stockBalance: stockBalance ?? this.stockBalance,
        records: records ?? this.records);
  }
}

class InitState extends AppState {
  InitState()
      : super(balance: 0, walletBalance: 0, bankBalance: 0, stockBalance: 0, records: []);
}
