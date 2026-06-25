import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/game.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _db;

  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Future<Database> get database async {
    _db ??= await _openDb();
    return _db!;
  }

  Future<Database> _openDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'gamestore.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE games (
            id INTEGER PRIMARY KEY,
            title TEXT NOT NULL,
            description TEXT NOT NULL,
            imageUrl TEXT NOT NULL,
            genre TEXT NOT NULL,
            price REAL NOT NULL,
            isFree INTEGER NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> insertGames(List<Game> games) async {
    final db = await database;
    final batch = db.batch();
    batch.delete('games');
    for (final game in games) {
      batch.insert('games', game.toMap());
    }
    await batch.commit(noResult: true);
  }

  Future<List<Game>> getCachedGames() async {
    final db = await database;
    final maps = await db.query('games');
    return maps.map(Game.fromMap).toList();
  }
}
