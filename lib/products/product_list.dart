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
      Product(name: 'T shirt For Men', imageUrl: 'https://www.indianterrain.com/cdn/shop/files/ITMTS01966SS-Black_01_9311cfd4-1e65-4c18-ab4b-5133a2813c6c.jpg?v=1729094189', price: 899),
      Product(name: 'T shirt For Men', imageUrl: 'https://www.indianterrain.com/cdn/shop/files/ITMTS01966SS-Black_01_9311cfd4-1e65-4c18-ab4b-5133a2813c6c.jpg?v=1729094189', price: 899),
      Product(name: 'T shirt For Men', imageUrl: 'https://www.indianterrain.com/cdn/shop/files/ITMTS01966SS-Black_01_9311cfd4-1e65-4c18-ab4b-5133a2813c6c.jpg?v=1729094189', price: 899),
      Product(name: 'T shirt For Men', imageUrl: 'https://www.indianterrain.com/cdn/shop/files/ITMTS01966SS-Black_01_9311cfd4-1e65-4c18-ab4b-5133a2813c6c.jpg?v=1729094189', price: 899),
      
    ]),
    ProductCategory(name: 'Watches', 
    products: [
      Product(name: 'Casio G Shock', imageUrl: 'https://www.kamalwatch.com/cdn/shop/products/G660.webp?v=1685422776', price: 1499),
      Product(name: 'T shirt For Men', imageUrl: 'https://www.indianterrain.com/cdn/shop/files/ITMTS01966SS-Black_01_9311cfd4-1e65-4c18-ab4b-5133a2813c6c.jpg?v=1729094189', price: 899),
      Product(name: 'T shirt For Men', imageUrl: 'https://www.indianterrain.com/cdn/shop/files/ITMTS01966SS-Black_01_9311cfd4-1e65-4c18-ab4b-5133a2813c6c.jpg?v=1729094189', price: 899),


    ]),
    ProductCategory(name: 'Shoes', 
    products: [
      Product(name: 'Nike Shoe', imageUrl: 'https://www.saucony.com/on/demandware.static/-/Sites-saucony_us-Library/default/dw27d78285/content/seasonal-content/homepage/2025/10/01/images/hero-winter_sunrise-d.jpg', price: 2499),
      Product(name: 'Casio G Shock', imageUrl: 'https://www.kamalwatch.com/cdn/shop/products/G660.webp?v=1685422776', price: 1499),
      Product(name: 'Casio G Shock', imageUrl: 'https://www.kamalwatch.com/cdn/shop/products/G660.webp?v=1685422776', price: 1499),

    ]),
    ProductCategory(name: 'Caps', products: [
      Product(name: 'New york Yankees Caps', imageUrl: 'https://neweracap.in/cdn/shop/files/60691075_1.jpg?v=1752837073&width=1920', price: 499),
      Product(name: 'Casio G Shock', imageUrl: 'https://www.kamalwatch.com/cdn/shop/products/G660.webp?v=1685422776', price: 1499),
      Product(name: 'Casio G Shock', imageUrl: 'https://www.kamalwatch.com/cdn/shop/products/G660.webp?v=1685422776', price: 1499),

    ]),
    ProductCategory(name: 'Tablets', products: [
      Product(name: 'Apple ipad Pro 12inch 512GB ', imageUrl: 'https://cdn.mos.cms.futurecdn.net/saTFaq7GViF24aGaeSGhSn-650-80.jpg.webp', price: 254499),
      Product(name: 'Casio G Shock', imageUrl: 'https://www.kamalwatch.com/cdn/shop/products/G660.webp?v=1685422776', price: 1499),
      Product(name: 'Casio G Shock', imageUrl: 'https://www.kamalwatch.com/cdn/shop/products/G660.webp?v=1685422776', price: 1499),
    ]),
    ProductCategory(name: 'Mobiles', products: [
       Product(name: 'I phone 17 Pro 256GB', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdiO49sY9kh6lKMVlBtVWCCdCk03DloMakQQ&s', price: 149990),
        Product(name: 'Casio G Shock', imageUrl: 'https://www.kamalwatch.com/cdn/shop/products/G660.webp?v=1685422776', price: 1499),
         Product(name: 'Casio G Shock', imageUrl: 'https://www.kamalwatch.com/cdn/shop/products/G660.webp?v=1685422776', price: 1499),
    ])

];
