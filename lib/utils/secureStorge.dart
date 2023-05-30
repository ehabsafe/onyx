import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Create storage
  final storage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  final String _keyUserId = 'userId';
  final String _keyDeliveryName = 'DeliveryName';

  Future setUserId(String userId) async {
    await storage.write(
        key: _keyUserId, value: userId, aOptions: _getAndroidOptions());
  }

  Future<String?> getUserId() async {
    return await storage.read(key: _keyUserId, aOptions: _getAndroidOptions());
  }

  Future<void> removeUserId() async {
    return await storage.delete(
        key: _keyUserId, aOptions: _getAndroidOptions());
  }



  Future setDeliveryName(String deliveryName) async {
    await storage.write(
        key: _keyDeliveryName,
        value: deliveryName,
        aOptions: _getAndroidOptions());
  }

  Future<String?> getDeliveryName() async {
    return await storage.read(
        key: _keyDeliveryName, aOptions: _getAndroidOptions());
  }

  Future<void> removeDeliveryName() async {
    return await storage.delete(
        key: _keyDeliveryName, aOptions: _getAndroidOptions());
  }
}
