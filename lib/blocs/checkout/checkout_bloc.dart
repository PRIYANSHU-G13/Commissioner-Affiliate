import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commissioner_affiliate_1/blocs/cart/cart_bloc.dart';
import 'package:commissioner_affiliate_1/models/models.dart';
import 'package:commissioner_affiliate_1/repositories/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  })  : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(
        cartBloc.state is CartLoaded
            ? CheckoutLoaded(
          products: (cartBloc.state as CartLoaded).cart.products,
          deliveryFee:
          (cartBloc.state as CartLoaded).cart.deliveryfeestring,
          subtotal: (cartBloc.state as CartLoaded).cart.subtotalstring,
          total: (cartBloc.state as CartLoaded).cart.totalstring,
        )
            : CheckoutLoading(),
      ) {
    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded)
        add(
          UpdateCheckout(cart: state.cart),
        );
    });
  }

  @override
  Stream<CheckoutState> mapEventToState(
      CheckoutEvent event,
      ) async* {
    if (event is UpdateCheckout) {
      yield* _mapUpdateCheckoutToState(event, state);
    }
    if (event is ConfirmCheckout) {
      yield* _mapConfirmCheckoutToState(event, state);
    }
  }

  Stream<CheckoutState> _mapUpdateCheckoutToState(
      UpdateCheckout event,
      CheckoutState state,
      ) async* {
    if (state is CheckoutLoaded) {
      yield CheckoutLoaded(
        email: event.email ?? state.email,
        fullName: event.fullName ?? state.fullName,
        products: event.cart?.products ?? state.products,
        deliveryFee: event.cart?.deliveryfeestring ?? state.deliveryFee,
        subtotal: event.cart?.subtotalstring ?? state.subtotal,
        total: event.cart?.totalstring ?? state.total,
        address: event.address ?? state.address,
        city: event.city ?? state.city,
        country: event.country ?? state.country,
        zipCode: event.zipCode ?? state.zipCode,
      );
    }
  }

  Stream<CheckoutState> _mapConfirmCheckoutToState(
      ConfirmCheckout event,
      CheckoutState state,
      ) async* {
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        print('Done');
        yield CheckoutLoading();
      } catch (_) {}
    }
  }
}