import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../description_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<Map<String, String>> _images = [
    {'path': 'assets/images1.jpeg', 'text': 'Popular MeetUps\nin India'},
    {
      'path': 'assets/images2.jpeg',
      'text': 'Global Meeting with\nlead Manager'
    },
    {'path': 'assets/images3.jpg', 'text': 'Discussion with\nTeam Leads'},
  ];

  List randomImages = [
    "assets/person1.jpg",
    "assets/person2.jpg",
    "assets/person3.jpg",
    "assets/person4.jpg",
    "assets/person5.jpg",
  ];

  final List<String> images = [
    'assets/images1.jpeg',
    'assets/images2.jpeg',
    'assets/images3.jpg',
    'assets/images1.jpeg',
    'assets/images2.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  // controller: loginViewModel.passwordController,
                  decoration: InputDecoration(
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.black26),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12)),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.mic),
              )),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return _buildCard(
                        _images[index]['path']!, _images[index]['text']!);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _images.map((image) {
                  int index = _images.indexOf(image);
                  return _buildIndicator(_currentPage == index);
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text("Trending Popular People",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              const SizedBox(height: 20),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _popularPeople(
                          "Ali Pay", "1,028 Meetups", Bootstrap.alipay),
                      const SizedBox(width: 15),
                      _popularPeople("Amazon", "234 Meetups", Bootstrap.amazon),
                      const SizedBox(width: 15),
                      _popularPeople("Radio", "984 Meetups", Bootstrap.boombox)
                    ],
                  )),
              const SizedBox(height: 20),
              const Text("Top Trending Meetups",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              const SizedBox(height: 20),
              topTrendingCard(),
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 12.0 : 8.0,
      width: isActive ? 12.0 : 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.grey,
      ),
    );
  }

  Widget _buildCard(String imagePath, String text) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _popularPeople(
      String metUpTitle, String metUpSubtitle, IconData iconsTip) {
    return SizedBox(
      width: 380,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      iconsTip,
                      size: 30,
                    )),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      metUpTitle,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(metUpSubtitle)
                  ],
                )
              ]),
              const Divider(thickness: 3, endIndent: 10, indent: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    for (int i = 0; i < randomImages.length; i++)
                      Align(
                        widthFactor: 0.7,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(randomImages[i]),
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.blueAccent.shade100),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)))),
                    child: const Text(
                      "See More",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget topTrendingCard() {
    return GestureDetector(
        onTap: () {
          Get.to(const DescriptionPage());
        },
        child: SizedBox(
            height: 250, // Adjust the height as necessary
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Transform.translate(
                    offset: const Offset(20, 0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                                width: 160,
                                height: double.infinity,
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    width: 65,
                                    height: 80,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                        child: Text('${index + 1}',
                                            style: const TextStyle(
                                                fontSize: 24,
                                                color: Colors.black)))))
                          ],
                        )));
              },
            )));
  }
}
