// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// FirestoreGenerator
// **************************************************************************

/// Identifiers for all Firestore collections in the schema
/// Used to map collection paths to their respective collection classes
/// By combining collection classes (e.g., as tuple types),
/// we can use extension methods with record types to reduce boilerplate
/// Example: (_$UsersCollection, _$PostsCollection)
final class _$UsersCollection {}

final class _$CategoriesCollection {}

final class _$ProductsCollection {}

/// Generated schema class - dummy class that only serves as type marker
class AppSchema extends FirestoreSchema {
  const AppSchema();
}

/// Generated schema instance
const AppSchema _$AppSchema = AppSchema();

/// Generated FilterSelector for `User`
extension AppSchemaUserFilterSelectorExtension on FilterSelector<User> {
  /// Filter by document ID (id field)
  @pragma('vm:prefer-inline')
  DocumentIdFieldFilter get id => DocumentIdFieldFilter(
        name: 'id',
        parent: this,
      );

  /// Filter by firstName
  StringFieldFilter get firstName => StringFieldFilter(
        name: 'firstName',
        parent: this,
      );

  /// Filter by lastName
  StringFieldFilter get lastName => StringFieldFilter(
        name: 'lastName',
        parent: this,
      );

  /// Filter by email
  StringFieldFilter get email => StringFieldFilter(
        name: 'email',
        parent: this,
      );

  /// Filter by createdAt
  DateTimeFieldFilter get createdAt => DateTimeFieldFilter(
        name: 'createdAt',
        parent: this,
      );
}

/// Generated OrderByFieldSelector for `User`
extension AppSchemaUserOrderByFieldSelectorExtension
    on OrderByFieldSelector<User> {
  /// Order by document ID (id field)
  OrderByField<String> get id => OrderByField(
        name: 'id',
        parent: this,
        type: FieldPathType.documentId,
      );

  /// Order by firstName
  OrderByField<String> get firstName => OrderByField(
        name: 'firstName',
        parent: this,
      );

  /// Order by lastName
  OrderByField<String> get lastName => OrderByField(
        name: 'lastName',
        parent: this,
      );

  /// Order by email
  OrderByField<String> get email => OrderByField(
        name: 'email',
        parent: this,
      );

  /// Order by createdAt
  OrderByField<DateTime> get createdAt => OrderByField(
        name: 'createdAt',
        parent: this,
      );
}

/// Generated AggregateFieldSelector for User
extension AppSchemaUserAggregateFieldSelectorExtension
    on AggregateFieldSelector<User> {}

