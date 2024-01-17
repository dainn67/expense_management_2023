import 'IndividualBar.dart';

class BarData{
  final double foodAmount;
  final double entertainmentAmount;
  final double otherAmount;

  BarData(this.foodAmount, this.entertainmentAmount, this.otherAmount);

  List<IndividualBar> barData = [];

  void initData(){
    barData = [
      IndividualBar(0, foodAmount),
      IndividualBar(1, entertainmentAmount),
      IndividualBar(2, otherAmount)
    ];
  }
}