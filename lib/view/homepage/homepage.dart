import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kushals/model/products.dart';
import 'package:kushals/view/widgets/shopbydesigncard.dart';

import '../widgets/diwalilookcard.dart';
import '../widgets/imagecarousel.dart';
import '../widgets/newarrivalcard.dart';
import '../widgets/storelocationscard.dart';
import '../widgets/videoplayerwidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();

  int tabValue = 0;

  List<JewelType> jewelTypes = [
    JewelType(
        jewelType: 'Earrings', jewelImageUrl: 'assets/images/earring.jpg'),
    JewelType(
        jewelType: 'Necklaces', jewelImageUrl: 'assets/images/necklace.jpg'),
    JewelType(jewelType: 'Bangles', jewelImageUrl: 'assets/images/bangles.jpg'),
    JewelType(jewelType: 'Kada', jewelImageUrl: 'assets/images/kada.jpg'),
    JewelType(
        jewelType: 'Nettichutti',
        jewelImageUrl: 'assets/images/nettichutti.jpg'),
  ];

  List<Map<String, String>> customerReviews = [
    {
      'name': 'Suraj',
      'review': 'Wonderful Experience, Beautiful Designs',
      'image': 'assets/images/review1.jpg'
    },
    {
      'name': 'Arun',
      'review': 'Wonderful Experience, Beautiful Designs',
      'image': 'assets/images/review2.jpg'
    },
    {
      'name': 'Prasad',
      'review': 'Wonderful Experience, Beautiful Designs',
      'image': 'assets/images/review3.jpg'
    }
  ];

  List<Feature> features = [
    Feature(
        name: '1 Million+ Customers', iconUrl: 'assets/images/customers.png'),
    Feature(name: '15 Days Return', iconUrl: 'assets/images/return.png'),
    Feature(name: 'Free Shipping', iconUrl: 'assets/images/shipping.png'),
    Feature(name: 'Cash on Delivery', iconUrl: 'assets/images/cod.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: PhysicalModel(
              color: Colors.white,
              elevation: 6,
              shadowColor: Colors.grey.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: Image.asset(
                            'assets/images/logo.png',
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              child: Image.asset(
                                'assets/images/heart.png',
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              child: Image.asset(
                                'assets/images/cart.png',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                      height: 42,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(.3)),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: TextField(
                          cursorColor: Colors.black,
                          cursorRadius: const Radius.circular(20),
                          cursorHeight: 21,
                          cursorWidth: 1,
                          controller: searchController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 3),
                            labelText: null,
                            hintText: "Search Jewellery",
                            border: InputBorder.none,
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset(
                                'assets/images/search.png',
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
              child: SizedBox(
                height: 140,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 4,
                  ),
                  itemCount: jewelTypes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: const Color(0xffcf2228),
                          child: CircleAvatar(
                            radius: 48,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage:
                                  AssetImage(jewelTypes[index].jewelImageUrl),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          jewelTypes[index].jewelType,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 570, child: ImageCarousel()),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 247, 246, 246), Color(0xffeeefee)])),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(features.length, (index) {
                    return SizedBox(
                      width: 70,
                      child: Column(
                        children: [
                          Image.asset(
                            features[index].iconUrl,
                            height: 40,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            features[index].name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 12, fontFamily: 'Lato', height: 1.2),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: ShopByDesignCard(),
          ),
          const OnamOfferCard(),
          const SliverToBoxAdapter(
            child: ShopByDesignCard(
              shopByOccasion: true,
            ),
          ),
          const SliverToBoxAdapter(
            child: DiwaliCard(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 300, child: VideoPlayerScreen()),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 6.0),
                    child: Text(
                      'New Arrival',
                      style: TextStyle(
                          fontFamily: 'PlayFairDisplay',
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
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
                                      border: Border.all(
                                          color: const Color(0xffcf2228)),
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
                                  child: const Center(child: Text('Necklaces')),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: const Color(0xffcf2228)),
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
                                      border: Border.all(
                                          color: const Color(0xffcf2228)),
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
                                  child: const Center(child: Text('Earrings')),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 385, // Adjust based on your design
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              _buildJewelryList([
                                {
                                  'image': 'assets/images/necklace.jpg',
                                  'title': 'Short',
                                  'price': '9999'
                                },
                                {
                                  'image': 'assets/images/necklace.jpg',
                                  'title': 'Long',
                                  'price': '6999'
                                },
                                {
                                  'image': 'assets/images/necklace.jpg',
                                  'title': 'Chocker',
                                  'price': '7499'
                                },
                                {
                                  'image': 'assets/images/necklace.jpg',
                                  'title': 'Layered',
                                  'price': '8999'
                                },
                              ]),
                              _buildJewelryList([
                                {
                                  'image': 'assets/images/bangles.jpg',
                                  'title': 'Gold',
                                  'price': '3499'
                                },
                                {
                                  'image': 'assets/images/bangles.jpg',
                                  'title': 'Silver',
                                  'price': '3999'
                                },
                              ]),
                              _buildJewelryList([
                                {
                                  'image': 'assets/images/earring.jpg',
                                  'title': 'Stud',
                                  'price': '2499'
                                },
                                {
                                  'image': 'assets/images/earring.jpg',
                                  'title': 'Drop',
                                  'price': '2299'
                                },
                              ]),
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
          const OnamOfferCard(),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 150,
                      decoration: const BoxDecoration(
                        color: Color(0xfff9e6e7),
                      ),
                    ),
                    Container(
                      height: 150,
                    )
                  ],
                ),
                const Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      'Voice of Customers',
                      style: TextStyle(
                          fontFamily: 'PlayFairDisplay',
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )),
                Positioned(
                    top: 70,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: SizedBox(
                        height: 300,
                        width: MediaQuery.sizeOf(context).width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: customerReviews.map((item) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: Column(
                                children: [
                                  Container(
                                    width: 160,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xffd1cece)),
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20)),
                                        color: Colors.white),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              40, 20, 40, 10),
                                          child: CircleAvatar(
                                            radius: 40,
                                            backgroundImage: AssetImage(
                                              item['image']!,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          item['name']!,
                                          style: const TextStyle(
                                              fontFamily: 'PlayFairDisplay',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20)),
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Colors.white,
                                                    Color(0xffe6e6e6)
                                                  ])),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 12, 12, 12),
                                            child: Text(
                                              '" ${item['review']!} "',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 500, child: StoreLocatorWidget()),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 180,
              color: const Color(0xfffaf4f4),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(12, 24, 12, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shine',
                          style: TextStyle(
                              fontFamily: 'Lato',
                              height: 1,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffeab0b0)),
                        ),
                        Text(
                          'Bright',
                          style: TextStyle(
                              fontFamily: 'Lato',
                              height: 1,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffdf8282)),
                        ),
                        Text(
                          'Shine',
                          style: TextStyle(
                              fontFamily: 'Lato',
                              height: 1,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffd45455)),
                        ),
                        Text(
                          'Beautiful',
                          style: TextStyle(
                              fontFamily: 'Lato',
                              height: 1,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffc41011)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 110,
                          left: 180,
                          child: CircleAvatar(
                            radius: 70,
                            backgroundColor: Color(0xffefc9ca),
                          ),
                        ),
                        Positioned(
                            top: 50,
                            right: 50,
                            child: Image.asset(
                              'assets/images/footerlogo.png',
                              scale: 2.5,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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

class OnamOfferCard extends StatelessWidget {
  const OnamOfferCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 200,
              width: MediaQuery.sizeOf(context).width,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/onam_image.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              left: 10,
              child: Container(
                height: 180,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    backgroundBlendMode: BlendMode.srcOver,
                    color: const Color(0xff8b524a).withOpacity(0.7)),
                child: Column(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset(
                      "assets/svg/flower.svg",
                      height: 70,
                      color: const Color(0xffac8786),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Onam',
                          style: TextStyle(
                            fontFamily: 'PlayFairDisplay',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Offers',
                          style: TextStyle(
                            fontFamily: 'PlayFairDisplay',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        // const SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 4, 8, 4),
                          child: Row(
                            children: [
                              Text(
                                "Explore",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
