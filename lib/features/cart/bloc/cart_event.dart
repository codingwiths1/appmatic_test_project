abstract class CartEvent {}

class RemoveFromCart extends CartEvent {
  final int index;
  RemoveFromCart(this.index);
}

class UpdateCartList extends CartEvent {
  final List updatedList;
  UpdateCartList(this.updatedList);
}

class AddToCart extends CartEvent {
  final Map<dynamic, dynamic> product;
  AddToCart(this.product);
}
