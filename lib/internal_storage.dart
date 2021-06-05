
abstract class InternalStorageAdapter {
  void saveUser(String name, String surName); 
  Future<String> getFullName();
}