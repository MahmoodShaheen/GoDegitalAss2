import 'package:categoty_app/widget_category.dart';
import 'package:flutter/material.dart';

import 'data_dummy.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WidgetOf(
        products: DataDummy().category,
        product: DataDummy().dummyData,
      ),
    );
  }
}
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Shopping'),
//         ),
//         body: Column(
//           children: [
//             // عرض التصنيفات
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: categories.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(categories[index].name),
//                   onTap: () {
//                     // عند الضغط على تصنيف معين
//                     // قم بتحديث المنتجات المعروضة بناءً على التصنيف المختار
//                     // يمكنك استخدام متغير حالي لتخزين التصنيف المختار
//                   },
//                 );
//               },
//             ),
//             // عرض المنتجات
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 2, // سيتم تحديث هذا العدد عند اختيار تصنيف
//                 itemBuilder: (context, index) {
//                   return CategoryWidget();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
