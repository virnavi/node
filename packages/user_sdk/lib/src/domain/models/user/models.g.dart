// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccountModel _$UserAccountModelFromJson(Map<String, dynamic> json) =>
    UserAccountModel(
      accountNumber: json['accountNumber'] as String,
      accountType: json['accountType'] as String,
      productType: json['productType'] as String,
    );

Map<String, dynamic> _$UserAccountModelToJson(UserAccountModel instance) =>
    <String, dynamic>{
      'accountNumber': instance.accountNumber,
      'accountType': instance.accountType,
      'productType': instance.productType,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      alias: json['alias'] as String,
      handle: json['handle'] as String,
      image: ImageModel.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'alias': instance.alias,
      'handle': instance.handle,
      'image': instance.image.toJson(),
    };

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      userId: json['userId'] as int,
      fullName: json['fullName'] as String,
      dob: DateTimeUtils.fromJsonOptional(json['dob'] as int?),
      gender: $enumDecodeNullable(_$GenderTypeEnumMap, json['gender']),
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'gender': _$GenderTypeEnumMap[instance.gender],
      'dob': DateTimeUtils.toJsonOptional(instance.dob),
    };

const _$GenderTypeEnumMap = {
  GenderType.male: 'male',
  GenderType.female: 'female',
};