extension AppSchemaUserPatchBuilder on PatchBuilder<User> {
  /// Update id field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get id => PatchBuilder(
        name: 'id',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update firstName field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get firstName => PatchBuilder(
        name: 'firstName',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update lastName field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get lastName => PatchBuilder(
        name: 'lastName',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update email field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get email => PatchBuilder(
        name: 'email',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update createdAt field `DateTime`
  @pragma('vm:prefer-inline')
  DateTimeFieldUpdate<DateTime> get createdAt => DateTimeFieldUpdate(
        name: 'createdAt',
        parent: this,
      );
}

/// Generated FilterSelector for `Category`
extension AppSchemaCategoryFilterSelectorExtension on FilterSelector<Category> {
  /// Filter by document ID (id field)
  @pragma('vm:prefer-inline')
  DocumentIdFieldFilter get id => DocumentIdFieldFilter(
        name: 'id',
        parent: this,
      );

  /// Filter by title
  StringFieldFilter get title => StringFieldFilter(
        name: 'title',
        parent: this,
      );

  /// Filter by description
  StringFieldFilter get description => StringFieldFilter(
        name: 'description',
        parent: this,
      );

  /// Filter by createdAt
  DateTimeFieldFilter get createdAt => DateTimeFieldFilter(
        name: 'createdAt',
        parent: this,
      );
}

/// Generated OrderByFieldSelector for `Category`
extension AppSchemaCategoryOrderByFieldSelectorExtension
    on OrderByFieldSelector<Category> {
  /// Order by document ID (id field)
  OrderByField<String> get id => OrderByField(
        name: 'id',
        parent: this,
        type: FieldPathType.documentId,
      );

  /// Order by title
  OrderByField<String> get title => OrderByField(
        name: 'title',
        parent: this,
      );

  /// Order by description
  OrderByField<String> get description => OrderByField(
        name: 'description',
        parent: this,
      );

  /// Order by createdAt
  OrderByField<DateTime> get createdAt => OrderByField(
        name: 'createdAt',
        parent: this,
      );
}

/// Generated AggregateFieldSelector for Category
extension AppSchemaCategoryAggregateFieldSelectorExtension
    on AggregateFieldSelector<Category> {}

extension AppSchemaCategoryPatchBuilder on PatchBuilder<Category> {
  /// Update id field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get id => PatchBuilder(
        name: 'id',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update title field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get title => PatchBuilder(
        name: 'title',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update description field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get description => PatchBuilder(
        name: 'description',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update createdAt field `DateTime`
  @pragma('vm:prefer-inline')
  DateTimeFieldUpdate<DateTime> get createdAt => DateTimeFieldUpdate(
        name: 'createdAt',
        parent: this,
      );
}

/// Generated FilterSelector for `Product`
extension AppSchemaProductFilterSelectorExtension on FilterSelector<Product> {
  /// Filter by document ID (id field)
  @pragma('vm:prefer-inline')
  DocumentIdFieldFilter get id => DocumentIdFieldFilter(
        name: 'id',
        parent: this,
      );

  /// Filter by name
  StringFieldFilter get name => StringFieldFilter(
        name: 'name',
        parent: this,
      );

  /// Filter by description
  StringFieldFilter get description => StringFieldFilter(
        name: 'description',
        parent: this,
      );

  /// Filter by price
  StringFieldFilter get price => StringFieldFilter(
        name: 'price',
        parent: this,
      );

  /// Filter by createdAt
  DateTimeFieldFilter get createdAt => DateTimeFieldFilter(
        name: 'createdAt',
        parent: this,
      );
}

/// Generated OrderByFieldSelector for `Product`
extension AppSchemaProductOrderByFieldSelectorExtension
    on OrderByFieldSelector<Product> {
  /// Order by document ID (id field)
  OrderByField<String> get id => OrderByField(
        name: 'id',
        parent: this,
        type: FieldPathType.documentId,
      );

  /// Order by name
  OrderByField<String> get name => OrderByField(
        name: 'name',
        parent: this,
      );

  /// Order by description
  OrderByField<String> get description => OrderByField(
        name: 'description',
        parent: this,
      );

  /// Order by price
  OrderByField<String> get price => OrderByField(
        name: 'price',
        parent: this,
      );

  /// Order by createdAt
  OrderByField<DateTime> get createdAt => OrderByField(
        name: 'createdAt',
        parent: this,
      );
}

/// Generated AggregateFieldSelector for Product
extension AppSchemaProductAggregateFieldSelectorExtension
    on AggregateFieldSelector<Product> {}

extension AppSchemaProductPatchBuilder on PatchBuilder<Product> {
  /// Update id field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get id => PatchBuilder(
        name: 'id',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update name field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get name => PatchBuilder(
        name: 'name',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update description field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get description => PatchBuilder(
        name: 'description',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update price field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get price => PatchBuilder(
        name: 'price',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update createdAt field `DateTime`
  @pragma('vm:prefer-inline')
  DateTimeFieldUpdate<DateTime> get createdAt => DateTimeFieldUpdate(
        name: 'createdAt',
        parent: this,
      );
}

/// Class to add collections to `FirestoreODM<AppSchema>`
extension AppSchemaODM on FirestoreODM<AppSchema> {
  /// Access users collection
  @pragma('vm:prefer-inline')
  FirestoreCollection<AppSchema, User, (_$UsersCollection,)> get users =>
      FirestoreCollection<AppSchema, User, (_$UsersCollection,)>(
        query: firestore.collection('users'),
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
      );
}

/// Extension to add collections to `TransactionContext<AppSchema>`
extension $AppSchemaTransactionContext on TransactionContext<AppSchema> {
  /// Access users collection
  @pragma('vm:prefer-inline')
  TransactionCollection<AppSchema, User, (_$UsersCollection,)> get users =>
      TransactionCollection<AppSchema, User, (_$UsersCollection,)>(
        query: ref.collection('users'),
        context: this,
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
      );
}

/// Transaction document class for users collection
extension $AppSchemaUsersTransactionDocument
    on TransactionDocument<AppSchema, User, (_$UsersCollection,)> {
  /// Access categories subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<AppSchema, Category,
          (_$UsersCollection, _$CategoriesCollection)>
      get categories => TransactionCollection<AppSchema, Category,
              (_$UsersCollection, _$CategoriesCollection)>(
            query: ref.collection('categories'),
            context: context,
            converter: const _$CategoryJsonConverter(),
            documentIdField: 'id',
          );
}

/// Transaction document class for users/*/categories collection
extension $AppSchemaUsersCategoriesTransactionDocument on TransactionDocument<
    AppSchema, Category, (_$UsersCollection, _$CategoriesCollection)> {
  /// Access products subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<
      AppSchema,
      Product,
      (
        _$UsersCollection,
        _$CategoriesCollection,
        _$ProductsCollection
      )> get products => TransactionCollection<AppSchema, Product,
          (_$UsersCollection, _$CategoriesCollection, _$ProductsCollection)>(
        query: ref.collection('products'),
        context: context,
        converter: const _$ProductJsonConverter(),
        documentIdField: 'id',
      );
}

/// Document class for users collection
extension $AppSchemaUsersDocument
    on FirestoreDocument<AppSchema, User, (_$UsersCollection,)> {
  /// Access categories subcollection
  FirestoreCollection<AppSchema, Category,
          (_$UsersCollection, _$CategoriesCollection)>
      get categories => FirestoreCollection<AppSchema, Category,
              (_$UsersCollection, _$CategoriesCollection)>(
            query: ref.collection('categories'),
            converter: const _$CategoryJsonConverter(),
            documentIdField: 'id',
          );
}

/// Document class for users/*/categories collection
extension $AppSchemaUsersCategoriesDocument on FirestoreDocument<AppSchema,
    Category, (_$UsersCollection, _$CategoriesCollection)> {
  /// Access products subcollection
  FirestoreCollection<
      AppSchema,
      Product,
      (
        _$UsersCollection,
        _$CategoriesCollection,
        _$ProductsCollection
      )> get products => FirestoreCollection<AppSchema, Product,
          (_$UsersCollection, _$CategoriesCollection, _$ProductsCollection)>(
        query: ref.collection('products'),
        converter: const _$ProductJsonConverter(),
        documentIdField: 'id',
      );
}

/// Extension to add collections to BatchContext<AppSchema>
extension AppSchemaBatchContextExtensions on BatchContext<AppSchema> {
  /// Access users collection
  BatchCollection<AppSchema, User, (_$UsersCollection,)> get users =>
      BatchCollection(
        collection: firestoreInstance.collection('users'),
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
        context: this,
      );
}

/// Batch document class for users collection
extension $AppSchemaUsersBatchDocument
    on BatchDocument<AppSchema, User, (_$UsersCollection,)> {
  /// Access categories subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<AppSchema, Category,
          (_$UsersCollection, _$CategoriesCollection)>
      get categories => getBatchCollection(
            parent: this,
            name: 'categories',
            converter: const _$CategoryJsonConverter(),
            documentIdField: 'id',
          );
}

/// Batch document class for users/*/categories collection
extension $AppSchemaUsersCategoriesBatchDocument on BatchDocument<AppSchema,
    Category, (_$UsersCollection, _$CategoriesCollection)> {
  /// Access products subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<AppSchema, Product,
          (_$UsersCollection, _$CategoriesCollection, _$ProductsCollection)>
      get products => getBatchCollection(
            parent: this,
            name: 'products',
            converter: const _$ProductJsonConverter(),
            documentIdField: 'id',
          );
}

//Generated converter for `FirestoreTimestampConverter`
class _$FirestoreTimestampConverterAnnotationConverter
    implements FirestoreConverter<DateTime, Object?> {
  const _$FirestoreTimestampConverterAnnotationConverter();

  @override
  DateTime fromJson(Object? data) =>
      FirestoreTimestampConverter().fromJson(data);

  @override
  Object? toJson(DateTime value) => FirestoreTimestampConverter().toJson(value);
}

//Generated converter for `User`
class _$UserJsonConverter
    implements FirestoreConverter<User, Map<String, dynamic>> {
  const _$UserJsonConverter();

  @override
  User fromJson(Map<String, dynamic> data) => User.fromJson(data);

  @override
  Map<String, dynamic> toJson(User value) => value.toJson();
}

//Generated converter for `Category`
class _$CategoryJsonConverter
    implements FirestoreConverter<Category, Map<String, dynamic>> {
  const _$CategoryJsonConverter();

  @override
  Category fromJson(Map<String, dynamic> data) => Category.fromJson(data);

  @override
  Map<String, dynamic> toJson(Category value) => value.toJson();
}

//Generated converter for `Product`
class _$ProductJsonConverter
    implements FirestoreConverter<Product, Map<String, dynamic>> {
  const _$ProductJsonConverter();

  @override
  Product fromJson(Map<String, dynamic> data) => Product.fromJson(data);

  @override
  Map<String, dynamic> toJson(Product value) => value.toJson();
}
