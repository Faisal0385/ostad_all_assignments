import 'package:smart_calculator/model/cash_flow_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "CashFlow.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE CashFlow(id INTEGER PRIMARY KEY AUTOINCREMENT, cash TEXT NOT NULL, status TEXT NOT NULL , date TEXT NOT NULL);"),
        version: _version);
  }

  static Future<int> addCash(CashFlow cashFlow) async {
    final db = await _getDB();
    return await db.insert("CashFlow", cashFlow.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateCash(CashFlow cashFlow) async {
    final db = await _getDB();
    return await db.update("CashFlow", cashFlow.toJson(),
        where: 'id = ?',
        whereArgs: [cashFlow.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteCash(CashFlow cashFlow) async {
    final db = await _getDB();
    return await db.delete(
      "CashFlow",
      where: 'id = ?',
      whereArgs: [cashFlow.id],
    );
  }

  static Future<List<CashFlow>?> getAllCashFlows() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("CashFlow");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => CashFlow.fromJson(maps[index]));
  }
}