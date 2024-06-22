import 'package:mystore/domain/entities/products/product_attribute_model.dart';
import 'package:mystore/domain/entities/products/product_model.dart';
import 'package:mystore/domain/entities/products/product_variation_model.dart';
import 'package:mystore/domain/entities/user/user_model.dart';
import 'package:mystore/utils/constants/image_strings.dart';

import '../domain/entities/banner/banner_model.dart';
import '../domain/entities/brands/brand_category_model.dart';
import '../domain/entities/brands/brand_model.dart';

import '../domain/entities/category/category_model.dart';
import '../domain/entities/products/product_category_model.dart';
import '../routes/routes.dart';

class DummyData {
  /// banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: AppImages.promBanner1,
        targetScreen: CustomRoutes.order,
        active: false),
    BannerModel(
        imageUrl: AppImages.promBanner2,
        targetScreen: CustomRoutes.cart,
        active: true),
    BannerModel(
        imageUrl: AppImages.promBanner3,
        targetScreen: CustomRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: AppImages.promBanner4,
        targetScreen: CustomRoutes.search,
        active: true),
    BannerModel(
        imageUrl: AppImages.promBanner5,
        targetScreen: CustomRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: AppImages.promBanner6,
        targetScreen: CustomRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: AppImages.promBanner7,
        targetScreen: CustomRoutes.checkout,
        active: false),
  ];

  /// user

  static final UserModel user = UserModel(
    firstName: "Jean",
    lastName: "Guirou",
    username: "jeanguirou",
    email: "jeanguirou@yahoo.com",
    phoneNumber: "330758057380",
    profilePicture: AppImages.animalIcon,

    /*addresses:[
      AddressModel(
        id: '1',
        name: 'Jean Guirou',
        phoneNumber: '330758057380',
        street: '54B Rue Raoul Follerau',
        city: 'Poitiers',
        state: 'Poitiers',
        postalCode: '86000',
        country: 'France'

      ),
      AddressModel(
          id: '6',
          name: 'John Doe',
          phoneNumber: '330758057380',
          street: '54B Rue Raoul Follerau',
          city: 'Poitiers',
          state: 'Poitiers',
          postalCode: '86000',
          country: 'France'

      ),

    ]
      */
  );

  /// Cart
  ///
  /*
  static final CartModel cart = CartModel(
    cartId: '001',
    items: [
      CartIemModel(
        productId: '001',
        variationId: '1',
        quantity: 1,
        title: products[0].title,
        image: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,

      ),

      CartIemModel(
        productId: '002',
        variationId: '',
        quantity: 1,
        title: products[0].title,
        image: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,

      ),


    ]
  );

  */

  /// Order
  /*
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'DW0012',
      status: OrderStatus.processing,
      items: cart.items,
      totalAmount: 265,
      orderDate: DateTime(2024, 09, 1),
      deliveryDate: DateTime(2024, 09, 9),
    ),
    OrderModel(
      id: 'DW0023',
      status: OrderStatus.processing,
      items: cart.items,
      totalAmount: 465,
      orderDate: DateTime(2024, 10, 12),
      deliveryDate: DateTime(2024, 10, 25),
    ),
  ];

  */

  /// List of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: AppImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Furniture',
        image: AppImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Electronics',
        image: AppImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Clothes', image: AppImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '4',
        name: 'Animals',
        image: AppImages.animalIcon,
        isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: AppImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: AppImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '14',
        name: 'Jewelry',
        image: AppImages.jeweleryIcon,
        isFeatured: true),

    /// Sub categories
    CategoryModel(
        id: '8',
        name: 'Sports Shoes',
        parentId: '1',
        image: AppImages.sportIcon,
        isFeatured: false),
    CategoryModel(
        id: '9',
        name: 'Track suits',
        parentId: '1',
        image: AppImages.sportIcon,
        isFeatured: false),
    CategoryModel(
        id: '10',
        name: 'Sports Equipments',
        parentId: '1',
        image: AppImages.sportIcon,
        isFeatured: false),

    // furniture
    CategoryModel(
        id: '11',
        name: 'Bedroom furniture',
        parentId: '5',
        image: AppImages.furnitureIcon,
        isFeatured: false),
    CategoryModel(
        id: '12',
        name: 'Kitchen furniture',
        parentId: '5',
        image: AppImages.furnitureIcon,
        isFeatured: false),
    CategoryModel(
        id: '13',
        name: 'Office furniture',
        parentId: '5',
        image: AppImages.furnitureIcon,
        isFeatured: false),
    // electronics
    CategoryModel(
        id: '14',
        name: 'Laptop',
        parentId: '2',
        image: AppImages.electronicsIcon,
        isFeatured: false),
    CategoryModel(
        id: '15',
        name: 'Mobile',
        parentId: '2',
        image: AppImages.electronicsIcon,
        isFeatured: false),

    CategoryModel(
        id: '16',
        name: 'Shirts',
        parentId: '3',
        image: AppImages.clothIcon,
        isFeatured: false),
  ];

  ///List of brands
  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        name: 'Nike',
        image: AppImages.nikeLogo,
        isFeatured: true,
        productsCount: 265),
    BrandModel(
        id: '2',
        name: 'Adidas',
        image: AppImages.adidasLogo,
        isFeatured: true,
        productsCount: 95),
    BrandModel(
        id: '8',
        name: 'Kenwood',
        image: AppImages.kenwoodLogo,
        isFeatured: true,
        productsCount: 36),
    BrandModel(
        id: '9',
        name: 'IKEA',
        image: AppImages.ikeaLogo,
        isFeatured: true,
        productsCount: 36),
    BrandModel(
        id: '5',
        name: 'Apple',
        image: AppImages.appleLogo,
        isFeatured: true,
        productsCount: 16),
    BrandModel(
        id: '10',
        name: 'Acer',
        image: AppImages.acerLogo,
        isFeatured: true,
        productsCount: 36),
    BrandModel(
        id: '3',
        name: 'Jordan',
        image: AppImages.jordanLogo,
        isFeatured: true,
        productsCount: 36),
    BrandModel(
        id: '4',
        name: 'Puma',
        image: AppImages.pumaLogo,
        isFeatured: true,
        productsCount: 65),
    BrandModel(
        id: '6',
        name: 'ZARA',
        image: AppImages.zaraLogo,
        isFeatured: true,
        productsCount: 36),
    BrandModel(
        id: '7',
        name: 'Samsung',
        image: AppImages.electronicsIcon,
        isFeatured: false,
        productsCount: 36),
  ];

  /// List of all  brand categories
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '001', categoryId: '1'),
    BrandCategoryModel(brandId: '001', categoryId: '8'),
    BrandCategoryModel(brandId: '004', categoryId: '3'),
    BrandCategoryModel(brandId: '002', categoryId: '3'),
    BrandCategoryModel(brandId: '002', categoryId: '16'),
    BrandCategoryModel(brandId: '003', categoryId: '3'),
    BrandCategoryModel(brandId: '005', categoryId: '1'),
    BrandCategoryModel(brandId: '005', categoryId: '8'),
    BrandCategoryModel(brandId: '040', categoryId: '2'),
    BrandCategoryModel(brandId: '040', categoryId: '15'),
    BrandCategoryModel(brandId: '006', categoryId: '2'),
    BrandCategoryModel(brandId: '007', categoryId: '4'),
    BrandCategoryModel(brandId: '009', categoryId: '1'),
    BrandCategoryModel(brandId: '009', categoryId: '8'),
    BrandCategoryModel(brandId: '010', categoryId: '1'),
    BrandCategoryModel(brandId: '010', categoryId: '8'),
    BrandCategoryModel(brandId: '011', categoryId: '1'),
    BrandCategoryModel(brandId: '011', categoryId: '8'),
    BrandCategoryModel(brandId: '012', categoryId: '1'),
    BrandCategoryModel(brandId: '012', categoryId: '8'),
    BrandCategoryModel(brandId: '013', categoryId: '1'),
    BrandCategoryModel(brandId: '013', categoryId: '8'),
    BrandCategoryModel(brandId: '014', categoryId: '1'),
    BrandCategoryModel(brandId: '014', categoryId: '9'),
    BrandCategoryModel(brandId: '015', categoryId: '1'),
    BrandCategoryModel(brandId: '015', categoryId: '9'),
    BrandCategoryModel(brandId: '016', categoryId: '1'),
    BrandCategoryModel(brandId: '016', categoryId: '9'),
    BrandCategoryModel(brandId: '017', categoryId: '1'),
    BrandCategoryModel(brandId: '017', categoryId: '9'),
    BrandCategoryModel(brandId: '018', categoryId: '1'),
    BrandCategoryModel(brandId: '018', categoryId: '10'),
    BrandCategoryModel(brandId: '019', categoryId: '1'),
    BrandCategoryModel(brandId: '019', categoryId: '10'),
    BrandCategoryModel(brandId: '020', categoryId: '1'),
    BrandCategoryModel(brandId: '020', categoryId: '10'),
    BrandCategoryModel(brandId: '021', categoryId: '1'),
    BrandCategoryModel(brandId: '021', categoryId: '10'),
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '11'),
    BrandCategoryModel(brandId: '8', categoryId: '12'),
    BrandCategoryModel(brandId: '8', categoryId: '13'),
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
    BrandCategoryModel(brandId: '9', categoryId: '12'),
    BrandCategoryModel(brandId: '9', categoryId: '13'),
  ];

  /// List of all Products categories
  static final List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(brandId: '1', categoryId: '1'),
    ProductCategoryModel(brandId: '1', categoryId: '8'),
    ProductCategoryModel(brandId: '1', categoryId: '9'),
    ProductCategoryModel(brandId: '1', categoryId: '10'),
    ProductCategoryModel(brandId: '2', categoryId: '1'),
    ProductCategoryModel(brandId: '2', categoryId: '8'),
    ProductCategoryModel(brandId: '2', categoryId: '9'),
    ProductCategoryModel(brandId: '2', categoryId: '10'),
    ProductCategoryModel(brandId: '3', categoryId: '1'),
    ProductCategoryModel(brandId: '3', categoryId: '8'),
    ProductCategoryModel(brandId: '3', categoryId: '9'),
    ProductCategoryModel(brandId: '3', categoryId: '10'),
    ProductCategoryModel(brandId: '4', categoryId: '1'),
    ProductCategoryModel(brandId: '4', categoryId: '8'),
    ProductCategoryModel(brandId: '4', categoryId: '9'),
    ProductCategoryModel(brandId: '4', categoryId: '10'),
    ProductCategoryModel(brandId: '5', categoryId: '15'),
    ProductCategoryModel(brandId: '5', categoryId: '2'),
    ProductCategoryModel(brandId: '10', categoryId: '2'),
  ];

  /// List of all products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: ' Nike Air Force shoes',
      description: ' Nike Air Force shoes',
      brand: BrandModel(
        id: '1',
        name: 'Nike',
        image: AppImages.nikeLogo,
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        AppImages.nikeBlack,
        AppImages.nikeGreen,
        AppImages.nikeWhite,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      stock: 15,
      price: 135.0,
      thumbnail: AppImages.nikeWhite,
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'Green', 'White']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          image: AppImages.nikeBlack,
          stock: 34,
          price: 134.0,
          salePrice: 122.6,
          attributesValues: {'Color': 'Black', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '2',
          image: AppImages.nikeGreen,
          stock: 15,
          price: 132.0,
          attributesValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          image: AppImages.nikeWhite,
          stock: 0,
          price: 234.0,

          attributesValues: {'Color': 'White', 'Size': 'EU 34'},
        ),

      ],
      productType: 'ProductType.variable',
      isFeatured: true,
    ),

    ProductModel(
      id: '002',
      title: ' Nike T-shirt',
      description: 'Nike t-shirt',
      brand: BrandModel(
        id: '1',
        name: 'Nike',
        image: AppImages.nikeLogo,
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        AppImages.nikeTShirtBlack,
        AppImages.nikeTShirtWhite,
        AppImages.nikeTShirtYellow,
      ],
      salePrice: 30.0,
      sku: 'ABR4568',
      categoryId: '1',
      stock: 15,
      price: 135.0,
      thumbnail: AppImages.nikeTShirtBlack,
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'White', 'Yellow']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          image: AppImages.nikeTShirtBlack,
          stock: 34,
          price: 134.0,
          salePrice: 122.6,
          attributesValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '2',
          image: AppImages.nikeTShirtWhite,
          stock: 15,
          price: 132.0,
          attributesValues: {'Color': 'White', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          image: AppImages.nikeTShirtYellow,
          stock: 0,
          price: 234.0,

          attributesValues: {'Color': 'Yellow', 'Size': 'EU 34'},
        ),

      ],
      productType: 'ProductType.variable',
      isFeatured: true,
    ),


    ProductModel(
      id: '003',
      title: 'Iphone 15',
      description: 'This is a product description for apple Iphone 15. There are things that can be added but i am just practicing and nothing else',
      brand: BrandModel(
        id: '6',
        name: 'Apple',
        image: AppImages.appleLogo,

        isFeatured: false,
      ),
      images: [
        AppImages.appleIphone15Black,
        AppImages.appleIphone15White,
        AppImages.appleIphone15Pink,
      ],
      salePrice: 30.0,
      sku: 'ABR4568',
      categoryId: '16',
      stock: 15,
      price: 3800,
      thumbnail: AppImages.appleIphone15Black,
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'White', 'Pink']),
      ],
      productType: 'ProductType.single',
      isFeatured: true,
    ),

    ProductModel(
      id: '004',
      title: '4 color collar t-shirt dry fit',
      description: 'This is a product description for 4 color collar t-shirt dry fit. There are things that can be added but i am just practicing and nothing else',
      brand: BrandModel(
        id: '6',
        name: 'ZARA',
        image: AppImages.zaraLogo,

        isFeatured: false,
      ),
      images: [
        AppImages.productImage1,
        AppImages.productImage2,
        AppImages.productImage3,
        AppImages.productImage2,
      ],
      salePrice: 30.0,
      sku: 'ABR4568',
      categoryId: '16',
      stock: 15,
      price: 135.0,
      thumbnail: AppImages.productImage1,
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          image: AppImages.productImage1,
          stock: 34,
          price: 134.0,
          salePrice: 122.6,
          attributesValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          image: AppImages.productImage1,
          stock: 15,
          price: 132.0,
          attributesValues: {'Color': 'Yellow', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '3',
          image: AppImages.productImage1,
          stock: 0,
          price: 234.0,

          attributesValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          image: AppImages.productImage1,
          stock: 222,
          price: 232.0,

          attributesValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          image: AppImages.productImage1,
          stock: 0,
          price: 334.0,
          attributesValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          image: AppImages.productImage1,
          stock: 11,
          price: 332.9,
          salePrice: 122.6,
          attributesValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
      productType: 'ProductType.single',
      isFeatured: true,
    ),
  ];
}
