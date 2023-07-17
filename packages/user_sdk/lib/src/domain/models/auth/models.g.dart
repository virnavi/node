// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppDeviceInfoModel _$AppDeviceInfoModelFromJson(Map<String, dynamic> json) =>
    AppDeviceInfoModel(
      deviceId: json['deviceId'] as String,
      deviceType: json['deviceType'] as String,
      deviceData: json['deviceData'] as String,
      fingerprint: json['fingerprint'] as String,
    );

Map<String, dynamic> _$AppDeviceInfoModelToJson(AppDeviceInfoModel instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'deviceType': instance.deviceType,
      'deviceData': instance.deviceData,
      'fingerprint': instance.fingerprint,
    };

AppAuthModel _$AppAuthModelFromJson(Map<String, dynamic> json) => AppAuthModel(
      token: json['token'] as String? ?? '',
      device:
          AppDeviceInfoModel.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppAuthModelToJson(AppAuthModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'device': instance.device.toJson(),
    };
