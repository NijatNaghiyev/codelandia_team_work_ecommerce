const List<String> kCategoriesList = [
  "smartphones",
  "laptops",
  "fragrances",
  "skincare",
  "groceries",
  "home-decoration",
  "furniture",
  "tops",
  "womens-dresses",
  "womens-shoes",
  "mens-shirts",
  "mens-shoes",
  "mens-watches",
  "womens-watches",
  "womens-bags",
  "womens-jewellery",
  "sunglasses",
  "automotive",
  "motorcycle",
  "lighting"
];

const Map<String, String> kCategoryImages = {
  "smartphones": "https://www.egypttoday.com/siteimages/Larg/58151.jpg",
  "laptops":
      "https://images.squarespace-cdn.com/content/v1/569706fb5dc6def15843549d/1598012438800-CJHZELMO6QWC0K4B7WZ3/Best+Laptops+Money+Can+Buy+in+2020+%28August+2020+Updated+List%29.JPG?format=1000w",
  "fragrances":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_l4qDHTsXTbxxJshOLF7uwuweEqEjeOPvwA&usqp=CAU",
  "skincare":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmIY5HpK5py-guAiwO8JIBrDNZCigfXY6a5g&usqp=CAU",
  "groceries":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXVmVGwwHB_ct8eaB6PH0gKmWnrudQwiKJhDsWgERd8LZ6NaBXuajSOY939E7XDLGbKZI&usqp=CAU",
  "home-decoration":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY2Ugl6dfDp8Uook6W0Mtj9mpRmJ5pZ0H1yQ&usqp=CAU",
  "furniture":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYQRWQyvE8efXbhLURKCnFExfg1f0lETC7gw&usqp=CAU",
  "tops":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSHaKVDRd-H8OnNousjEiEsNafzxD6EG8R2g&usqp=CAU",
  "womens-dresses":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTSVRD9SLN-1NcyoKsf_JVT4QAnrIuy2HMaw&usqp=CAU",
  "womens-shoes":
      "https://blog.metroshoes.com/wp-content/uploads/2023/03/shutterstock_249179941.jpg",
  "mens-shirts":
      "https://cottonworld.net/cdn/shop/products/M-SHIRTS-13484-20546-GREEN_6.jpg?v=1674640046",
  "mens-shoes":
      "https://media.istockphoto.com/id/187310279/photo/brown-leather-shoe.jpg?s=612x612&w=0&k=20&c=N-G1SP8dDojp3M_ykS7tQuYI8OVPWM0XA8_knBiWRtY=",
  "mens-watches":
      "https://media.istockphoto.com/id/533714204/photo/businessman-checking-time-from-watch.jpg?s=612x612&w=0&k=20&c=bJN94WW68Rw8uEogp3GKtBYnhcrNFNnf1SkWb0KDvGo=",
  "womens-watches":
      "https://www.michele.com/on/demandware.static/-/Library-Sites-MicheleSharedLibrary/default/dw890252a8/2023/SP23/set_01252023/watches/3_WatchesCategoryLP_Serein_Mobile.jpg",
  "womens-bags":
      "https://www.dunelondon.com.au/cdn/shop/collections/Dune_Category_Banners_DT_Womens_Bags_00e0a0b0-1c1e-4997-9ee0-e313dd0a9a65.jpg?v=1673574399",
  "womens-jewellery":
      "https://b694531.smushcdn.com/694531/wp-content/uploads/2019/12/iStock-182187343-res.jpg?lossy=0&strip=0&webp=1",
  "sunglasses":
      "https://solaroidenergy.com/wp-content/uploads/2023/02/category-4-sunglasses-1.jpg",
  "automotive":
      "https://s1.cdn.autoevolution.com/images/news/bmw-m8-coupe-is-a-category-5-hurricane-with-900-metric-horsepower-200640-7.jpg",
  "motorcycle":
      "https://bikerrated.com/wp-content/uploads/2019/06/lexmoto-lxr125-best-sportsbike.png",
  "lighting":
      "https://media.istockphoto.com/id/1040905642/fr/photo/ampoule-allum%C3%A9e-parmi-les-ampoules-%C3%A9teintes.jpg?s=612x612&w=0&k=20&c=W57iTioVKDo-547Hqli_Bgxna8uS5PrNAADaJv0e0RI="
};

