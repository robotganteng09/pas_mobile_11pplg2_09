

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_09/helper.dart';
import 'package:pas_mobile_11pplg2_09/model/tvModel.dart';
import 'package:http/http.dart' as http;

class TvController extends GetxController{
   var products = <TvModel>[].obs;
  var favorites = <TvModel>[].obs; // <-- daftar bookmark
  var isLoading = false.obs;
  var isFavoriteLoading = false.obs;

  final String baseUrl = "https://api.tvmaze.com/shows";

  @override
  void onInit() {
    super.onInit();
    fetchChanel();
    loadFavorites(); // <-- ambil bookmark saat page dibuka
  }


  Future<void> fetchChanel() async {
    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        products.value = tvModelFromJson(response.body);
        print("Produk berhasil diambil: ${products.length}");
      } else {
        print("Gagal mengambil data. Status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetchProducts: $e");
    } finally {
      isLoading.value = false;
    }
  }

   Future<void> loadFavorites() async {
    isFavoriteLoading.value = true;
    favorites.value = await DBHelper().getFavorites();
    isFavoriteLoading.value = false;

    print("Total Bookmark: ${favorites.length}");
  }

   Future<void> addToFavorite(TvModel chanel) async {
    try {
      await DBHelper().insertFavorite(chanel);
      await loadFavorites(); // refresh data

      Get.snackbar(
        "Success",
        "Product added to MarkBook",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print("Error addToFavorite: $e");
    }
  }

  Future<void> deleteFavorite(int id) async {
    Get.defaultDialog(
      title: "Konfirmasi",
      middleText: "Yakin ingin menghapus produk dari MarkBook?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        Get.back(); // tutup dialog dulu

        try {
          await DBHelper().deleteFavoriteById(id);
          await loadFavorites(); // refresh

          Get.snackbar(
            "Removed",
            "Product removed from MarkBook",
            snackPosition: SnackPosition.BOTTOM,
          );
        } catch (e) {
          print("Error deleteFavorite: $e");
        }
      },
    );
  }
}