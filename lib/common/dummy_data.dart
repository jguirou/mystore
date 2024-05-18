import 'package:mystore/domain/entities/user/user_model.dart';
import 'package:mystore/utils/constants/image_strings.dart';

import '../domain/entities/category/category_model.dart';
import '../utils/constants/enums.dart';

/*
class DummyData {


  /// banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: AppImages.promBanner1, targetScreen: CustomRoutes.order, active: false),
    BannerModel(imageUrl: AppImages.promBanner2, targetScreen: CustomRoutes.order, active: false),
    BannerModel(imageUrl: AppImages.promBanner3, targetScreen: CustomRoutes.order, active: false),
  ];

  /// user
  static final UserModel user = UserModel(

      firstName: "Jean",
      lastName: "Guirou",
      username: "jeanguirou",
      email: "jeanguirou@yahoo.com",
      phoneNumber: "330758057380",
      profilePicture: AppImages.animalIcon,
    addresses:[
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
  );


  /// Cart
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

  /// Order
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


  /// List of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Sports', image: AppImages.sportIcon, isFeatured: true),
  CategoryModel(id: '5', name: 'Furniture', image: AppImages.furnitureIcon, isFeatured: true),
  CategoryModel(id: '2', name: 'Electronics', image: AppImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Clothes', image: AppImages.clothIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Animals', image: AppImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: AppImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetics', image: AppImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '14', name: 'Jewelry', image: AppImages.jeweleryIcon, isFeatured: true),



    /// Sub categories
    CategoryModel(id: '8', name: 'Sports Shoes', parentId: '1', image: AppImages.sportIcon, isFeatured: false),
    CategoryModel(id: '9', name: 'Track suits',parentId: '1', image: AppImages.sportIcon, isFeatured: false),
    CategoryModel(id: '10', name: 'Sports Equipments',parentId: '1', image: AppImages.sportIcon, isFeatured: false),

    // furniture
    CategoryModel(id: '11', name: 'Bedroom furniture', parentId: '5', image: AppImages.furnitureIcon, isFeatured: false),
    CategoryModel(id: '12', name: 'Kitchen furniture',parentId: '5', image: AppImages.furnitureIcon, isFeatured: false),
    CategoryModel(id: '13', name: 'Office furniture',parentId: '5', image: AppImages.furnitureIcon, isFeatured: false),
    // electronics
    CategoryModel(id: '14', name: 'Laptop', parentId: '2', image: AppImages.electronicsIcon, isFeatured: false),
    CategoryModel(id: '15', name: 'Mobile',parentId: '2', image: AppImages.electronicsIcon, isFeatured: false),

    CategoryModel(id: '16', name: 'Shirts',parentId: '3', image: AppImages.clothIcon, isFeatured: false),


  ];
}  */