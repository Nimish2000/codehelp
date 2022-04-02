import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';

class exploreScreen extends StatefulWidget {
  const exploreScreen({Key? key}) : super(key: key);

  @override
  _exploreScreenState createState() => _exploreScreenState();
}

class _exploreScreenState extends State<exploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: getFooter(),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 120.0,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            list_items.length,
            (index) {
              return Container(
                height: list_items[index]['size'],
                width: list_items[index]['size'],
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5.0,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      //Refresh The page !!
                    },
                    icon: SvgPicture.asset(list_items[index]['icon']),
                    tooltip: 'refresh',
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