const Map<String, int> kCategoryBackgroundColor = {
  "smartphones": 0xFFFF5733,
  "laptops": 0xFF00ADEF,
  "fragrances": 0xFFFFD700,
  "skincare": 0xFFFF85A1,
  "groceries": 0xFF00CC99,
  "home-decoration": 0xFF8A2BE2,
  "furniture": 0xFFFF4500,
  "tops": 0xFFFFC0CB,
  "womens-dresses": 0xFF800080,
  "womens-shoes": 0xFF008080,
  "mens-shirts": 0xFFFF6347,
  "mens-shoes": 0xFF7B68EE,
  "mens-watches": 0xFFFFA07A,
  "womens-watches": 0xFF87CEEB,
  "womens-bags": 0xFFFFD700,
  "womens-jewellery": 0xFFFF69B4,
  "sunglasses": 0xFF00FFFF,
  "automotive": 0xFF008000,
  "motorcycle": 0xFF5b42ff,
  "lighting": 0xFFFF1493,
};

const Map<String, String> categoryDescriptions = {
  "smartphones":
      "Explore a wide range of cutting-edge smartphones with advanced features and technologies, catering to your communication and entertainment needs.",
  "laptops":
      "Discover a collection of powerful laptops designed to enhance productivity and provide seamless computing experiences, whether for work or leisure.",
  "fragrances":
      "Indulge your senses with an exquisite selection of fragrances, ranging from floral and fruity to woody and oriental, perfect for personal expression.",
  "skincare":
      "Nurture your skin with an array of skincare products, including cleansers, moisturizers, serums, and treatments, to achieve a radiant and healthy complexion.",
  "groceries":
      "Find a diverse assortment of grocery items, including fresh produce, pantry staples, snacks, and beverages, to stock your kitchen with quality ingredients.",
  "home-decoration":
      "Elevate your living spaces with a variety of home decoration items, such as decorative accents, artwork, and furnishings, to create a personalized ambiance.",
  "furniture":
      "Furnish your home with stylish and functional furniture pieces, including sofas, tables, beds, and chairs, designed to enhance your living environment.",
  "tops":
      "Browse through a fashionable collection of tops, including shirts, blouses, and t-shirts, designed to keep you comfortable and stylish for any occasion.",
  "womens-dresses":
      "Explore an array of women's dresses, from casual to formal, designed to accentuate your style and grace, making you stand out at events.",
  "womens-shoes":
      "Step into elegance and comfort with a range of women's shoes, including heels, flats, and sneakers, catering to different tastes and preferences.",
  "mens-shirts":
      "Discover a variety of men's shirts, suitable for work or casual outings, offering comfort and style to complement your wardrobe.",
  "mens-shoes":
      "Find the perfect pair of men's shoes, whether for formal occasions or everyday wear, balancing aesthetics and functionality.",
  "mens-watches":
      "Adorn your wrist with sophisticated men's watches, combining style and precision to make a timeless statement.",
  "womens-watches":
      "Accessorize elegantly with women's watches that merge fashion and functionality, enhancing your overall ensemble.",
  "womens-bags":
      "Carry your essentials in style with an assortment of women's bags, including handbags, totes, and clutches, designed to complement your outfit.",
  "womens-jewellery":
      "Enhance your look with exquisite women's jewelry, including necklaces, earrings, and bracelets, adding a touch of glamour to any outfit.",
  "sunglasses":
      "Protect your eyes in style with a range of sunglasses that offer both UV protection and fashion-forward designs.",
  "automotive":
      "Explore automotive products and accessories, catering to car enthusiasts and those in need of reliable vehicle maintenance.",
  "motorcycle":
      "Find gear, accessories, and essentials for motorcycle enthusiasts, ensuring safety and style on every ride.",
  "lighting":
      "Illuminate your surroundings with a variety of lighting solutions, including lamps, chandeliers, and fixtures, to create the desired ambiance in your spaces."
};
