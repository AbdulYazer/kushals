import 'package:flutter/material.dart';
import 'package:kushals/view/widgets/newarrivalcard.dart';

class DiwaliCard extends StatefulWidget {
  const DiwaliCard({super.key});
  @override
  State<DiwaliCard> createState() => _DiwaliCardState();
}

class _DiwaliCardState extends State<DiwaliCard> {
  int tabValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20), bottom: Radius.circular(20)),
                  child: Image.asset(
                    'assets/images/necklace.jpg',
                    height: 700,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Diwali Look",
                      style: TextStyle(
                        fontFamily: 'PlayFairDisplay',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 350,
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
                        height: 340,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.transparent,
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TabBar(
                              onTap: (v) {
                                setState(() {
                                  tabValue = v;
                                });
                              },
                              indicatorWeight: 0,
                              indicatorPadding: EdgeInsets.zero,
                              indicator: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              isScrollable: false,
                              padding: EdgeInsets.zero,
                              labelPadding: const EdgeInsets.all(4),
                              indicatorColor: Colors.white,
                              dividerHeight: 0,
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              labelStyle:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              tabs: [
                                Tab(
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color:
                                            tabValue == 0 ? null : Colors.white,
                                        gradient: tabValue == 0
                                            ? const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffcf2228),
                                                  Color(0xffe20057),
                                                ],
                                              )
                                            : null),
                                    child:
                                        const Center(child: Text('Necklaces')),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color:
                                            tabValue == 1 ? null : Colors.white,
                                        gradient: tabValue == 1
                                            ? const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffcf2228),
                                                  Color(0xffe20057),
                                                ],
                                              )
                                            : null),
                                    child: const Center(child: Text('Bangles')),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color:
                                            tabValue == 2 ? null : Colors.white,
                                        gradient: tabValue == 2
                                            ? const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffcf2228),
                                                  Color(0xffe20057),
                                                ],
                                              )
                                            : null),
                                    child:
                                        const Center(child: Text('Earrings')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 400,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                _buildJewelryList([
                                  {
                                    'image': 'assets/images/necklace.jpg',
                                    'title': 'Zicron Necklace 146312',
                                    'price': '9999'
                                  },
                                  {
                                    'image': 'assets/images/necklace.jpg',
                                    'title': 'Zicron Necklace 142212',
                                    'price': '6999'
                                  },
                                  {
                                    'image': 'assets/images/necklace.jpg',
                                    'title': 'Zicron Necklace 148272',
                                    'price': '7499'
                                  },
                                  {
                                    'image': 'assets/images/necklace.jpg',
                                    'title': 'Zicron Necklace 143242',
                                    'price': '8999'
                                  },
                                ]),
                                _buildJewelryList([
                                  {
                                    'image': 'assets/images/bangles.jpg',
                                    'title': 'Zicron Bangles 146235',
                                    'price': '3499'
                                  },
                                  {
                                    'image': 'assets/images/bangles.jpg',
                                    'title': 'Zicron Bangles 146719',
                                    'price': '3999'
                                  },
                                ]),
                                _buildJewelryList([
                                  {
                                    'image': 'assets/images/earring.jpg',
                                    'title': 'Zicron Earrings 1467822',
                                    'price': '2499'
                                  },
                                  {
                                    'image': 'assets/images/earring.jpg',
                                    'title': 'Zicron Earrings 1462322',
                                    'price': '2299'
                                  },
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJewelryList(List<Map<String, String>> items) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
            child: Column(
              children: [
                NewArrivalCard(
                  imageUrl: item['image']!,
                  name: item['title']!,
                  price: int.parse(item['price']!),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
