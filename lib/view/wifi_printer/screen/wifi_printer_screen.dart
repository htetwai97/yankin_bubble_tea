import 'dart:io';
import 'dart:typed_data';

import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:multipurpose_pos_application/core/core_function/functions.dart';
import 'package:multipurpose_pos_application/data/vos/product_vo.dart';
import 'package:multipurpose_pos_application/view/sale_and_history/screen/sale_and_history_screen.dart';
import 'package:multipurpose_pos_application/view/wifi_printer/widget/wifi_print_row_view.dart';
import 'package:screenshot/screenshot.dart';

class WifiPrinterScreen extends StatefulWidget {
  final List<ProductVO> productList;
  final double total, cashback, discount, tax, grandTotal;

  const WifiPrinterScreen({
    Key? key,
    required this.productList,
    required this.total,
    required this.discount,
    required this.cashback,
    required this.grandTotal,
    required this.tax,
  }) : super(key: key);

  @override
  State<WifiPrinterScreen> createState() => _WifiPrinterScreenState();
}

class _WifiPrinterScreenState extends State<WifiPrinterScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  String dir = Directory.current.path;
  late Uint8List imageComeFromPrinter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(dir);
    // setState(() {
    //   Process.run('$dir/images/installerX64/install.exe', [' start '])
    //       .then((ProcessResult results) {
    //     print(results.stdout);
    //   });
    // });
  }

  void testPrint(Uint8List imageComesFromSs, BuildContext context) async {
    print("im inside the test print 2");
    // TODO Don't forget to choose printer's paper size
    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(paper, profile);

    final PosPrintResult res =
        await printer.connect("192.168.100.87", port: 9100);
    print(res.msg.toString());
    if (res == PosPrintResult.success) {
      await testReceipt(printer, imageComesFromSs);
      print(res.msg);
      await Future.delayed(const Duration(seconds: 3), () {
        print("prinnter desconect");
        printer.disconnect();
        Functions.replacementTransition(context, const SaleAndHistoryScreen());
      });
    }
  }

  Future<void> testReceipt(
      NetworkPrinter printer, Uint8List imageComesFromSs) async {
    var newImage = decodeImage(imageComesFromSs);
    printer.image(newImage!, align: PosAlign.center);
    printer.cut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Screenshot(
                  controller: screenshotController,
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Yankin bubble Tea",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Yankin Road,Yankin Township,",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Yangon,Myanmar",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "09-420080780",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                          child: Text("-----------------------"),
                        ),
                        const Card(
                          child: WifiPrintRowView(
                            multiply: "",
                            name: "Name",
                            size: "Size",
                            quantity: "Quantity",
                            price: "Price",
                            no: "No",
                            toppingList: [],
                          ),
                        ),
                        ListView.separated(
                          separatorBuilder: (context, index) => Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    "-------------------------------------------------------------------------------------------------------------------------------------------------------------",
                                    style: ConfigStyle.regularStyle(
                                        4, BLACK_LIGHT),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: widget.productList.length,
                          itemBuilder: (context, index) {
                            var name = widget.productList[index].name ?? "";
                            var option = (widget
                                        .productList[index].optionName !=
                                    null)
                                ? "(${widget.productList[index].optionName})"
                                : "";

                            ///var special = widget.productList[index].specialRemark ?? "";
                            var size =
                                widget.productList[index].selectedSize ?? "";
                            var price =
                                widget.productList[index].selectedPrice ?? 0;
                            var quantity =
                                widget.productList[index].quantity ?? 0;
                            var toppingList =
                                widget.productList[index].toppingList ?? [];
                            return Card(
                              child: WifiPrintRowView(
                                no: "${index + 1}",
                                name: name,
                                size: size,
                                price: price.toString(),
                                quantity: quantity.toString(),
                                multiply: "x",
                                toppingList: toppingList,
                              ),
                            );
                          },
                        ),
                        FinalPrintCalculationView(
                          title: "Total",
                          value: widget.total.toString(),
                        ),
                        FinalPrintCalculationView(
                          title: "Cash Back",
                          value: widget.cashback.toString(),
                        ),
                        FinalPrintCalculationView(
                          title: "Discount",
                          value: widget.discount.toString(),
                        ),
                        FinalPrintCalculationView(
                          title: "Tax",
                          value: widget.tax.toString(),
                        ),
                        FinalPrintCalculationView(
                          title: "Grand Total",
                          value: widget.grandTotal.toString(),
                        ),
                        const Text("----------"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 140,
                      child: ElevatedButton(
                        child: const Row(
                          children: [
                            Text(
                              'Print',
                              style: TextStyle(fontSize: 24),
                            ),
                            Spacer(),
                            Icon(Icons.print),
                          ],
                        ),
                        onPressed: () {
                          screenshotController
                              .capture(delay: const Duration(milliseconds: 10))
                              .then((capturedImage) async {
                            imageComeFromPrinter = capturedImage!;
                            setState(() {
                              imageComeFromPrinter = capturedImage;
                              testPrint(imageComeFromPrinter, context);
                            });
                          }).catchError((onError) {
                            print(onError);
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      child: ElevatedButton(
                        child: const Row(
                          children: [
                            Text(
                              'Cancel',
                              style: TextStyle(fontSize: 24),
                            ),
                            Spacer(),
                            Icon(Icons.cancel),
                          ],
                        ),
                        onPressed: () {
                          Functions.replacementTransition(
                              context, const SaleAndHistoryScreen());
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FinalPrintCalculationView extends StatelessWidget {
  const FinalPrintCalculationView({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Text(
              "",
              style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              title,
              style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              value,
              style: ConfigStyle.regularStyle(6, BLACK_HEAVY),
            ),
          ),
        ),
      ],
    );
  }
}
