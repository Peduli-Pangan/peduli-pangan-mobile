import 'dart:convert';
import 'user_model.dart';
import 'product_model.dart';
import 'category_model.dart';
import 'payment_model.dart';
import 'order_model.dart';
import 'order_item_model.dart';

void main() {
  print('Testing User Model...');
  final user = UserModel(
    id: 1,
    createdAt: DateTime.now(),
    nama: 'John Doe',
    email: 'john@example.com',
    passwordHash: 'hashed_password',
    username: 'johndoe',
    role: 'user',
  );
  print(jsonEncode(user.toJson()));

  print('\nTesting Product Model...');
  final product = ProductModel(
    id: 1,
    createdAt: DateTime.now(),
    nama: 'Product A',
    slug: 'product-a',
    harga: 10000,
    stock: 50,
    condition: 'new',
    shortDesc: 'Short description',
    longDesc: 'Long description',
    rating: 4.5,
    isActive: true,
    merchantId: 1,
    categoryId: 1,
    tag: 'food',
  );
  print(jsonEncode(product.toJson()));

  print('\nTesting Category Model...');
  final category = CategoryModel(
    id: 1,
    createdAt: DateTime.now(),
    nama: 'Food',
    slug: 'food',
  );
  print(jsonEncode(category.toJson()));

  print('\nTesting Payment Model...');
  final payment = PaymentModel(
    id: 1,
    createdAt: DateTime.now(),
    paidAmount: 50000,
    method: 'credit_card',
    status: 'paid',
    providerRef: 'ref_123',
    orderId: 1,
  );
  print(jsonEncode(payment.toJson()));

  print('\nTesting Order Model...');
  final order = OrderModel(
    id: 1,
    createdAt: DateTime.now(),
    orderNumber: 'ORD-001',
    status: 'pending',
    subtotal: 45000,
    total: 50000,
    note: 'No onions',
    userId: 1,
    merchantId: 1,
    alamatId: 1,
  );
  print(jsonEncode(order.toJson()));

  print('\nTesting Order Item Model...');
  final orderItem = OrderItemModel(
    id: 1,
    createdAt: DateTime.now(),
    namaProduct: 'Product A',
    hargaProduct: 10000,
    jumlah: 2,
    subtotal: 20000,
    productId: 1,
  );
  print(jsonEncode(orderItem.toJson()));
}
