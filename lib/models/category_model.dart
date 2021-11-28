import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl
  });


  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List <Category> categories = [
    Category(
        name: 'Chairs',
        imageUrl: 'https://images.unsplash.com/photo-1581541234269-03d5d8576c0e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=546&q=80'
    ),
    Category(
        name: 'Beds',
        imageUrl: 'https://images.unsplash.com/photo-1576354302919-96748cb8299e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=329&q=80'
    ),
    Category(
        name: 'Tables',
        imageUrl: 'https://images.unsplash.com/photo-1569968057996-21976271e336?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80'
    ),
    Category(
        name: 'Bunk Beds',
        imageUrl: 'https://images.pexels.com/photos/7018834/pexels-photo-7018834.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    ),
    Category(
        name: 'Cupboards and Drawers',
        imageUrl: 'https://images.unsplash.com/photo-1617198191145-8300562bb672?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80'
    ),
    Category(
        name: 'Sofas',
        imageUrl: 'https://images.unsplash.com/photo-1616627434852-097e535878d5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHNvZmF8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
    ),
  ];
}