import 'package:flutter/material.dart';

class ShopByDesignCard extends StatefulWidget {
  final bool shopByOccasion;

  const ShopByDesignCard({super.key, this.shopByOccasion = false});
  @override
  State<ShopByDesignCard> createState() => _ShopByDesignCardState();
}

class _ShopByDesignCardState extends State<ShopByDesignCard> {
  int tabValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
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
                    widget.shopByOccasion
                        ? 'assets/images/bangles.jpg'
                        : 'assets/images/necklace.jpg',
                    height: 500,
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
                    child: Text(
                      widget.shopByOccasion
                          ? "Shop by Occassion"
                          : "Shop by Design",
                      style: const TextStyle(
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
                        height: 150,
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
                        height: 140,
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
                                    child: Center(
                                        child: Text(widget.shopByOccasion
                                            ? 'Festive'
                                            : 'Necklaces')),
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
                                    child: Center(
                                        child: Text(widget.shopByOccasion
                                            ? 'Casual'
                                            : 'Bangles')),
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
                                    child: Center(
                                        child: Text(widget.shopByOccasion
                                            ? 'Party'
                                            : 'Earrings')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 130,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                _buildJewelryList([
                                  {
                                    'image': 'assets/images/necklace.jpg',
                                    'title': 'Short'
                                  },
                                  {
                                    'image': 'assets/images/necklace.jpg',
                                    'title': 'Long'
                                  },
                                  {
                                    'image': 'assets/images/necklace.jpg',
                                    'title': 'Chocker'
                                  },
                                  {
                                    'image': 'assets/images/necklace.jpg',
                                    'title': 'Layered'
                                  },
                                ]),
                                _buildJewelryList([
                                  {
                                    'image': 'assets/images/bangles.jpg',
                                    'title': 'Gold'
                                  },
                                  {
                                    'image': 'assets/images/bangles.jpg',
                                    'title': 'Silver'
                                  },
                                ]),
                                _buildJewelryList([
                                  {
                                    'image': 'assets/images/earring.jpg',
                                    'title': 'Stud'
                                  },
                                  {
                                    'image': 'assets/images/earring.jpg',
                                    'title': 'Drop'
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
                CircleAvatar(
                  radius: 45,
                  backgroundColor: const Color(0xffcf2228),
                  child: CircleAvatar(
                    radius: 44,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage(item['image']!),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item['title']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
