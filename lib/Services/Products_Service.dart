import 'dart:convert';

import 'package:e_commerce_api/Models/Product.dart';
import 'package:http/http.dart' as http;
import '../Global/ApiConstants.dart';

class ProductService
{
  static Future<List<Product>?> GetAllProduct() async {
    var url = Uri.parse(ApiConstants.baseUrl+ApiConstants.getAllProducts);
    print(url);
    try {
      print('fffffffffffffff');

      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonRsponse = json.decode(response.body);
        List<Product> products = jsonRsponse.map((json) => Product.fromJson(json)).toList();
        print(products[0].title);
        return products ;

      }
        }
     catch(e)
      {
      print(e);
      }
    return null;
  }


}