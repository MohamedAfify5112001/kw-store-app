import 'package:equatable/equatable.dart';
import 'package:kw_store_app/model/company.dart';
import 'package:kw_store_app/model/copyable.dart';
import 'package:kw_store_app/model/product.dart';

final class CompanyProduct extends Equatable
    implements BaseCopyableWith<CompanyProduct> {
  final Product product;
  final Company company;

  const CompanyProduct({
    required this.company,
    required this.product,
  });

  @override
  CompanyProduct copyWith({
    Company? company,
    Product? product,
  }) =>
      CompanyProduct(
        company: company ?? this.company,
        product: product ?? this.product,
      );

  @override
  List<Object> get props => [product, company];
}
