import 'package:catering_service/constant.dart';
import 'package:catering_service/provider/cart_provider.dart';
import 'package:catering_service/view/screen/esewa/esewa_in_app.dart';
import 'package:catering_service/view/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CartProvider>(context, listen: false).getOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer<CartProvider>(
            builder: (context, cart, _) => cart.cartList.isEmpty
                ? Column(
                    children: [
                      Lottie.asset('assets/animations/empty.json'),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "No Item in Cart",
                        style: AppTextStyle.normalText(),
                      )
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.74,
                        child: ListView.builder(
                            itemCount: cart.cartList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 8.0,
                                ),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.15,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.blackColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    children: [
                                      const Positioned(
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/jeri.png'),
                                        ),
                                      ),
                                      Positioned(
                                        top: MediaQuery.sizeOf(context).height *
                                            0.03,
                                        left: MediaQuery.sizeOf(context).width *
                                            0.33,
                                        // right: 0,
                                        child: Text(
                                          cart.cartList[index]['food_items'],
                                          style: AppTextStyle.normalText(
                                            color: ColorConstant.primaryColor,
                                            fontSize: 20,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Positioned(
                                          top: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.12,
                                          left:
                                              MediaQuery.sizeOf(context).width *
                                                  0.33,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Iconsax.calendar,
                                                color:
                                                    ColorConstant.primaryColor,
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                cart.cartList[index]['date'],
                                                style: AppTextStyle.normalText(
                                                  color: ColorConstant
                                                      .primaryColor,
                                                ),
                                              ),
                                            ],
                                          )),
                                      Positioned(
                                        top: MediaQuery.sizeOf(context).height *
                                            0.08,
                                        left: MediaQuery.sizeOf(context).width *
                                            0.33,
                                        // right: 0,
                                        child: Text(
                                          "Quantity: ${cart.cartList[index]['number_of_people']}",
                                          style: AppTextStyle.normalText(
                                            color: ColorConstant.primaryColor,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: MediaQuery.sizeOf(context).height *
                                            0.08,
                                        right:
                                            MediaQuery.sizeOf(context).width *
                                                0.1,
                                        child: Text(
                                          "Total: ${cart.cartList[index]['number_of_people']}",
                                          style: AppTextStyle.normalText(
                                            color: ColorConstant.primaryColor,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: IconButton(
                                          onPressed: () async {
                                            final orderId = cart.cartList[index]
                                                ['order_id'];
                                            await cart
                                                .removeOrder(orderId)
                                                .then(
                                                  (value) =>
                                                      CustomSnackbar.showSnack(
                                                    context,
                                                    "Deleted",
                                                    ColorConstant.redColor,
                                                  ),
                                                );
                                            await cart.getOrders();
                                          },
                                          icon: Icon(
                                            Iconsax.close_square,
                                            color: ColorConstant.redColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Total: Rs 8000",
                            style: AppTextStyle.normalText(),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const EsewaPage()));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: ColorConstant.secondaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  "PROCEED",
                                  style: AppTextStyle.normalText(
                                      color: ColorConstant.primaryColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
