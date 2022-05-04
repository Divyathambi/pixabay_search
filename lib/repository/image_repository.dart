import 'package:http/http.dart' as http;
import 'package:pixabay_search/models/image_model.dart';

class ImageRepository {
  /// 1) Fetch the images
  ///   -> define the api key
  ///   -> define the function

  // get the client
  var client = http.Client();

  Future<ImageModel> fetchImageResults(String searchText) async {
    String apiKey = "27128945-62c960aa16a9242c386dc133b";
    var url =
        "https://pixabay.com/api/?key=$apiKey&q=$searchText&image_type=photo";

    var response = await client.get(Uri.parse(url));

    var jsonData = response.body;
    return ImageModel.fromJson(jsonData);
  }
}
