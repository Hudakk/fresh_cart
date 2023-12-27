import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fresh_cart/res/components/category_list.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fresh Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryList(
                    text: 'Produce',
                    onpress: () {},
                  ),
                  CategoryList(
                    text: 'Dairy',
                    onpress: () {},
                  ),
                  CategoryList(
                    text: 'Bakery',
                    onpress: () {},
                  ),
                  CategoryList(
                    text: 'Pantry',
                    onpress: () {},
                  ),
                  CategoryList(
                    text: 'Beverages',
                    onpress: () {},
                  ),
                  CategoryList(
                    text: 'Snacks',
                    onpress: () {},
                  ),
                  CategoryList(
                    text: 'Personal Care',
                    onpress: () {},
                  ),
                  CategoryList(
                    text: 'Household',
                    onpress: () {},
                  ),
                ],
              ),
            ),
            const Gap(24),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: .63,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        width: Get.width * .55,
                        height: Get.height * .6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Positioned(
                        top: 55,
                        right: 8,
                        child: Center(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: Get.width * .4,
                              height: Get.height * .22,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  colors: [
                                    theme.colorScheme.primary.withOpacity(.15),
                                    theme.colorScheme.primary.withOpacity(.1),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Atta (Wheat flour)',
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Gap(5),
                                  Text(
                                    '₹50',
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: theme.colorScheme.primary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: CachedNetworkImage(
                            width: Get.width * .3,
                            height: Get.height * .13,
                            imageUrl:
                                'https://5.imimg.com/data5/KC/UD/MY-6339954/wheat-flour-chakki-atta-500x500.jpg',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.black.withOpacity(0.2),
                              highlightColor: Colors.white54,
                              enabled: true,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
