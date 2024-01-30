// ignore_for_file: must_be_immutable

import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multipurpose_pos_application/data/vos/product_vo.dart';

class ZPrintScreen extends StatefulWidget {
  ZPrintScreen({
    Key? key,
    required this.list,
  }) : super(key: key);
  List<ProductVO>? list;
  @override
  State<ZPrintScreen> createState() => _ZPrintScreenState();
}

class _ZPrintScreenState extends State<ZPrintScreen> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> devices = [];
  BluetoothDevice? bluetoothDevice;
  String address = "";
  String deviceMes = "";
  final format = NumberFormat("\$###,###.00", "en_US");

  @override
  void dispose() {
    bluetoothPrint.stopScan();
    bluetoothPrint.disconnect();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initPrinter();
    });
  }

  Future<void> initPrinter() async {
    bluetoothPrint.startScan();
    if (!mounted) return;
    bluetoothPrint.scanResults.listen((val) {
      if (!mounted) return;
      setState(() {
        devices = val.where((element) => element.address == address).toList();
        devices.take(1);
        bluetoothDevice = devices.elementAt(0);
      });
      if (bluetoothDevice == null) {
        setState(() {
          deviceMes = "No devices";
        });
      }
    });
  }

  Future<void> startPrint(BluetoothDevice? device) async {
    bool isConnected = await bluetoothPrint.isConnected ?? false;

    if (device != null &&
        device.address != null &&
        widget.list != null &&
        widget.list != [] &&
        widget.list!.isNotEmpty) {
      Map<String, dynamic> config = {"test": 45};
      List<LineText> lineList = [];
      if (!isConnected) {
        await bluetoothPrint.connect(device);
        lineList.add(LineText(
          type: LineText.TYPE_TEXT,
          content: "Yankin Bubble tea",
          width: 2,
          height: 2,
          weight: 2,
          linefeed: 1,
          align: LineText.ALIGN_CENTER,
        ));
        lineList.add(LineText(
          type: LineText.TYPE_TEXT,
          content: "Address",
          width: 2,
          height: 2,
          weight: 2,
          linefeed: 1,
          align: LineText.ALIGN_CENTER,
        ));
        lineList.add(LineText(
          type: LineText.TYPE_TEXT,
          content: "Phone",
          width: 2,
          height: 2,
          weight: 2,
          linefeed: 1,
          align: LineText.ALIGN_CENTER,
        ));

        for (int i = 0; i < widget.list!.length; i++) {
          var name = widget.list![i].name ?? "";
          var option = (widget.list![i].optionName != null)
              ? "(${widget.list![i].optionName})"
              : "";
          var special = widget.list![i].specialRemark ?? "";
          var size = widget.list![i].selectedSize ?? "";
          var price = widget.list![i].selectedPrice ?? 0;
          var quantity = widget.list![i].quantity ?? 0;
          var toppingList = widget.list![i].toppingList ?? [];

          lineList.add(
            LineText(
              type: LineText.TYPE_TEXT,
              content:
                  "$name $size ${format.format(price)} x $quantity $option $special",
              linefeed: 1,
              align: LineText.ALIGN_LEFT,
            ),
          );

          for (int j = 0; j > toppingList.length; j++) {
            var toppingName = toppingList[j].rawMaterialName ?? "";
            var toppingPrice = toppingList[j].rawMaterialPrice ?? 0;
            var toppingQty = toppingList[j].rawMaterialQuantity ?? 0;

            lineList.add(
              LineText(
                type: LineText.TYPE_TEXT,
                content:
                    "$toppingName ${format.format(toppingPrice)} x $toppingQty",
                linefeed: 1,
                align: LineText.ALIGN_LEFT,
              ),
            );
          }
        }
        lineList.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content: "Cash Back : ",
            linefeed: 1,
            align: LineText.ALIGN_RIGHT,
          ),
        );
        lineList.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content: "Discount : ",
            linefeed: 1,
            align: LineText.ALIGN_RIGHT,
          ),
        );
        lineList.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content: "Tax : ",
            linefeed: 1,
            align: LineText.ALIGN_RIGHT,
          ),
        );
        lineList.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content: "Grand Total : ",
            linefeed: 1,
            align: LineText.ALIGN_RIGHT,
          ),
        );
        await bluetoothPrint.printLabel(config, lineList);
      } else {
        lineList.add(LineText(
          type: LineText.TYPE_TEXT,
          content: "Yankin Bubble tea",
          width: 2,
          height: 2,
          weight: 2,
          linefeed: 1,
          align: LineText.ALIGN_CENTER,
        ));
        lineList.add(LineText(
          type: LineText.TYPE_TEXT,
          content: "Address",
          width: 2,
          height: 2,
          weight: 2,
          linefeed: 1,
          align: LineText.ALIGN_CENTER,
        ));
        lineList.add(LineText(
          type: LineText.TYPE_TEXT,
          content: "Phone",
          width: 2,
          height: 2,
          weight: 2,
          linefeed: 1,
          align: LineText.ALIGN_CENTER,
        ));

        for (int i = 0; i < widget.list!.length; i++) {
          var name = widget.list![i].name ?? "";
          var option = (widget.list![i].optionName != null)
              ? "(${widget.list![i].optionName})"
              : "";
          var special = widget.list![i].specialRemark ?? "";
          var size = widget.list![i].selectedSize ?? "";
          var price = widget.list![i].selectedPrice ?? 0;
          var quantity = widget.list![i].quantity ?? 0;
          var toppingList = widget.list![i].toppingList ?? [];

          lineList.add(
            LineText(
              type: LineText.TYPE_TEXT,
              content:
                  "$name $size ${format.format(price)} x $quantity $option $special",
              linefeed: 1,
              align: LineText.ALIGN_LEFT,
            ),
          );

          for (int j = 0; j > toppingList.length; j++) {
            var toppingName = toppingList[j].rawMaterialName ?? "";
            var toppingPrice = toppingList[j].rawMaterialPrice ?? 0;
            var toppingQty = toppingList[j].rawMaterialQuantity ?? 0;

            lineList.add(
              LineText(
                type: LineText.TYPE_TEXT,
                content:
                    "$toppingName ${format.format(toppingPrice)} x $toppingQty",
                linefeed: 1,
                align: LineText.ALIGN_LEFT,
              ),
            );
          }
        }
        lineList.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content: "Cash Back : ",
            linefeed: 1,
            align: LineText.ALIGN_RIGHT,
          ),
        );
        lineList.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content: "Discount : ",
            linefeed: 1,
            align: LineText.ALIGN_RIGHT,
          ),
        );
        lineList.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content: "Tax : ",
            linefeed: 1,
            align: LineText.ALIGN_RIGHT,
          ),
        );
        lineList.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content: "Grand Total : ",
            linefeed: 1,
            align: LineText.ALIGN_RIGHT,
          ),
        );
        await bluetoothPrint.printLabel(config, lineList);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thermal Printer"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: (bluetoothDevice == null)
          ? Center(child: Text(deviceMes))
          : ListTile(
              leading: const Icon(Icons.print),
              title: Text(bluetoothDevice?.name ?? ""),
              subtitle: Text(bluetoothDevice?.address ?? ""),
              onTap: () {
                startPrint(bluetoothDevice);
              },
            ),
    );
  }
}
