import "package:flutter/material.dart";

class CategoryItem extends StatelessWidget {
  final Map<String, dynamic> item;
  const CategoryItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xfffcfcfc),
                        border: Border.all(
                          color: const Color(0xffe0e0e0),
                        ),
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Image.network(item["image"]),
                    ),
                  ),
                  Positioned(
                    top: -10,
                    right: -5,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff006f18).withAlpha(25),
                            blurRadius: 4.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: IconButton(
                          color: Colors.white,
                          onPressed: () {},
                          icon: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.add,
                              color: Theme.of(context).primaryColor,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            "\$${item["price"]}",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          Text(
            item['name'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            item['weight'],
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
