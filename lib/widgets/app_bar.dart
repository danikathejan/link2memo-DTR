import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplicationBar extends StatefulWidget implements PreferredSizeWidget {
  final String topic;

  const ApplicationBar({super.key, required this.topic});

  @override
  State<ApplicationBar> createState() => _ApplicationBarState();

  @override
  Size get preferredSize => const Size.fromHeight(180.0);
}

class _ApplicationBarState extends State<ApplicationBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      flexibleSpace: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/appbar.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 75.0),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0), // Adjust the top padding as needed
                  child: Text(
                    widget.topic,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 33.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: const Color(0xff1D1617).withOpacity(0.11),
                      blurRadius: 40,
                      spreadRadius: 0.0,
                    )
                  ]),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 253, 251, 251),
                      hintText: 'Search here...',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 105, 105, 105),
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.all(15),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: SvgPicture.asset('assets/icons/magnifier.svg'),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      leading: GestureDetector(
        onTap: () {
          // Handle back button tap
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/ArrowBack.svg',
            height: 20.62,
            width: 12.16,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
              right: 15), // Adjust this value to move buttons to the right
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  // Handle bell icon tap
                },
                child: Container(
                  margin: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  width: 37,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/bell.svg',
                    height: 25,
                    width: 5,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle settings icon tap
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 0), // Maintain the reduced horizontal margin
                  alignment: Alignment.center,
                  width: 37,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/settings.svg',
                    height: 25,
                    width: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
