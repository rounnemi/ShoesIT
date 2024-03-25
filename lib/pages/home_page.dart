import 'package:flutter/material.dart';
import '../Models/Product.dart';
import '../Widget/multi_select_frop_down.dart';
import './product_descritipn_page.dart';
import '../Widget/drop_down.dart';
import '../Widget/product_card.dart';
import '../Services/Products_Service.dart'; // Importez le service ProductService

class HomePage extends StatelessWidget {
  const HomePage({Key? key, String? token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Méthode pour récupérer les produits
    Future<List<Product>?> getProducts() async {
      return await ProductService.GetAllProduct();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Footware Store',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [

          SizedBox(
            height: height * 0.1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(width * 0.02),
                  child: Chip(
                    label: Text("category"),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Flexible(
                child: DropDownBtn(
                  items: ["Rs : Low to high", "Rs : High to low"],
                  selecteItemsText: 'Sort',
                  onSelected: (selected) {},
                ),
              ),
              Container(
                height: height * 0.05,
                width: width * 0.5,
                child: MultiSelectDropDown(
                  items: ['item 1', 'item 2', 'item 3', 'item 4'],
                  onSelectionChange: (selectedItems) {},
                ),
              )
            ],
          ),
          Expanded(
            child: FutureBuilder<List<Product>?>(
              future: getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error fetching products'),
                  );
                } else if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        title: snapshot.data![index].title,
                        imageURL: snapshot.data![index].image,
                        price: snapshot.data![index].price ,
                        offreTag: snapshot.data![index].offreTag,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDescription(
                                title: snapshot.data![index].title,
                                imageURL: snapshot.data![index].image,
                                price: snapshot.data![index].price,
                                description: snapshot.data![index].description,
                                offreTag: snapshot.data![index].offreTag,
                              ),
                            ),
                          );
                        },
                        Description: '',
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('No products available'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
