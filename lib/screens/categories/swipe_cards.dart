import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';

class SwipeCategoriesCards extends StatefulWidget {
  const SwipeCategoriesCards({Key? key}) : super(key: key);

  @override
  State<SwipeCategoriesCards> createState() => _SwipeCategoriesCardsState();
}

class _SwipeCategoriesCardsState extends State<SwipeCategoriesCards> {

  List<String> images = [
    "assets/images/women_with_bag.png",
    "assets/images/person_with_watch.png",
    "assets/images/man_wearing_shoe.png",
  ];

  List<String> imageTexts = [
    "Bags Collection",
    "Watches Collection",
    "Shoes Collection",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SwipeDeck(
        startIndex: 0,
        emptyIndicator: Container(
          child: Center(
            child: Text("Nothing Here"),
          ),
        ),
        cardSpreadInDegrees: 10, // Change the Spread of Background Cards
        onSwipeLeft: (){
          print("USER SWIPED LEFT -> GOING TO NEXT WIDGET");
        },
        onSwipeRight: (){
          print("USER SWIPED RIGHT -> GOING TO PREVIOUS WIDGET");
        },
        onChange: (index){
          print(images[index]);
        },
        widgets: images.asMap().entries.map((entry) {
          final int index = entry.key;
          final String imagePath = entry.value;
          final String text = imageTexts[index];

          return GestureDetector(
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/bags');
                  break;
                case 1:
                  Navigator.pushNamed(context, '/watches');
                  break;
                case 2:
                  Navigator.pushNamed(context, '/shoes');
                  break;
                default:
                  break;
              }
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  Colors.black.withOpacity(0.2),
                    ),
                    //color: Colors.black.withOpacity(0.2),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),

      ),
    );
  }
}
