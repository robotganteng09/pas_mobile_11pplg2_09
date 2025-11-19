import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_09/controller/tv_controller.dart';


class MarkbookPage extends StatelessWidget {
  const MarkbookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TvController>();

    return Scaffold(
      appBar: AppBar(title: const Text("MarkBook")),

      body: Obx(() {
        if (controller.isFavoriteLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.favorites.isEmpty) {
          return const Center(child: Text("No bookmarked products"));
        }

        return ListView.builder(
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            final product = controller.favorites[index];

            return Card(
              child: ListTile(
                // leading: Image.network(product.image[0], width: 60),
                title: Text(product.name),
                // subtitle: Text("\$${product.genres}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    controller.deleteFavorite(product.id!);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
