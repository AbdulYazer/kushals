import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int currentIndex = 0;
  final List<Map<String, String>> carouselItems = [
    {
      'image': 'assets/images/model1.jpg',
      'title': 'Tara',
      'subtitle': 'Sutaria',
    },
    {
      'image': 'assets/images/model2.jpg',
      'title': 'Kriti',
      'subtitle': 'Sanon',
    },
    {
      'image': 'assets/images/model1.jpg',
      'title': 'Tara',
      'subtitle': 'Sutaria',
    },
    {
      'image': 'assets/images/model2.jpg',
      'title': 'Kriti',
      'subtitle': 'Sanon',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 550,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  items: carouselItems.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(item['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.white.withOpacity(1),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              left: 15,
                              right: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    item['title']!,
                                    style: const TextStyle(
                                      height: 1,
                                      fontSize: 30,
                                      fontFamily: 'PlayFairDisplay',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffcf2228),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    item['subtitle']!,
                                    style: const TextStyle(
                                      height: 1,
                                      fontSize: 50,
                                      fontFamily: 'PlayFairDisplay',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffcf2228),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: const Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(8.0, 4, 8, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Explore",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(carouselItems.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: index == currentIndex ? 12 : 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == currentIndex
                            ? Colors.red
                            : Colors.red.withOpacity(0.4),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}
