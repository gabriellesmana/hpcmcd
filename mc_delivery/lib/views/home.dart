import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mc_delivery/controllers/home_controller.dart';


class Home extends StatelessWidget {
  Home({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Text(
              'Muhamad Zidane',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 20,
                ),
                Text(
                  'Tangerang, Banten',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 5),
                    blurRadius: 6,
                    color: Colors.black38,
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Icon(
                  Icons.search,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      // INI BAGIAN BOTTOM NAVBAR //
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
           boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 6),
                    blurRadius: 10,
                    color: Colors.black38,
                  ),
                ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: GNav (
            gap: 8,
            iconSize: 30,
            backgroundColor: Colors.white,
            tabBackgroundColor: Colors.red,
            color: Color.fromRGBO(145, 13, 27, 1),
            padding: EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.home,
                text : 'Home'
                ),
              GButton(
                icon: Icons.broken_image_sharp,
                text: 'Voucher',
                ),
              GButton(
                icon: Icons.article_outlined,
                text: 'Menu',
                ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                ),
            ],
          ),
        ),
      ),
      // INI BAGIAN BOTTOM NAVBAR //
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: homeController.imgSlider.length,
                options: CarouselOptions(
                    height: 175,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 7),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 2000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.95,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      homeController.current.value = index;
                    }),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      homeController.imgSlider[index],
                      width: size.width,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: homeController.imgSlider.map((img) {
                  int index = homeController.imgSlider.indexOf(img);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: homeController.current.value == index
                          ? const Color.fromRGBO(0, 0, 0, 0.9)
                          : const Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),
              Container(
                // color: Colors.white,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Image.asset('assets/images/diskon.png'),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              'Voucer',
                              style: TextStyle(
                                fontSize: 15,
                                // fontWeight: FontWeight.bold,
                              ),
                              ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Image.asset('assets/images/frame14.png'),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              'Kategori',
                              style: TextStyle(
                                fontSize: 15,
                                // fontWeight: FontWeight.bold,
                              ),
                              ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Image.asset('assets/images/frame15.png'),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              'Terdekat',
                              style: TextStyle(
                                fontSize: 15,
                                // fontWeight: FontWeight.bold,
                              ),
                              ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Image.asset('assets/images/frame16.png'),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              'Terlaris',
                              style: TextStyle(
                                fontSize: 15,
                                // fontWeight: FontWeight.bold,
                              ),
                              
                              ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:40),
                child: Column(
                  children: [
                    Text('Menu',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    )
                  ],
                ),
              ),
             
              Container(
                // margin: EdgeInsets.only(left: 50),
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 239, 210, 1),
                        ),
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: <Widget> [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset("assets/images/burger1.png")
                            ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('BicMac Beef',
                              style: TextStyle(color: Color.fromRGBO(145, 13, 27, 1), fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                           ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('Rp. 25.000'),
                            ),
                           ),
                           SizedBox(height: 20),
                           SizedBox(
                            width: 140,
                            height: 35,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Color.fromRGBO(145, 13, 27, 1)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: (() {}),
                              child: Text(
                                'Tambah',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 239, 210, 1),
                        ),
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: <Widget> [
                          Container(
                            // margin: EdgeInsets.only(top: 20),
                            child: Image.asset("assets/images/image14.png")
                            ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('BicMac Beef X',
                              style: TextStyle(color: Color.fromRGBO(145, 13, 27, 1), fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                           ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('Rp. 25.000'),
                            ),
                           ),
                           SizedBox(height: 20),
                           SizedBox(
                            width: 140,
                            height: 35,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Color.fromRGBO(145, 13, 27, 1)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: (() {}),
                              child: Text(
                                'Tambah',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // margin: EdgeInsets.only(left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 239, 210, 1),
                        ),
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: <Widget> [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset("assets/images/image5.png")
                            ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('PaMer 5',
                              style: TextStyle(color: Color.fromRGBO(145, 13, 27, 1), fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                           ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('Rp. 102.000'),
                            ),
                           ),
                           SizedBox(height: 20),
                           SizedBox(
                            width: 140,
                            height: 35,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Color.fromRGBO(145, 13, 27, 1)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: (() {}),
                              child: Text(
                                'Tambah',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 239, 210, 1),
                        ),
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: <Widget> [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset("assets/images/image7.png")
                            ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('PaMer 7',
                              style: TextStyle(color: Color.fromRGBO(145, 13, 27, 1), fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                           ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('Rp. 150.750'),
                            ),
                           ),
                           SizedBox(height: 20),
                           SizedBox(
                            width: 140,
                            height: 35,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Color.fromRGBO(145, 13, 27, 1)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: (() {}),
                              child: Text(
                                'Tambah',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // margin: EdgeInsets.only(left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 239, 210, 1),
                        ),
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: <Widget> [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset("assets/images/image16.png")
                            ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('PaNas 2 w Rice',
                              style: TextStyle(color: Color.fromRGBO(145, 13, 27, 1), fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                           ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('Rp. 48.500'),
                            ),
                           ),
                           SizedBox(height: 20),
                           SizedBox(
                            width: 140,
                            height: 35,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Color.fromRGBO(145, 13, 27, 1)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: (() {}),
                              child: Text(
                                'Tambah',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 239, 210, 1),
                        ),
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: <Widget> [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset("assets/images/image6.png")
                            ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('Nasi Uduk',
                              style: TextStyle(color: Color.fromRGBO(145, 13, 27, 1), fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                           ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('Rp. 20.000'),
                            ),
                           ),
                           SizedBox(height: 20),
                           SizedBox(
                            width: 140,
                            height: 35,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Color.fromRGBO(145, 13, 27, 1)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: (() {}),
                              child: Text(
                                'Tambah',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // margin: EdgeInsets.only(left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 239, 210, 1),
                        ),
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: <Widget> [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset("assets/images/image 17.png")
                            ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('McNuggets S',
                              style: TextStyle(color: Color.fromRGBO(145, 13, 27, 1), fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                           ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('Rp. 39.500'),
                            ),
                           ),
                           SizedBox(height: 20),
                           SizedBox(
                            width: 140,
                            height: 35,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Color.fromRGBO(145, 13, 27, 1)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: (() {}),
                              child: Text(
                                'Tambah',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 239, 210, 1),
                        ),
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: <Widget> [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset("assets/images/image 18.png")
                            ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('PaNas Spesial ',
                              style: TextStyle(color: Color.fromRGBO(145, 13, 27, 1), fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                           ),
                           SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(top:5),
                              child: Text('Rp. 45.000'),
                            ),
                           ),
                           SizedBox(height: 20),
                           SizedBox(
                            width: 140,
                            height: 35,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Color.fromRGBO(145, 13, 27, 1)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: (() {}),
                              child: Text(
                                'Tambah',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







   




