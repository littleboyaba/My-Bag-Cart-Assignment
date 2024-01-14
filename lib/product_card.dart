import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.asset(
                      'assets/images/${widget.image.toLowerCase()}.png'),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: SizedBox(
                    height: 120,
                    width: 238,
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // ============== Name Title & Menu Icon Start ============
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                widget.itemName,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              // ============ SVG Icon Experiment ============
                              IconButton(
                                icon: SvgPicture.asset(
                                  'assets/icons/ellipsisIcon.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                onPressed: () {
                                  // Handle button press
                                },
                              ),
                              //============ SVG Icon Experiment =============
                            ],
                          ),
                          // ============== Name Title End ============

                          // ============== Color & Size Start ============
                          Row(
                            children: [
                              // ============== RichText Experiment ============
                              RichText(
                                text: TextSpan(
                                  text: 'Color: ',
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: widget.color,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              // ============== RichText Experiment ============
                              const SizedBox(width: 10),
                              RichText(
                                text: TextSpan(
                                  text: 'Size: ',
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: widget.size,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              // ============== RichText Experiment ============
                            ],
                          ),
                          // ============== Color & Size  End ============
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  // ===================== Increment Decrement Button & Price Section =================
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      // ===================== Increment Decrement Button Start =================
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          if (widget.quantity > 1) {
                                            widget.updateQuantity(
                                                widget.quantity - 1);
                                          }
                                        },
                                      ),
                                      Text('${widget.quantity}'),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          if (widget.quantity < 15) {
                                            widget.updateQuantity(
                                                widget.quantity + 1);
                                            if (widget.quantity == 5) {
                                              // Show dialog or perform other actions if needed
                                            }
                                          }
                                        },
                                      ),
                                      // ===================== Increment Decrement Button End =================

                                      const Spacer(),
                                      // ===================== Item Price Start =================
                                      Text(
                                        '\$${(widget.quantity * widget.unitPrice)}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // ===================== Item Price End =================
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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

// ===================== Total Price Section =================

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
            'Total Amount:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '\$$totalPrice',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// ===================== Check Out Section =================

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
