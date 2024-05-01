class FlashSaleModel {
  final double discount;
  final double amount;
  final String title;
  final String image ;
  final double oldPrice;
  final double newPrice;
  bool addToCart ;
  FlashSaleModel(
      {
        required this.discount,
        required this.amount,
        required this.title,
        required this.image,
        required this.oldPrice,
        required this.newPrice,
        this.addToCart = false
      }
      );
}


List<FlashSaleModel>  flashSale  = [
  FlashSaleModel(discount: 20, image: 'assets/perfume.png', oldPrice: 200, amount: 200, title: 'Moist-1 Milky Cleanser', newPrice: 160),
  FlashSaleModel(discount: 20, image: 'assets/cleanser.png', oldPrice: 295, amount: 200, title: 'Argento Clear Facial Cleanser', newPrice: 260),
  FlashSaleModel(discount: 20, image: 'assets/perfume.png', oldPrice: 100, amount: 200, title: 'third', newPrice: 80),
  FlashSaleModel(discount: 20, image: 'assets/cleanser.png', oldPrice: 100, amount: 200, title: 'fourth', newPrice: 80),
  FlashSaleModel(discount: 20, image: 'assets/cleanser.png', oldPrice: 100, amount: 200, title: 'fifth', newPrice: 80),

] ;