import 'package:catering_service/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({Key? key}) : super(key: key);

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  late List<dynamic> productList;

  Future<void> getProduct() async {
    CollectionReference ref = FirebaseFirestore.instance.collection('products');
    QuerySnapshot productSnap = await ref.get();

    productList = productSnap.docs.map((doc) => doc.data()).toList();
    // print("PRODUCT: ${productList[0]['product_name']}");
  }

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: ((context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : productList != null
                  ? ListView.builder(
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: ColorConstant.blackColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                      image: NetworkImage(
                                          productList[index]['images'])),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  productList[index]['product_name'],
                                  style: AppTextStyle.boldText(
                                      color: ColorConstant.primaryColor),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const SizedBox();
        }),
      ),
    );
  }
}
