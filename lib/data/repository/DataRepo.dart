import '../models/Category.dart';
import '../models/Source.dart';

class DataRepo {
  static final List<Source> sourceList = [
    Source(1, "Wallet"),
    Source(2, "Bank"),
    Source(3, "Saving"),
  ];
  
  static final List<Category> categories = [
    Category(1, 'Foods & Drinks'),
    Category(2, 'Transportation'),
    Category(3, 'Entertainment'),
  ];

  static final List<SubCategory> subCategories = [
    SubCategory(1, 'Groceries', 1),
    SubCategory(2, 'Beverage & Alcohol', 1),
    SubCategory(3, 'Restaurant & Cafe', 1),

    SubCategory(4, 'Fuel', 2),
    SubCategory(5, 'Maintenance', 2),
    SubCategory(6, 'Insurance', 2),

    SubCategory(7, 'Movies & Streaming', 3),
    SubCategory(8, 'Holidays & Trips', 3),
    SubCategory(9, 'Special events', 3),
  ];
}