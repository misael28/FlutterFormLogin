
abstract class InternalStorageAdapter {
  void saveUser(String name, String surName); 
  Future<String> getFullName();
  Future<String> deleteUser(int id);
}