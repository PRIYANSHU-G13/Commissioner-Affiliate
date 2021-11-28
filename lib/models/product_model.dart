import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final String name;
  final String category;
  final String imageUrl;
  final String description;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.isPopular,
    required this.isRecommended,
    required this.price,
});
  static Product fromSnapshot(DocumentSnapshot snap){
    Product product = Product(
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        description: snap['description'],
        isPopular: snap['isPopular'],
        isRecommended: snap['isRecommended'],
        price: snap['price']);
    return product;
  }


  @override
  List<Object?> get props => [name,
    category,
    imageUrl,
    description,
    isRecommended,
    isPopular,
    price];

  static List <Product> products = [
    Product(
        name: 'Arm Chair',
        category: 'Chairs',
        imageUrl: 'https://www.royaloakindia.com/uploads/ROYIND-royaloak-star-visitor-chair-800x50048.webp',
        description: 'idk',
        isRecommended: true,
        isPopular: true,
        price: 23.20
    ),
    Product(
        name: 'Office Tables',
        category: 'Tables',
        imageUrl: 'https://images.squarespace-cdn.com/content/v1/518e09bfe4b07b7f3ea24e5b/1563987131831-3HNWU228PQH1BQF9DV5K/Telemeet+Tangarine_WG_6ft.jpg?format=500w',
        description: 'idk',
        isRecommended: true,
        isPopular: true,
        price: 23.20
    ),
    Product(
        name: 'Office Tables',
        category: 'Tables',
        imageUrl: 'https://images.squarespace-cdn.com/content/v1/518e09bfe4b07b7f3ea24e5b/1563987131831-3HNWU228PQH1BQF9DV5K/Telemeet+Tangarine_WG_6ft.jpg?format=500w',
        description: 'idk',
        isRecommended: true,
        isPopular: true,
        price: 23.20
    ),
    Product(
        name: '2 Seater Sofa',
        category: 'Sofas',
        imageUrl: 'https://ii1.pepperfry.com/media/catalog/product/e/s/568x284/esteban-2-seater-half-leather-sofa-in-grey-colour-by-casacraft-esteban-2-seater-half-leather-sofa-in-hcgoea.jpg',
        description: 'idk',
        isRecommended: true,
        isPopular: true,
        price: 23.20
    ),
    Product(
        name: 'Metal Bunk Bed',
        category: 'Bunk Beds',
        imageUrl: 'https://ii1.pepperfry.com/media/catalog/product/t/r/236x260/triple-metal-bunk-bed-by-furnline-triple-metal-bunk-bed-by-furnline-setnbs.jpg',
        description: 'idk',
        isRecommended: true,
        isPopular: true,
        price: 23.20
    ),
  ];
}