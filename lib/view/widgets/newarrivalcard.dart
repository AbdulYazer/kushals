import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewArrivalCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final int price;

  const NewArrivalCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price});
  @override
  State<NewArrivalCard> createState() => _NewArrivalCardState();
}

class _NewArrivalCardState extends State<NewArrivalCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 250,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: -5,
                  top: 15,
                  child: ClipPath(
                    clipper: TrapeziumClipper(),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Container(
                        color: Colors.green,
                        width: 30,
                        height: 140,
                        alignment: Alignment.center,
                        child: const RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            'New Arrival',
                            style: TextStyle(
                              height: 1,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: SvgPicture.asset(
                            "assets/svg/compare.svg",
                            height: 30,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 16),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: SvgPicture.asset(
                            "assets/svg/heart.svg",
                            height: 30,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.name,
            style: const TextStyle(
              fontFamily: 'PlayFairDisplay',
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₹${widget.price}',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(
                width: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text('₹${widget.price - 1000}',
                    style: const TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey)),
              ),
            ],
          ),
          const ColorWidget()
        ],
      ),
    );
  }
}

class ColorWidget extends StatefulWidget {
  const ColorWidget({super.key});

  @override
  State<ColorWidget> createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {
  bool isPopupVisible = false;

  final List<Color> _allColors = [
    Colors.purple,
    Colors.red,
    Colors.green,
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPopupVisible = !isPopupVisible;
        });
      },
      child: Container(
        width: 200,
        color: const Color.fromARGB(255, 248, 246, 246),
        child: Row(
          children: [
            if (!isPopupVisible)
              Padding(
                padding: const EdgeInsets.only(top: 7, bottom: 7,left: 5),
                child: Row(
                  children: [
                    _buildColorCircle(Colors.purple),
                    _buildColorCircle(Colors.red),
                    _buildColorCircle(Colors.green),
                    _buildColorCircle(Colors.black),
                    const Text('+3'),
                    const SizedBox(
                      width: 60,
                    ),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      size: 15,
                    ),
                  ],
                ),
              ),
            if (isPopupVisible) _buildColorPopup(),
          ],
        ),
      ),
    );
  }

  Widget _buildColorCircle(Color color) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      margin: const EdgeInsets.only(right: 5),
    );
  }

  Widget _buildColorPopup() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 248, 246, 246),
      ),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: _allColors.length,
          itemBuilder: (context, index) {
            return _buildColorItem(_allColors[index]);
          },
        ),
      ),
    );
  }

  Widget _buildColorItem(Color color) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      margin: const EdgeInsets.only(right: 5),
    );
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width - 10, 30);
    path.lineTo(size.width - 10, size.height - 30);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
