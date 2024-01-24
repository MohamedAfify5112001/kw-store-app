import 'package:kw_store_app/core/paths/app_image_paths.dart';
import 'package:kw_store_app/model/category_model.dart';
import 'package:kw_store_app/model/company.dart';
import 'package:kw_store_app/model/company_product.dart';
import 'package:kw_store_app/model/product.dart';

sealed class ProductList {
  static List<Product> get products => [
        const Product(
          name: 'Apple iPhone 14 Pro (256 GB) - Deep Purple',
          salary: '1000',
          salaryAfterDiscount: '600',
          image:
              'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-card-40-iphone15prohero-202309_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1693086369818',
          categoryType: CategoryType.phone,
        ),
        const Product(
          name: 'Apple iPhone 15 Pro (256 GB) - Deep dark',
          salary: '900',
          salaryAfterDiscount: '400',
          image:
              'https://shop.orange.eg/content/images/thumbs/0004377_iphone-13_550.jpeg',
          categoryType: CategoryType.phone,
        ),
        const Product(
          name: 'Laptop Go 3 (12.4" Touchscreen, i5, Windows)-',
          salary: '12000',
          salaryAfterDiscount: '10000',
          image:
              'https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RW16e0d?ver=358e&q=90&m=6&h=705&w=1253&b=%23FFFFFFFF&f=jpg&o=f&p=140&aim=true',
          categoryType: CategoryType.laptop,
        ),
        const Product(
          name: 'Dell Latitude 15-inch 3520 Business Laptop',
          salary: '10000',
          salaryAfterDiscount: '9000',
          image:
              'https://m.media-amazon.com/images/I/81IZesT3+LL._AC_UF1000,1000_QL80_.jpg',
          categoryType: CategoryType.laptop,
        ),
        const Product(
          name: 'Mobile Charger for Nokia Asha 500 Charger Original',
          salary: '400',
          salaryAfterDiscount: '100',
          image:
              'https://5.imimg.com/data5/SELLER/Default/2022/10/HK/MS/AV/161911744/51xjzsfi8gl-sl1500--500x500.jpg',
          categoryType: CategoryType.charge,
        ),
        const Product(
          name: 'Samsung Mobile Charger 500 Charger Original',
          salary: '500',
          salaryAfterDiscount: '300',
          image:
              'https://tiimg.tistatic.com/fp/1/008/029/high-speed-shock-resistance-slim-and-sleek-design-white-samsung-mobile-charger-684.jpg',
          categoryType: CategoryType.charge,
        ),
        const Product(
          name: 'Smart watches I Smart Watch at the best prices',
          salary: '12000',
          salaryAfterDiscount: '10000',
          image:
              'https://ehabgroup.com/media/catalog/product/b/u/buddy_smart_watch_budfit_black.jpg?width=300&store=english&image-type=thumbnail',
          categoryType: CategoryType.smartWatch,
        ),
        const Product(
          name: 'Zepp E Square AMOLED Display Waterproof',
          salary: '12000',
          salaryAfterDiscount: '11000',
          image:
              'https://m.media-amazon.com/images/I/51FJXPgK7BL.__AC_SX300_SY300_QL70_ML2_.jpg',
          categoryType: CategoryType.smartWatch,
        ),
        const Product(
          name:
              'Canon EOS R5 Full-Frame Mirrorless Camera - 8K Video, 45 Megapixel Full-Frame CMOS Sensor',
          salary: '12000',
          salaryAfterDiscount: '11000',
          image:
              'https://m.media-amazon.com/images/I/71hpUUcC5uL._AC_UF894,1000_QL80_.jpg',
          categoryType: CategoryType.camera,
        ),
        const Product(
          name: 'Canon EOS 800D DSLR Camera, 24.2MP, 18-55mm - Black',
          salary: '15000',
          salaryAfterDiscount: '13000',
          image:
              'https://btech.com/cdn-cgi/image/quality=50,format=auto/media/catalog/product/cache/22b1bed05f04d71c4a848d770186c3c4/c/a/canon_eos_800d_2.jpg',
          categoryType: CategoryType.camera,
        ),
      ];
}

sealed class CategoriesList {
  static List<CategoryModel> get categories => const [
        CategoryModel(
          title: 'الكل',
          isSelected: true,
          type: CategoryType.all,
        ),
        CategoryModel(
          title: 'جوال',
          type: CategoryType.phone,
        ),
        CategoryModel(
          title: 'لابتوب',
          type: CategoryType.laptop,
        ),
        CategoryModel(
          title: 'شاحن',
          type: CategoryType.charge,
        ),
        CategoryModel(
          title: 'ساعة ذكية',
          type: CategoryType.smartWatch,
        ),
        CategoryModel(
          title: 'كاميرا',
          type: CategoryType.camera,
        ),
      ];
}

