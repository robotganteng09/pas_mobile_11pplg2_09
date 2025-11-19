import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_09/controller/tv_controller.dart';
import 'package:pas_mobile_11pplg2_09/model/tvModel.dart' as tv;



class CostumCard extends StatelessWidget {
  final  tv;

  const CostumCard({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    final ProductsC = Get.find<TvController>();

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              tv.image.medium,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => const Icon(Icons.broken_image),
            ),
          ),

          const SizedBox(width: 12),

          // TITLE + PRICE
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tv.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                // Text(
                //   "\$${tv.genres}",
                //   style: const TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ),
          ),

          // BUTTON MARK
          IconButton(
            icon: const Icon(Icons.bookmark_add_outlined),
            onPressed: () {
              ProductsC.addToFavorite(tv); // <--- ini yang benar
            },
          ),
        ],
      ),
    );
  }
}
