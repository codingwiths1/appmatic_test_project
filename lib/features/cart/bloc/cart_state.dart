class CartState {
  final List cartList;
  final double totals;
  final List<dynamic> addToCart;

  CartState({
    required this.cartList,
    required this.totals,
    required this.addToCart,
  });

  CartState copyWith({List? cartList, double? totals, List? addToCart}) {
    return CartState(
      cartList: cartList ?? this.cartList,
      totals: totals ?? this.totals,
      addToCart: addToCart ?? this.addToCart,
    );
  }
}
