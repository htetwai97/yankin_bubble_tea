// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
// import 'package:multipurpose_pos_application/core/core_function/functions.dart';
// import 'package:multipurpose_pos_application/view/zPrint/screen/zPrint_screen.dart';
//
// class ZPrinterTestScreen extends StatelessWidget {
//   ZPrinterTestScreen({Key? key}) : super(key: key);
//   final List<Map<String, dynamic>> list = [
//     {"title": "test subject product", "price": 300, "quantity": 50},
//     {"title": "test subject product", "price": 300, "quantity": 50},
//     {"title": "test subject product", "price": 300, "quantity": 50},
//     {"title": "test subject product", "price": 300, "quantity": 50},
//     {"title": "test subject product", "price": 300, "quantity": 50},
//   ];
//   final format = NumberFormat("\$###,###.00", "en_US");
//   @override
//   Widget build(BuildContext context) {
//     int total = 0;
//     total = list
//         .map((e) => e['price'] * e['quantity'])
//         .reduce((value, element) => value + element);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Thermal Printer"),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: list.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(
//                     list[index]['title'],
//                     style: ConfigStyle.regularStyle(
//                       14,
//                       Colors.black87,
//                     ),
//                   ),
//                   subtitle: Text(
//                     "${format.format(list[index]['price'])} x ${list[index]['quantity']}",
//                   ),
//                   trailing: Text(
//                     format
//                         .format(list[index]['price'] * list[index]['quantity']),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(20),
//             color: Colors.grey[200],
//             child: Row(
//               children: [
//                 Text(
//                   "Total - ${format.format(total)}",
//                   style: ConfigStyle.regularStyle(
//                     14,
//                     Colors.green,
//                   ),
//                 ),
//                 const SizedBox(width: 80),
//                 Expanded(
//                   child: TextButton.icon(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ZPrintScreen(list: list)));
//                     },
//                     icon: const Icon(Icons.print),
//                     label: const Text("Print"),
//                     style: TextButton.styleFrom(
//                       foregroundColor: Colors.white,
//                       backgroundColor: Colors.green,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
