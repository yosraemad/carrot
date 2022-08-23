import 'package:carrot_app/models/product/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get user's cart from the firestore
  static Future<List?> getUserProducts(String id) async {
    return (await FirebaseFirestore.instance
            .collection("products")
            .doc(id)
            .get())
        .data()?["products"];
  }

  // set user's cart in the firestore
  static Future<void> setProductsInDatabase(
      String uid, List<Product> cart) async {
    CollectionReference products =
        await FirebaseFirestore.instance.collection("products");
    await products.doc(uid).set({
      "id": uid,
      "products": cart.map((e) => e.toMap()).toList(),
    });
  }
}
