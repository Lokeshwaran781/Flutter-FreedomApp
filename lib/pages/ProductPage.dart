import 'package:flutter/material.dart';
import 'package:freedom_app/api/AllProducts.dart';
import 'package:freedom_app/api/Category.dart';
import 'package:freedom_app/api/GetProductByCategory.dart';
import 'package:freedom_app/api/SaveCart.dart';
import 'package:freedom_app/models/ProductModel.dart';
import 'package:freedom_app/pages/CartPage.dart';
import 'package:freedom_app/shared/StarRating.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ProductModel> allprod = [];
  Map<int, int> quan = {};
  List<String> categories = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void getallprod() async {
    List<ProductModel> products = await allProducts() ?? [];
    updateProducts(products);
  }

  void getprodcat(String cat) async {
    List<ProductModel> products = await getProductByCategories(cat) ?? [];
    updateProducts(products);
  }

  void updateProducts(List<ProductModel> products) {
    setState(() {
      allprod = products;
    });
  }

  void fetchData() async {
    try {
      List<ProductModel> products = await allProducts() ?? [];
      Map<int, int> quantities = Map<int, int>();
      for (var prod in products) {
        quantities[prod.id] = 0;
      }
      var cat = await getCategories();
      categories = ['All Products', ...cat];

      setState(() {
        allprod = products;
        quan = quantities;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xe4f7f7f7),
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back,color: Colors.white,),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.red[600],
          centerTitle: true,
          title: Text('Deals of the Week',
              style: TextStyle(color: Colors.white, fontSize: 24)),
          actions: [
            Text(''),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 0.06 * MediaQuery.of(context).size.height,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Row(
                children: [
                  Text('${allprod.length} Products Found',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Spacer(),
                  GestureDetector(
                    child: Icon(Icons.menu_outlined),
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: allprod.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio: 1.6,
                            child: Image.network(allprod[index].image),
                          ),
                          StarRating(
                              rating: double.parse(
                                  allprod[index].rating.rate.toString())),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              allprod[index].title,
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 12.0),
                            child: Text(
                              '₹ ${allprod[index].price.toString()}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          quan.isNotEmpty && quan[allprod[index].id] == 0
                              ? Container(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        quan[allprod[index].id] =
                                            quan[allprod[index].id]! + 1;
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
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: Colors.red[600],
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            quan[allprod[index].id] =
                                                quan[allprod[index].id]! - 1;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets
                                              .zero, // Remove default padding
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
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
                                        quan[allprod[index].id].toString(),
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
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: Colors.red[600],
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            quan[allprod[index].id] =
                                                quan[allprod[index].id]! + 1;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets
                                              .zero, 
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
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
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: categories
                .map(
                  (item) => ListTile(
                    title: Text(item),
                    onTap: () {
                      if (item == 'All Products') {
                        getallprod();
                      } else {
                        getprodcat(item);
                      }
                      Navigator.pop(context);
                    },
                  ),
                )
                .toList(),
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 16.0, 14.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[600],
                ),
                onPressed: () async {
                  await addtocart(quan);
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context)=>CartPage())
                    );
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 45,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
