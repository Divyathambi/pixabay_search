import 'package:get/get.dart';
import 'package:pixabay_search/models/image_model.dart';
import 'package:pixabay_search/repository/image_repository.dart';

class ImageController extends GetxController {
  final ImageRepository _repository = ImageRepository();

  var resultImages = ImageModel().obs;

  void fetchImages(String searchText) async {
    var images = await _repository.fetchImageResults(searchText);

    resultImages.value = images;
  }
}
