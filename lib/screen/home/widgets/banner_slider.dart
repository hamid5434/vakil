import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vakil_0098/models/home/baner.dart';
import 'package:vakil_0098/screen/widgets/image/image_loading_service.dart';

class BannerSlider extends StatelessWidget {
  final List<BannerEntity> banners;
  final controller = PageController(viewportFraction: 1, keepPage: false);

  BannerSlider({Key? key, required this.banners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: banners.length,
            controller: controller,
            itemBuilder: (context, index) {
              return _Slide(
                banner: banners[index],
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 8,
            child: Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: banners.length,
                axisDirection: Axis.horizontal,
                effect: WormEffect(
                    spacing: 4,
                    radius: 4.0,
                    dotWidth: 18,
                    dotHeight: 4,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey.withOpacity(.5),
                    activeDotColor: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final BannerEntity banner;

  const _Slide({Key? key, required this.banner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ImageLoadingService(
        url: 'https://webapp.okcs.com/slider/${banner.imagePath!}',
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
