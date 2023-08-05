import 'package:flutter/material.dart';
import 'package:food_app/util/bigText.dart';
import 'package:food_app/util/colors.dart';
import 'package:food_app/util/dimensions.dart';
import 'package:food_app/util/foodCard.dart';
import 'package:food_app/util/signinButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class FoodGrid extends StatefulWidget {
  final foodImage;
  final foodName;
  final foodPrice;
  final gridLenght;

  FoodGrid({
    super.key,
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
    required this.gridLenght,
  });

  @override
  State<FoodGrid> createState() => _FoodGridState();
}

class _FoodGridState extends State<FoodGrid> {
  int items = 1;

  void addItem() {
    setState(() {
      if (items <= 20) {
        items++;
      }
    });
  }

  void removeItem() {
    setState(() {
      if (items > 0) {
        items--;
      }
    });
  }

  void BottomSheetCart(var image, var description, var price, int index) {
    showModalBottomSheet(
      elevation: 0,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            dimensions.size24,
          ),
        ),
      ),
      context: context,
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              dimensions.size24,
            ),
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.65,
            maxChildSize: 0.85,
            minChildSize: 0.4,
            builder: (context, scrollController) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      height: dimensions.screenHeight,
                      width: dimensions.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          dimensions.size13,
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: dimensions.width20,
                          vertical: dimensions.height10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: dimensions.height15 * 2,
                            ),
                            Container(
                              width: dimensions.screenWidth,
                              height: dimensions.height100 * 2,
                              decoration: BoxDecoration(
                                color: colors.ImageBackgroundColor1,
                                borderRadius:
                                    BorderRadius.circular(dimensions.size13),
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    image[index],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: dimensions.height15 * 1.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                bigText(
                                  text: description[index],
                                ),
                                LikeButton(size: dimensions.size20 * 2),
                              ],
                            ),
                            SizedBox(height: dimensions.height15 * 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: dimensions.width10,
                                    vertical: dimensions.height5,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        dimensions.size13),
                                    color: Colors.grey.shade100,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: removeItem,
                                        child: CircleAvatar(
                                            radius: dimensions.size15,
                                            backgroundColor:
                                                Colors.grey.shade300,
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.grey,
                                            )),
                                      ),
                                      SizedBox(width: dimensions.width13),
                                      bigText(text: items.toString()),
                                      SizedBox(width: dimensions.width13),
                                      GestureDetector(
                                        onTap: addItem,
                                        child: CircleAvatar(
                                          radius: dimensions.size15,
                                          backgroundColor: colors.PrimaryColor,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: dimensions.width20),
                                Text(
                                  price[index],
                                  style: GoogleFonts.tajawal(
                                    color: colors.PrimaryColor,
                                    fontSize: dimensions.size24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: dimensions.height20),
                            Divider(
                              color: colors.SmallText,
                              height: dimensions.height13 * 2,
                            ),
                            SizedBox(
                              height: dimensions.height20,
                            ),
                            SizedBox(height: dimensions.height15),
                            signinButton(
                                backgroundColor: colors.PrimaryColor,
                                textColor: Colors.white,
                                text: "Add To Cart")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: dimensions.height10),
                          Container(
                            height: dimensions.height10,
                            width: dimensions.width10 * 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                dimensions.size10,
                              ),
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.gridLenght.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            return BottomSheetCart(
                widget.foodImage, widget.foodName, widget.foodPrice, index);
          },
          child: foodCard(
            foodImage: widget.foodImage[index],
            foodName: widget.foodName[index],
            foodPrice: widget.foodPrice[index],
          ),
        );
      },
    );
  }
}
