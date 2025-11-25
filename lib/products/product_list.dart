class Product {
  final String name;
  final String imageUrl;
  final double price;
  bool isFavorite;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });
  @override
  String toString() {
    // TODO: implement toString
    return "$name, $imageUrl";
  }
}

class ProductCategory {
  final String name;
  final List<Product> products;

  ProductCategory({required this.name, required this.products});
}


List<ProductCategory> categories=[
  ProductCategory(
    name: 'Dresses', 
    products: [
      Product(name: 'T shirt For Men', imageUrl: 'https://www.indianterrain.com/cdn/shop/files/ITMTS01966SS-Black_01_9311cfd4-1e65-4c18-ab4b-5133a2813c6c.jpg?v=1729094189', price: 899),
      Product(name: 'Adidas T Shirt for Men', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6mJ9aZ42jE1PLazphdFPZ08rTJNcOfciz5g&s', price: 499),
      Product(name: 'Jeans for Women', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgL_8jQ_QUsGTZ__9eejvn5iG75mNHmQh-PA&s', price: 699),
      Product(name: 'Womens Rayon Printed Kurta', imageUrl: 'https://m.media-amazon.com/images/I/715lo5QZFjL._SX679_.jpg', price: 860),
      Product(name: 'Women pajama set', imageUrl: 'https://m.media-amazon.com/images/I/715lo5QZFjL._SX679_.jpg', price: 675),
      
    ]),
    ProductCategory(name: 'Watches', 
    products: [
      Product(name: 'Casio G Shock', imageUrl: 'https://www.kamalwatch.com/cdn/shop/products/G660.webp?v=1685422776', price: 1499),
      Product(name: 'Carlington Watch', imageUrl: 'https://m.media-amazon.com/images/I/61dywKQasaL._SX679_.jpg', price: 1399),
      Product(name: 'TISSOT PR 516 Watch', imageUrl: 'https://m.media-amazon.com/images/I/61EZ1SF49zL._SY741_.jpg', price: 60990),
      Product(name: 'Titan Grandmaster 2 Analog Watch', imageUrl: 'https://m.media-amazon.com/images/I/71RjC0l5uAL._SX522_.jpg', price: 11980),


    ]),
    ProductCategory(name: 'Shoes', 
    products: [
      Product(name: 'Nike Shoe', imageUrl: 'https://www.saucony.com/on/demandware.static/-/Sites-saucony_us-Library/default/dw27d78285/content/seasonal-content/homepage/2025/10/01/images/hero-winter_sunrise-d.jpg', price: 2499),
      Product(name: 'Asian men wonder-13 sports running  shoes', imageUrl: 'https://m.media-amazon.com/images/I/61utX8kBDlL._SY625_.jpg', price: 699),
      Product(name: 'adidas Unisex-Adult Ultraboost 5 Running Shoes', imageUrl: 'https://m.media-amazon.com/images/I/71LJoo5iASL._SY625_.jpg', price: 17999),

    ]),
    ProductCategory(name: 'Caps', products: [
      Product(name: 'New york Yankees Caps', imageUrl: 'https://neweracap.in/cdn/shop/files/60691075_1.jpg?v=1752837073&width=1920', price: 499),
      Product(name: 'Puma Mens Baseball Cap', imageUrl: 'https://m.media-amazon.com/images/I/615UNvcNYyL._SX679_.jpg', price: 359),
      Product(name: 'JACK & JONES Mens Cotton Baseball Cap with Adjustable Back Closure', imageUrl: 'https://m.media-amazon.com/images/I/71e8aBdqqGL._SY741_.jpg', price: 680),

    ]),
    ProductCategory(name: 'Tablets', products: [
      Product(name: 'Apple ipad Pro 12inch 512GB ', imageUrl: 'https://cdn.mos.cms.futurecdn.net/saTFaq7GViF24aGaeSGhSn-650-80.jpg.webp', price: 254499),
      Product(name: 'XIAOMI Pad 7 Nano Texture Display', imageUrl: 'https://m.media-amazon.com/images/I/41-aytYj5kL._SY300_SX300_QL70_FMwebp_.jpg', price: 30999),
      Product(name: 'Samsung Galaxy Tab S9 FE+ ', imageUrl: 'https://m.media-amazon.com/images/I/61l5a94VKkL._SX679_.jpg', price: 33790),
    ]),
    ProductCategory(name: 'Mobiles', products: [
       Product(name: 'I phone 17 Pro 256GB', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdiO49sY9kh6lKMVlBtVWCCdCk03DloMakQQ&s', price: 149990),
        Product(name: 'Samsung Galaxy S25 Ultra 5G', imageUrl: 'https://m.media-amazon.com/images/I/71uVT3428uL._SL1500_.jpg', price: 149999),
         Product(name: 'OnePlus 15 ', imageUrl: 'https://m.media-amazon.com/images/I/616kkUbRg4L._SX679_.jpg', price: 79999),
    ])

];
