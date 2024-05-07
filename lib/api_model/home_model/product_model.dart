class ProductModel {
  final double discount;
  final double amount;
  final String title;
  final String description;
  final String image ;
  final double price;
  bool addToCart ;
  ProductModel(
      {
        required this.discount,
        required this.amount,
        required this.title,
        required this.description,
        required this.image,
        required this.price,
        this.addToCart = false
      }
      );
}


List<ProductModel>  products  = [
  ProductModel(discount: 20, image: 'assets/creem.png', price: 200, amount: 200, title: 'Moist-1 Milky Cleanser', description: 'good product'),
  ProductModel(discount: 20, image: 'assets/perfume.png', price: 200, amount: 200, title: 'Moist-1 laroshe Cleanser', description: 'good product'),
  ProductModel(discount: 20, image: 'assets/cleanser.png', price: 200, amount: 200, title: 'Moist-1 Milky Cleanser', description: 'good product'),
  ProductModel(discount: 20, image: 'assets/creem.png', price: 200, amount: 200, title: 'Moist-1 Milky Cleanser', description: 'good product'),
] ;