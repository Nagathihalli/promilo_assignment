import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:share/share.dart';

import '../models/card_data.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  void buildNextImage() {
    setState(() {
      CardData().nextImage();
    });
  }

  void buildPreviousImage() {
    setState(() {
      CardData().previousImage();
    });
  }

  Widget rebuildDotIndicator() {
    return CardData().buildDotsIndicator();
  }

  void shareImage() {
    final imageUrl = CardData().cardImageUrl[currentSelected];
    Share.share('Check out this image: $imageUrl');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          shadowColor: Colors.black,
          title: const Text("Description",
              style: TextStyle(fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Get.back();
            },
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  CardData().cardImageUrl[currentSelected]),
                              fit: BoxFit.cover)),
                      height: 400,
                      width: MediaQuery.of(context).size.width - 2 * 54,
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      left: 0,
                      child: rebuildDotIndicator(),
                    ),
                    Positioned(
                      left: 10,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                        onPressed: buildPreviousImage,
                      ),
                    ),
                    Positioned(
                        right: 10,
                        top: 0,
                        bottom: 0,
                        child: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                            onPressed: buildNextImage)),
                  ],
                ),
              ),
              Center(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade100,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    width: MediaQuery.of(context).size.width - 2 * 54,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.download_outlined),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.bookmark_border_outlined),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Bootstrap.heart),
                              onPressed: () {}, // Handle share action
                            ),
                            IconButton(
                              icon: const Icon(Icons.zoom_in_map_outlined),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.star_border),
                              onPressed: () {},
                            ),
                            IconButton(
                                icon: const Icon(Icons.share_outlined),
                                onPressed: shareImage // Handle share action
                                ),
                          ],
                        ))),
              ),
              _ratingRow(),
              _about()
            ],
          ),
        ),
      )),
    );
  }

  Widget _ratingRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.bookmark_border_outlined),
            onPressed: () {},
          ),
          const Text("1034", style: TextStyle(fontSize: 16)),
          IconButton(
            icon: const Icon(Bootstrap.heart),
            onPressed: () {}, // Handle share action
          ),
          const Text("1034", style: TextStyle(fontSize: 16)),
          const SizedBox(width: 10),
          Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(children: [
                    const Icon(Icons.star, color: Colors.blue),
                    const Icon(Icons.star, color: Colors.blue),
                    const Icon(Icons.star, color: Colors.blue),
                    Icon(Icons.star, color: Colors.blue.withOpacity(0.2)),
                    const Icon(Icons.star, color: Colors.white)
                  ]))),
          const SizedBox(width: 10),
          const Text("3.2", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _about() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Actor Name",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          const Text("Indian Actess",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black54)),
          const SizedBox(height: 10),
          const Row(children: [
            Icon(Icons.access_time_rounded),
            SizedBox(width: 10),
            Text("Duration 20 mins",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black54))
          ]),
          const SizedBox(height: 10),
          const Row(children: [
            Icon(Icons.payment),
            SizedBox(width: 10),
            Text("Total Average Fees ₹9,999",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black54))
          ]),
          const SizedBox(height: 10),
          const Text("About",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          const Text(
              "Fitness is a broad term that means something different to each person, but it refers to your own optimal health and overall well-being. Being fit not only means physical health, but emotional and mental health, too. It defines every aspect of your health. Smart eating and active living are fundamental to fitness.",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black54)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See More",
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
