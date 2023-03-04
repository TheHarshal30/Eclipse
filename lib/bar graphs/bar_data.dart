import 'individual_bar.dart';

class BarData {
  final double janAmount;
  final double febAmount;
  final double marchAmount;
  final double aprilAmount;
  final double mayAmount;
  final double junAmount;
  final double julAmount;
  final double augAmount;
  final double septAmount;
  final double octAmount;
  final double novAmount;
  final double decAmount;

  BarData(
    this.janAmount,
    this.febAmount,
    this.marchAmount,
    this.aprilAmount,
    this.mayAmount,
    this.junAmount,
    this.julAmount,
    this.augAmount,
    this.septAmount,
    this.octAmount,
    this.novAmount,
    this.decAmount,
  );
  List<IndividualBar> barData = [];
// initialize bar data
  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: janAmount),
      IndividualBar(x: 1, y: febAmount),
      IndividualBar(x: 2, y: marchAmount),
      IndividualBar(x: 3, y: aprilAmount),
      IndividualBar(x: 4, y: mayAmount),
      IndividualBar(x: 5, y: junAmount),
      IndividualBar(x: 6, y: julAmount),
      IndividualBar(x: 7, y: augAmount),
      IndividualBar(x: 8, y: septAmount),
      IndividualBar(x: 9, y: octAmount),
      IndividualBar(x: 10, y: novAmount),
      IndividualBar(x: 11, y: decAmount),
    ];
  }
}
