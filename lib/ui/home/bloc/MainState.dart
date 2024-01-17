class AppState {
  double balance;
  double walletBalance;
  double bankBalance;
  double stockBalance;

  AppState({required this.balance,
    required this.walletBalance,
    required this.bankBalance,
    required this.stockBalance});

  AppState copyWith({double? balance,
    double? walletBalance,
    double? bankBalance,
    double? stockBalance}) {
    return AppState(balance: balance ?? this.balance,
        walletBalance: walletBalance ?? this.walletBalance,
        bankBalance: bankBalance ?? this.bankBalance,
        stockBalance: stockBalance ?? this.stockBalance);
  }
}

class InitState extends AppState {
  InitState()
      : super(balance: 0, walletBalance: 0, bankBalance: 0, stockBalance: 0);
}
