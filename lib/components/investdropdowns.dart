import 'package:flutter/material.dart';

class Drops extends StatelessWidget {
  final int? itemcnt;
  final String itemname;

  const Drops({super.key, required this.itemcnt, required this.itemname});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ExpansionTile(
        leading: Image(
          image: AssetImage("assets/images/bank.png"),
          width: MediaQuery.of(context).size.width / 10,
        ),
        title: Text("Fixed Income Funds"),
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: itemcnt,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(itemname),
                  ),
                );
              }))
        ],
      ),
    );
  }
}
