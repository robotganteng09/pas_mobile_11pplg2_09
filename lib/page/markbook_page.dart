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
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    // Gambar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product.image.medium,
                        width: 90,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 15),

                    // Title + tombol hapus kanan
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // TITLE
                          Expanded(
                            child: Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          // BUTTON HAPUS DI SAMPING KANAN
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              controller.deleteFavorite(product.id!);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
