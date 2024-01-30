
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_config/config_style.dart';
import '../bloc/voucher_detail_bloc.dart';

class VoucherPrintScreen extends StatefulWidget {
  int? voucherId;

  VoucherPrintScreen({required this.voucherId});

  @override
  _VoucherPrintScreenState createState() => _VoucherPrintScreenState();
}

class _VoucherPrintScreenState extends State<VoucherPrintScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = AlignmentTween(
      begin: Alignment(-0.5, 0),
      end: Alignment(0.5, 0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => VoucherDetailBloc(widget.voucherId, true),
      child: Selector<VoucherDetailBloc, bool>(
        selector: (context, bloc) => bloc.isLoading,
        builder: (context, isLoading, child) => Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (BuildContext context, Widget? child) {
                      return Expanded(
                        child: Align(
                          alignment: _animation.value,
                          child: Image.asset(
                            'assets/images/option_two_logo.png',
                            width: scaleWidth(context) / 10,
                            height: scaleWidth(context) / 10,
                          ),
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment(-0.5, 0.0),
                    child: Image.asset(
                      'assets/images/option_two_logo.png',
                      width: scaleWidth(context) / 10,
                      height: scaleWidth(context) / 10,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.5, 0.0),
                    child: Image.asset(
                      'assets/images/option_two_logo.png',
                      width: scaleWidth(context) / 10,
                      height: scaleWidth(context) / 10,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(bottom: scaleWidth(context) / 45),
                child: Text(
                  "Printing......",
                  style: ConfigStyle.boldStyle(FONT_LARGE + 9, BLACK_HEAVY),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
