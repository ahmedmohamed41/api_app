import 'package:flutter/material.dart';

class CustomToppingCard extends StatelessWidget {
  const CustomToppingCard({
    super.key,
    required this.path,
    required this.title,
    required this.bgButton,
  });
  final String path, title;
  final Color bgButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: 90,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xff3C2F2F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            bottom: -65,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: bgButton,
                    radius: 10,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(path),
          ),
        ],
      ),
    );
  }
}
