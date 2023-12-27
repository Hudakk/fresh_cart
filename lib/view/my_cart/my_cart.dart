import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My cart'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Dismissible(
                direction: DismissDirection.endToStart,
                background: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.error,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: theme.colorScheme.onError,
                      ),
                      Text(
                        'Move to delete',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onError,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                confirmDismiss: (direction) async {
                  return await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Confirm',
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                      content: Text(
                        'Are you sure you want to delete?',
                        style: theme.textTheme.titleSmall!.copyWith(
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );
                },
                key: const ValueKey('val'),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: Get.width,
                  height: Get.height * .15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              width: Get.width * .25,
                              height: Get.height * .13,
                              imageUrl:
                                  'https://images.squarespace-cdn.com/content/v1/5a3313f0edaed89444807a51/1543340000377-LAKFPKRRWLMUGH4QBH5I/D19-new-mexico-powder-chile-pepper-chili-main.jpg?format=500w',
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.black.withOpacity(0.2),
                                highlightColor: Colors.white54,
                                enabled: true,
                                child: Container(
                                  width: Get.width,
                                  height: Get.height * .14,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          const Gap(15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width * .4,
                                child: Text(
                                  'Red chili powder',
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '₹220',
                                style: theme.textTheme.labelLarge!.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹220'.toString(),
                            style: theme.textTheme.labelLarge!.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
