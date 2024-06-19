import 'package:flutter/material.dart';
import 'package:freedom_app/api/GetCart.dart';
import 'package:freedom_app/models/ProductCartModel.dart';
import 'package:freedom_app/pages/CheckOutPage.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<ProductCartModel?> myCart = [];
  double totalprice = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      List<ProductCartModel> cartproducts = await getCart();
      setState(() {
        myCart = cartproducts;
        totalprice = getTotalPrice();
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var item in myCart) {
      if (item != null) {
        total += item.price * item.quantity;
      }
    }
    return total;
  }

  void updateTotalPrice() {
    setState(() {
      totalprice = getTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: myCart.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: myCart.length,
              itemBuilder: (context, index) {
                var item = myCart[index]!;
                return Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black54))),
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        item.image,
                        width: 0.90 * MediaQuery.of(context).size.width / 5,
                        height: 100,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 1.90 * MediaQuery.of(context).size.width / 5,
                                  child: Text(
                                    item.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                item.quantity == 0
                                    ? Container(
                                        width: 1.5 * MediaQuery.of(context).size.width / 5,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              item.quantity = item.quantity + 1;
                                              updateTotalPrice();
                                            });
                                          },
                                          child: Text(
                                            '+ ADD',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red[600],
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        height: 35,
                                      )
                                    : Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 45,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100.0),
                                              color: Colors.red[600],
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  item.quantity = item.quantity - 1;
                                                  updateTotalPrice();
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                backgroundColor: Colors.transparent,
                                                shadowColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(100.0),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '-',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              item.quantity.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Container(
                                            height: 35,
                                            width: 45,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100.0),
                                              color: Colors.red[600],
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  item.quantity = item.quantity + 1;
                                                  updateTotalPrice();
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                backgroundColor: Colors.transparent,
                                                shadowColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(100.0),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '+',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                              child: Text(
                                '${item.quantity} x ${item.price} = ₹${item.price * item.quantity}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(230, 207, 5, 1),
        child: ElevatedButton(
          child: Row(
            children: [
              Container(
                width: 0.2 * MediaQuery.of(context).size.width,
                child: Text(
                  '₹${totalprice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Text(
                  'CHECKOUT  ->',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                width: 0.65 * MediaQuery.of(context).size.width,
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckOutPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
