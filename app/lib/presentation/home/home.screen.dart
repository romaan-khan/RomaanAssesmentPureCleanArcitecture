import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../utils/utils.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Romaan Assesment'),
        actions: <Widget>[
          IconButton(
              onPressed: () => controller.getProducts(),
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(() => controller.isLoading.value
                ? const LinearProgressIndicator()
                : const SizedBox()),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [getDeepBoxShadow()],
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                        controller.productList[index].image.toString()),
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
