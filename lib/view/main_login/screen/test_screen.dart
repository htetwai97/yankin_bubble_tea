import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';

class TestScreen extends StatelessWidget {
  List<Map<int, dynamic>> list;
  TestScreen({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  list[index].toString(),
                  style: ConfigStyle.boldStyle(24, Colors.black),
                ),
              );
            }),
      ),
    );
  }
}
