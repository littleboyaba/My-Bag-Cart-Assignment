import 'package:flutter/material.dart';
import 'product_card.dart';

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  ShoppingAppState createState() => ShoppingAppState();
}

class ShoppingAppState extends State<ShoppingApp> {
  List<int> quantities = [1, 1, 1];
  double totalPrice = 0.0;

  void updateTotalPrice() {
    double total = 0.0;
    for (int i = 0; i < quantities.length; i++) {
      total += quantities[i] * getItemPrice(i);
    }

    setState(() {
      totalPrice = total;
    });
  }

  double getItemPrice(int index) {
    switch (index) {
      case 0:
        return 51.0;
      case 1:
        return 30.0;
      case 2:
        return 43.0;
      default:
        return 0.0;
    }
  }

  @override
  void initState() {
    super.initState();
    updateTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProductCard(
                  itemName: 'Pullover',
                  unitPrice: 51.0,
                  color: 'Black',
                  size: 'L',
                  image: 'pullover',
                  quantity: quantities[0],
                  updateTotalPrice: updateTotalPrice,
                  updateQuantity: (value) {
                    if (value > 0 && value <= 15) {
                      Future.delayed(Duration.zero, () {
                        setState(() {
                          quantities[0] = value;
                          updateTotalPrice();
                          if (value == 5) {
                            showAddedToBagDialog('Pullover', value);
                          }
                        });
                      });
                    }
                  },
                ),
                ProductCard(
                  itemName: 'T-Shirt',
                  unitPrice: 30.0,
                  color: 'Grey',
                  size: 'L',
                  image: 'tshirt',
                  quantity: quantities[1],
                  updateTotalPrice: updateTotalPrice,
                  updateQuantity: (value) {
                    if (value > 0 && value <= 15) {
                      Future.delayed(Duration.zero, () {
                        setState(() {
                          quantities[1] = value;
                          updateTotalPrice();
                          if (value == 5) {
                            showAddedToBagDialog('T-Shirt', value);
                          }
                        });
                      });
                    }
                  },
                ),
                ProductCard(
                  itemName: 'Sport Dress',
                  unitPrice: 43.0,
                  color: 'Black',
                  size: 'M',
                  image: 'sportdress',
                  quantity: quantities[2],
                  updateTotalPrice: updateTotalPrice,
                  updateQuantity: (value) {
                    if (value > 0 && value <= 15) {
                      Future.delayed(Duration.zero, () {
                        setState(() {
                          quantities[2] = value;
                          updateTotalPrice();
                          if (value == 5) {
                            showAddedToBagDialog('Sport Dress', value);
                          }
                        });
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        TotalPriceRow(totalPrice: totalPrice),
        CheckoutButton(
            onCheckout: () => showSnackbar(
                context, 'Congratulations! Your order has been placed.')),
      ],
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void showAddedToBagDialog(String itemName, int quantity) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulation!'),
          content: Text("You have added $quantity $itemName's on your bag!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OKAY',
                style: TextStyle(
                  background: Paint()
                    ..strokeWidth = 30
                    ..color = Colors.red
                    ..strokeJoin = StrokeJoin.round
                    ..strokeCap = StrokeCap.round
                    ..style = PaintingStyle.stroke,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
