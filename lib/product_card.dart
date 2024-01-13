import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String itemName;
  final double unitPrice;
  final String color;
  final String size;
  final String image;
  final int quantity;
  final Function updateTotalPrice;
  final Function(int) updateQuantity;

  const ProductCard({
    Key? key,
    required this.itemName,
    required this.unitPrice,
    required this.color,
    required this.size,
    required this.image,
    required this.quantity,
    required this.updateTotalPrice,
    required this.updateQuantity,
  }) : super(key: key);

  @override
  ProductCardState createState() => ProductCardState();
}

class ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                  child: Image.asset(
                      'assets/images/${widget.image.toLowerCase()}.png'),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.itemName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text('Color: ${widget.color}'),
                        const SizedBox(width: 10),
                        Text('Size: ${widget.size}'),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                if (widget.quantity > 1) {
                                  widget.updateQuantity(widget.quantity - 1);
                                }
                              },
                            ),
                            Text('${widget.quantity}'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                if (widget.quantity < 15) {
                                  widget.updateQuantity(widget.quantity + 1);
                                  if (widget.quantity == 5) {
                                    // Show dialog or perform other actions if needed
                                  }
                                }
                              },
                            ),
                            const SizedBox(width: 40),
                            Text(
                              'Price: \$${(widget.quantity * widget.unitPrice).toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class TotalPriceRow extends StatelessWidget {
  final double totalPrice;

  const TotalPriceRow({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Total Price:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '\$${totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  final VoidCallback onCheckout;

  const CheckoutButton({Key? key, required this.onCheckout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: onCheckout,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade400,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        child: const Text(
          'CHECK OUT',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
