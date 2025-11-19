import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_09/component/costum_card.dart';
import 'package:pas_mobile_11pplg2_09/controller/tv_controller.dart';

class TvPage extends StatelessWidget {
  const TvPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TvController>();
    return Scaffold(
        appBar: AppBar(
        title: const Text(
          "Chanel",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      
        body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.products.isEmpty) {
          return const Center(child: Text("No products found"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];

            // return Card(
            //   margin: const EdgeInsets.only(bottom: 12),
            //   elevation: 3,
            //   child: Row(
            //     children: [
            //       // Gambar produk
            //       SizedBox(
            //         height: 100,
            //         width: 100,
            //         child: Image.network(product.image, fit: BoxFit.contain),
            //       ),

            //       const SizedBox(width: 12),

            //       // Title & Price
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               product.title,
            //               maxLines: 2,
            //               overflow: TextOverflow.ellipsis,
            //               style: const TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 16,
            //               ),
            //             ),

            //             const SizedBox(height: 6),

            //             Text(
            //               "\$${product.price}",
            //               style: const TextStyle(
            //                 fontSize: 14,
            //                 color: Colors.green,
            //                 fontWeight: FontWeight.w600,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // );
            return CostumCard(tv: product,);
          },
        );
      }),

    );
  }
}
