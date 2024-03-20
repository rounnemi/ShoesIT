import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imageURL;
  final double price;
  final String  offreTag;
  final Function onTap ;
  const ProductCard({super.key, required this.name, required this.imageURL, required this.price, required this.offreTag, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      } ,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageURL,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: 142,
                errorBuilder: (context, error, stackTrace) {
                  print(error.toString());
                  return Icon(Icons.error); // Afficher une icône d'erreur en cas d'échec du chargement de l'image
                },
              ),

              const SizedBox(height: 9,),
              Text((name)  ,
                style: TextStyle
                  (fontSize: 16,
                    overflow: TextOverflow.ellipsis),),
              SizedBox(height: 9,),
              Text(('Rs : $price')  ,
                style: TextStyle
                  (fontSize: 16,
                    overflow: TextOverflow.ellipsis),),
              const SizedBox(height: 4,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                   decoration:  BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),),
                child: Text(
                  offreTag,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12
                ),),
              )
            ],
          ),
        ),
      ),
    );

  }
}
