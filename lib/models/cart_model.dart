import 'package:commissioner_affiliate_1/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable{
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  Map productQuantity(products){
    var quantity = Map();

    products.forEach((products){
      if (!quantity.containsKey(products)){
        quantity[products] = 1;
      }
      else{
        quantity[products] +=1;
      }
    });
    return quantity;
  }
  double get subtotal => products.fold(0, (total, current) => total+current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 100){
      return 0.0;
    }else
      return 30.0;
  }
  double total(subtotal,deliveryFee){
    return subtotal + deliveryFee(subtotal);
  }

  String Freedelivery(subtotal) {
    if (subtotal >= 100){
      return 'you have free delivery';
    }else{
      double missing = 100.0 - subtotal;
      return 'Add Rs.${missing.toStringAsFixed(2)} for free delivery';
    }
  }

  String get subtotalstring => subtotal.toStringAsFixed(2);
  String get totalstring => total(subtotal,deliveryFee).toStringAsFixed(2);
  String get deliveryfeestring => deliveryFee(subtotal).toStringAsFixed(2);
  String get freedeliverytring => Freedelivery(subtotal);




  @override
  List<Object?> get props => [products];}