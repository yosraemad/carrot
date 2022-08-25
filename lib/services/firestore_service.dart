import 'package:carrot_app/resources/app_strings.dart';
import 'package:carrot_app/models/product/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get user's cart from the firestore
  static Future<List?> getUserProducts(String id) async {
    return (await FirebaseFirestore.instance
            .collection(AppStrings.productsMapKey)
            .doc(id)
            .get())
        .data()?[AppStrings.productsMapKey];
  }

  // set user's cart in the firestore
  static Future<void> setProductsInDatabase(
      String uid, List<Product> cart) async {
    CollectionReference products =
        await FirebaseFirestore.instance.collection(AppStrings.productsMapKey);
    await products.doc(uid).set({
      AppStrings.idMapKey: uid,
      AppStrings.productsMapKey: cart.map((e) => e.toMap()).toList(),
    });
  }
}
