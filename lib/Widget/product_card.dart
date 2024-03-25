import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String imageURL;
  final int price;
  final String offreTag;
  final String Description;
  final Function onTap;

  const ProductCard({
    Key? key,
    required this.title,
    required this.imageURL,
    required this.price,
    required this.offreTag,
    required this.onTap,
    required this.Description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          onTap: () {
            onTap();
          },
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
                    width: constraints.maxWidth, // Utilise la largeur maximale disponible
                    height: constraints.maxHeight * 0.5, // Utilise la moitié de la hauteur disponible
                    errorBuilder: (context, error, stackTrace) {
                      print(error.toString());
                      return Icon(Icons.error); // Afficher une icône d'erreur en cas d'échec du chargement de l'image
                    },
                  ),
                  const SizedBox(height: 9),
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    'Rs : $price',
                    style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      offreTag,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
