import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixabay_search/controllers/image_controllers.dart';
import 'package:pixabay_search/screens/image_page.dart';
import 'package:pixabay_search/screens/widgets/image_card.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final imageController = Get.put(ImageController());

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            "Pixabay Search",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 30.0),
                child: TextFormField(
                  controller: _textController,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: Colors.red, style: BorderStyle.solid),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: Colors.black, style: BorderStyle.solid),
                      ),
                      hintText: "Search for images",
                      prefixIcon: const Icon(Icons.search),
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIconColor: Colors.black),
                ),
              ),
              TextButton(
                  onPressed: () {
                    imageController.fetchImages(_textController.text);
                  },
                  child: const Text("GO!")),
              Flexible(fit: FlexFit.loose, child: _searchImages(context)),
            ],
          ),
        ));
  }

  Widget _searchImages(BuildContext context) {
    return GetX<ImageController>(builder: (controller) {
      var images = controller.resultImages.value.hits;

      if (images != null) {
        if (images.isEmpty) {
          return const Center(child: Text("No Images"));
        } else {
          return GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(ImagePage(
                        height: images[index].imageHeight!,
                        width: images[index].imageWidth!,
                        imageUrl: images[index].largeImageUrl!));
                  },
                  child: ImageCard(
                      height: images[index].previewHeight!,
                      width: images[index].previewWidth!,
                      imageStr: images[index].previewUrl!),
                );
              });
        }
      } else {
        return const Center(child: Text("Search for images"));
      }
    });
  }
}
