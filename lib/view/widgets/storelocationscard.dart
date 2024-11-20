import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StoreLocatorWidget extends StatefulWidget {
  const StoreLocatorWidget({super.key});

  @override
  State<StoreLocatorWidget> createState() => _StoreLocatorWidgetState();
}

class _StoreLocatorWidgetState extends State<StoreLocatorWidget> {
  TextEditingController pinController = TextEditingController();

  int currentIndex = 0;

  final List<Map<String, String>> carouselItems = [
    {
      'image': 'assets/images/location1.jpeg',
      'location': 'Phoenix Market City, Pune',
    },
    {
      'image': 'assets/images/location2.jpeg',
      'location': 'Lulu Mall, Bengaluru',
    },
    {
      'image': 'assets/images/location1.jpeg',
      'location': 'Orion Mall, Bengaluru',
    },
    {
      'image': 'assets/images/location3.jpeg',
      'location': 'Mall of Travancore, Kerala',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Expanded(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 300,
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
                                  top: 10,
                                  left: 15,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.transparent
                                            .withOpacity(0.3)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 8.0),
                                          Text(
                                            item['location']!,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
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
                            border: Border.all(color: const Color(0xffcf2228)),
                            color: index == currentIndex
                                ? const Color(0xffcf2228)
                                : Colors.transparent,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              Container(
                height: 150,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(color: Color(0xffcf2228)),
                        left: BorderSide(color: Color(0xffcf2228)),
                        right: BorderSide(color: Color(0xffcf2228))),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/storesimage.png',
                      height: 100,
                      scale: 2.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 20, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                            height: 42,
                            width: 170,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffcf2228)),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TextField(
                                cursorColor: Colors.black,
                                cursorRadius: const Radius.circular(20),
                                cursorHeight: 21,
                                cursorWidth: 1,
                                controller: pinController,
                                decoration: const InputDecoration(
                                  labelText: null,
                                  hintText: "PIN",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xffcf2228),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_circle_right,
                            size: 35,
                            color: Color(0xffcf2228),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
