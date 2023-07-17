// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceRegisterResponseModel _$DeviceRegisterResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeviceRegisterResponseModel(
      id: json['id'] as String,
      fingerprint: json['fingerprint'] as String,
    );

Map<String, dynamic> _$DeviceRegisterResponseModelToJson(
        DeviceRegisterResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fingerprint': instance.fingerprint,
    };

DeviceInfoModel _$DeviceInfoModelFromJson(Map<String, dynamic> json) =>
    DeviceInfoModel(
      deviceType: json['deviceType'] as String,
      deviceData: json['deviceData'] as String,
    );

Map<String, dynamic> _$DeviceInfoModelToJson(DeviceInfoModel instance) =>
    <String, dynamic>{
      'deviceType': instance.deviceType,
      'deviceData': instance.deviceData,
    };

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: json['id'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
    };

PhoneNumberModel _$PhoneNumberModelFromJson(Map<String, dynamic> json) =>
    PhoneNumberModel(
      countryId: json['countryId'] as String,
      dialCode: json['dialCode'] as String,
      number: json['number'] as String,
    );

Map<String, dynamic> _$PhoneNumberModelToJson(PhoneNumberModel instance) =>
    <String, dynamic>{
      'countryId': instance.countryId,
      'dialCode': instance.dialCode,
      'number': instance.number,
    };
