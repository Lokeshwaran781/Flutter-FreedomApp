import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:freedom_app/pages/ProductPage.dart';

class headoutpage extends StatefulWidget {
  const headoutpage({super.key});

  @override
  State<headoutpage> createState() => _headoutpageState();
}

class _headoutpageState extends State<headoutpage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  var imgList = [
    'android/images/corousel_slider/Athri_Hill.webp',
    'android/images/corousel_slider/Kookal_waterfalls.webp',
    'android/images/corousel_slider/sathuragiri_hill.webp',
  ];

  var iconpanel = [
    Column(
      children: [
        Icon(
          Icons.location_pin,
          size: 40,
          color: Colors.black54,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            'Near by',
            style: TextStyle(color: Colors.black54),
          ),
        )
      ],
    ),
    Column(
      children: [
        Icon(
          Icons.phone_android_outlined,
          size: 40,
          color: Colors.black54,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            'Mobile Ticket',
            style: TextStyle(color: Colors.black54),
          ),
        )
      ],
    ),
    Column(
      children: [
        Icon(
          Icons.car_rental_outlined,
          size: 40,
          color: Colors.black54,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            'Hotel Pickup',
            style: TextStyle(color: Colors.black54),
          ),
        )
      ],
    ),
    Column(
      children: [
        Icon(
          Icons.more_horiz_rounded,
          size: 40,
          color: Colors.black54,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            '+3 more',
            style: TextStyle(color: Colors.black54),
          ),
        )
      ],
    )
  ];
  bool likeicon = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Image(
                image: AssetImage('android/images/logo/headout_logo.png'),
                height: 30,
                width: 50,
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'head',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                    text: 'out',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.phone_outlined,
              size: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('android/icons/chat.png'),
              width: 20,
              height: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.settings_outlined,
              size: 29,
            ),
          )
        ],
        centerTitle: false,
      ),
      body: Column(children: [
        Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              items: imgList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Image.asset(
                        i,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 0.75,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.5),
            child: Card(
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(
                                _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList()),
              elevation: 4.0,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width - 50,
            top: 10,
            child: Card(
              child: GestureDetector(
                child: !likeicon
                    ? Icon(
                        Icons.favorite_border_outlined,
                        size: 35,
                      )
                    : Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 35,
                      ),
                onTap: () {
                  setState(() {
                    likeicon = !likeicon;
                  });
                },
              ),
              elevation: 3,
              color: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
          )
        ]),
        Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  width: 2.25 * MediaQuery.of(context).size.width / 3,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 6.0, 20.0, 2.0),
                          child: Text(
                            'Jungle Yoga Retreat and Hiking',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 8.0, 20.0, 2.0),
                          child: Row(
                            children: [
                              Text(
                                '4.3',
                                style: TextStyle(
                                    color: Color(0xFFFFDDA520), fontSize: 20),
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFDDA520),
                                size: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  '3026 Reviews ',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 18),
                                ),
                              ),
                              Text(
                                '>',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 24),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: 0.75 * MediaQuery.of(context).size.width / 3,
                    child: Column(
                      children: [
                        Text(
                          'from \$169',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.black54,
                              fontSize: 14),
                        ),
                        Text(
                          '\$160',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Container(
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Save 5%',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 8.0),
          child: Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                            child: Text(
                              'OUTDOOR',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.black12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                            child: Text(
                              'SIGHT-SEEING',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.black12),
                        ),
                      )
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            children: iconpanel,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 24.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Highlights',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                        '• Get one to one with nature as you hike through forests, waterfalls & landscapes.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        )),
                  ),
                ],
              )),
        )
      ]),
      bottomNavigationBar: ElevatedButton(
        child: Text('Navigate to products page'),
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=> ProductPage())
            );
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
      ),
    );
  }
}
