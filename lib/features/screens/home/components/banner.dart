import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:user_auth_app/core/constants/app_colors.dart';
import 'package:user_auth_app/core/constants/app_images.dart';

class BannerSlider
    extends
        StatefulWidget {
  @override
  BannerSliderState createState() => BannerSliderState();
}

class BannerSliderState
    extends
        State<
          BannerSlider
        > {
  final PageController _controller = PageController();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      height: 260,
      width: double.maxFinite,
      color: AppColors.greyshade,
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          
          SizedBox(
            height: 200, 
            child: PageView(
              physics: BouncingScrollPhysics(),
              controller: _controller,
              children: [
                buildBanner(
                  text: "Get your special sale up to 40%",
                  buttonText: "Shop Now",
                  imagePath: AppImages.iphone13,
                ),
                buildBanner(
                  text: "New arrivals are here",
                  buttonText: "Explore",
                  imagePath: AppImages.iphone13,
                ),
                buildBanner(
                  text: "Exclusive deals for you",
                  buttonText: "Buy Now",
                  imagePath: AppImages.iphone13,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 10,
          ),

          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 12,
              activeDotColor: Colors.black,
              dotColor: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBanner({
    required String text,
    required String buttonText,
    required String imagePath,
  }) {
    return Container(
      height: 10, 
      margin: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 190,
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                height: 12,
              ),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    120,
                    40,
                  ),
                  backgroundColor: AppColors.yellow,
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          
          SizedBox(
            height: 140,
            width: 130,
            child: Image.asset(
              imagePath,
              
            ),
          ),
        ],
      ),
    );
  }
}