sealed class OffersList {
  static List<Product> get offers => [
        const Product(
          name: 'Apple iPhone 14 Pro (256 GB) - Deep Purple',
          salary: '1000',
          salaryAfterDiscount: '600',
          image:
              'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-card-40-iphone15prohero-202309_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1693086369818',
          categoryType: CategoryType.phone,
        ),
        const Product(
          name: 'Apple iPhone 15 Pro (256 GB) - Deep dark',
          salary: '900',
          salaryAfterDiscount: '400',
          image:
              'https://shop.orange.eg/content/images/thumbs/0004377_iphone-13_550.jpeg',
          categoryType: CategoryType.phone,
        ),
        const Product(
          name: 'Laptop Go 3 (12.4" Touchscreen, i5, Windows)-',
          salary: '12000',
          salaryAfterDiscount: '10000',
          image:
              'https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RW16e0d?ver=358e&q=90&m=6&h=705&w=1253&b=%23FFFFFFFF&f=jpg&o=f&p=140&aim=true',
          categoryType: CategoryType.laptop,
        ),
        const Product(
          name: 'Dell Latitude 15-inch 3520 Business Laptop',
          salary: '10000',
          salaryAfterDiscount: '9000',
          image:
              'https://m.media-amazon.com/images/I/81IZesT3+LL._AC_UF1000,1000_QL80_.jpg',
          categoryType: CategoryType.laptop,
        ),
        const Product(
          name: 'Mobile Charger for Nokia Asha 500 Charger Original',
          salary: '400',
          salaryAfterDiscount: '100',
          image:
              'https://5.imimg.com/data5/SELLER/Default/2022/10/HK/MS/AV/161911744/51xjzsfi8gl-sl1500--500x500.jpg',
          categoryType: CategoryType.charge,
        ),
      ];
}

sealed class CompanyList {
  static List<Company> get companies => [
        const Company(
          image: AppImagePaths.company1,
          name: 'اكسايت',
          numberOfLikes: 349,
        ),
        const Company(
          image: AppImagePaths.company2,
          name: 'يوريكا الكويت',
          numberOfLikes: 500,
        ),
        const Company(
          image: AppImagePaths.company3,
          name: 'بيست اليوسفي',
          numberOfLikes: 600,
        ),
        const Company(
          image: AppImagePaths.company4,
          name: 'زين',
          numberOfLikes: 250,
        ),
        const Company(
          image: AppImagePaths.company5,
          name: 'اوريدو الكويت',
          numberOfLikes: 50,
        ),
        const Company(
          image: AppImagePaths.company6,
          name: 'فوريوستور',
          numberOfLikes: 140,
        ),
      ];
}

sealed class CompanyProductList {
  static List<CompanyProduct> companyProducts() {
    final List<CompanyProduct> companiesProduct = [
      const CompanyProduct(
        company: Company(
          image: AppImagePaths.company1,
          name: 'اكسايت',
          numberOfLikes: 349,
        ),
        product: Product(
          name: 'Apple iPhone 14 Pro (256 GB) - Deep Purple',
          salary: '1000',
          salaryAfterDiscount: '600',
          image:
              'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-card-40-iphone15prohero-202309_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1693086369818',
          categoryType: CategoryType.phone,
        ),
      ),
      const CompanyProduct(
        company: Company(
          image: AppImagePaths.company2,
          name: 'يوريكا الكويت',
          numberOfLikes: 500,
        ),
        product: Product(
          name: 'Mobile Charger for Nokia Asha 500 Charger Original',
          salary: '400',
          salaryAfterDiscount: '100',
          image:
              'https://5.imimg.com/data5/SELLER/Default/2022/10/HK/MS/AV/161911744/51xjzsfi8gl-sl1500--500x500.jpg',
          categoryType: CategoryType.charge,
        ),
      ),
      const CompanyProduct(
        company: Company(
          image: AppImagePaths.company3,
          name: 'بيست اليوسفي',
          numberOfLikes: 500,
        ),
        product: Product(
          name:
              'Canon EOS R5 Full-Frame Mirrorless Camera - 8K Video, 45 Megapixel Full-Frame CMOS Sensor',
          salary: '12000',
          salaryAfterDiscount: '11000',
          image:
              'https://m.media-amazon.com/images/I/71hpUUcC5uL._AC_UF894,1000_QL80_.jpg',
          categoryType: CategoryType.camera,
        ),
      ),
      const CompanyProduct(
        company: Company(
          image: AppImagePaths.company4,
          name: 'زين',
          numberOfLikes: 500,
        ),
        product: Product(
          name: 'Dell Latitude 15-inch 3520 Business Laptop',
          salary: '10000',
          salaryAfterDiscount: '9000',
          image:
              'https://m.media-amazon.com/images/I/81IZesT3+LL._AC_UF1000,1000_QL80_.jpg',
          categoryType: CategoryType.laptop,
        ),
      ),
    ];
    return companiesProduct;
  }
}
