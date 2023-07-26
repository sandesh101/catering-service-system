import 'package:catering_service/constant.dart';
import 'package:catering_service/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({Key? key}) : super(key: key);

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<ProductProvider>(context, listen: false)
          .availableProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: FirebaseFirestore.instance.collection('products').snapshots(),
      //   builder: ((context, snapshot) {
      //     return snapshot.connectionState == ConnectionState.waiting
      //         ? const Center(
      //             child: CircularProgressIndicator(),
      //           )
      //         :
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, _) => ListView.builder(
          itemCount: productProvider.productList.length,
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
                              productProvider.productList[index]['images'])),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      productProvider.productList[index]['product_name'],
                      style: AppTextStyle.boldText(
                          color: ColorConstant.primaryColor),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
