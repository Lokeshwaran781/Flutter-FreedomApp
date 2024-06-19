import 'package:flutter/material.dart';
import 'package:freedom_app/Bloc/DropDown/CardTypeWidget.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  String cardType = 'Visa';

  var cardTypes = [
    'Visa',
    'Master Card',
    'Rupay',
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumController = TextEditingController();
  final TextEditingController exMmController = TextEditingController();
  final TextEditingController exYyController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, size: 30),
        centerTitle: true,
        title: Text('Checkout'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            height: 1.0,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.more_vert_outlined, size: 30),
          ),
        ],
      ),
      body: 
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Credit Card Type',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.lightBlue),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Container(
                  width: 0.90 * MediaQuery.of(context).size.width,
                  child: DropdownButtonHideUnderline(
                    child: Cardtypewidget(),
                    // child: DropdownButton(
                    //   value: cardType,
                    //   icon: Icon(Icons.keyboard_arrow_down),
                    //   items: cardTypes.map((String card) {
                    //     return DropdownMenuItem(
                    //       child: Padding(
                    //         padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
                    //         child: Text(
                    //           card,
                    //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
                    //         ),
                    //       ),
                    //       value: card,
                    //     );
                    //   }).toList(),
                    //   onChanged: (String? newValue) {
                    //     setState(() {
                    //       cardType = newValue!;
                    //     });
                    //   },
                    // ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  'Full Name on card',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.lightBlue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Example John Jason Doe',
                    hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  'Credit Card Number',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.lightBlue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextField(
                  controller: cardNumController,
                  keyboardType: TextInputType.number,
                  maxLength: 16,
                  decoration: InputDecoration(
                    hintText: 'Ex: 0000 0000 0000 0000',
                    hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    counter: SizedBox.shrink()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Text(
                      'Expiration Date',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.lightBlue),
                    ),
                    Spacer(),
                    Text(
                      'CVV Code',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.lightBlue),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: exMmController,
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'MM',
                          hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          counter: SizedBox.shrink()
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: exYyController,
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        decoration: InputDecoration(
                          hintText: 'YY',
                          hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          counter: SizedBox.shrink()
                        ),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: TextField(
                        controller: cvvController,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        decoration: InputDecoration(
                          hintText: 'Ex: 000',
                          hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          counter: SizedBox.shrink()
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        color: Colors.lightBlue,
        child: ElevatedButton(
          child: Text('Buy Now',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white),textAlign: TextAlign.center,),
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent
          ),
          ),
      ),
    );
  }
}
