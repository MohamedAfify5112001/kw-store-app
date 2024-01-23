// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_product_cart.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalProductCartCollection on Isar {
  IsarCollection<LocalProductCart> get localProductCarts => this.collection();
}

const LocalProductCartSchema = CollectionSchema(
  name: r'LocalProductCart',
  id: 6755681963465622847,
  properties: {
    r'image': PropertySchema(
      id: 0,
      name: r'image',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'salary': PropertySchema(
      id: 2,
      name: r'salary',
      type: IsarType.string,
    ),
    r'salaryAfterDiscount': PropertySchema(
      id: 3,
      name: r'salaryAfterDiscount',
      type: IsarType.string,
    )
  },
  estimateSize: _localProductCartEstimateSize,
  serialize: _localProductCartSerialize,
  deserialize: _localProductCartDeserialize,
  deserializeProp: _localProductCartDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _localProductCartGetId,
  getLinks: _localProductCartGetLinks,
  attach: _localProductCartAttach,
  version: '3.1.0+1',
);

int _localProductCartEstimateSize(
  LocalProductCart object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.image.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.salary.length * 3;
  bytesCount += 3 + object.salaryAfterDiscount.length * 3;
  return bytesCount;
}

void _localProductCartSerialize(
  LocalProductCart object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.image);
  writer.writeString(offsets[1], object.name);
  writer.writeString(offsets[2], object.salary);
  writer.writeString(offsets[3], object.salaryAfterDiscount);
}

LocalProductCart _localProductCartDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalProductCart();
  object.id = id;
  object.image = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  object.salary = reader.readString(offsets[2]);
  object.salaryAfterDiscount = reader.readString(offsets[3]);
  return object;
}

P _localProductCartDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _localProductCartGetId(LocalProductCart object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localProductCartGetLinks(LocalProductCart object) {
  return [];
}

void _localProductCartAttach(
    IsarCollection<dynamic> col, Id id, LocalProductCart object) {
  object.id = id;
}

extension LocalProductCartQueryWhereSort
    on QueryBuilder<LocalProductCart, LocalProductCart, QWhere> {
  QueryBuilder<LocalProductCart, LocalProductCart, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalProductCartQueryWhere
    on QueryBuilder<LocalProductCart, LocalProductCart, QWhereClause> {
  QueryBuilder<LocalProductCart, LocalProductCart, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocalProductCartQueryFilter
    on QueryBuilder<LocalProductCart, LocalProductCart, QFilterCondition> {
  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      imageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      imageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      imageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      imageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      imageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      imageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'salary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'salary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'salary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'salary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'salary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'salary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'salary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salary',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'salary',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryAfterDiscountEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salaryAfterDiscount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryAfterDiscountGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'salaryAfterDiscount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryAfterDiscountLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'salaryAfterDiscount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryAfterDiscountBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'salaryAfterDiscount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryAfterDiscountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'salaryAfterDiscount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryAfterDiscountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'salaryAfterDiscount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryAfterDiscountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'salaryAfterDiscount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryAfterDiscountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'salaryAfterDiscount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryAfterDiscountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salaryAfterDiscount',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterFilterCondition>
      salaryAfterDiscountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'salaryAfterDiscount',
        value: '',
      ));
    });
  }
}

extension LocalProductCartQueryObject
    on QueryBuilder<LocalProductCart, LocalProductCart, QFilterCondition> {}

extension LocalProductCartQueryLinks
    on QueryBuilder<LocalProductCart, LocalProductCart, QFilterCondition> {}

extension LocalProductCartQuerySortBy
    on QueryBuilder<LocalProductCart, LocalProductCart, QSortBy> {
  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy> sortByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy>
      sortByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy>
      sortBySalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salary', Sort.asc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy>
      sortBySalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salary', Sort.desc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy>
      sortBySalaryAfterDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryAfterDiscount', Sort.asc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy>
      sortBySalaryAfterDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryAfterDiscount', Sort.desc);
    });
  }
}

extension LocalProductCartQuerySortThenBy
    on QueryBuilder<LocalProductCart, LocalProductCart, QSortThenBy> {
  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy> thenByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy>
      thenByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy>
      thenBySalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salary', Sort.asc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy>
      thenBySalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salary', Sort.desc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy>
      thenBySalaryAfterDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryAfterDiscount', Sort.asc);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QAfterSortBy>
      thenBySalaryAfterDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryAfterDiscount', Sort.desc);
    });
  }
}

extension LocalProductCartQueryWhereDistinct
    on QueryBuilder<LocalProductCart, LocalProductCart, QDistinct> {
  QueryBuilder<LocalProductCart, LocalProductCart, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QDistinct> distinctBySalary(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalProductCart, LocalProductCart, QDistinct>
      distinctBySalaryAfterDiscount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salaryAfterDiscount',
          caseSensitive: caseSensitive);
    });
  }
}

extension LocalProductCartQueryProperty
    on QueryBuilder<LocalProductCart, LocalProductCart, QQueryProperty> {
  QueryBuilder<LocalProductCart, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalProductCart, String, QQueryOperations> imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<LocalProductCart, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<LocalProductCart, String, QQueryOperations> salaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salary');
    });
  }

  QueryBuilder<LocalProductCart, String, QQueryOperations>
      salaryAfterDiscountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salaryAfterDiscount');
    });
  }
}
