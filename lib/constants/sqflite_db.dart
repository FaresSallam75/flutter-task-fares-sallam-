import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDatabase {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDatabase();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> initialDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'fares.db');
    Database myDatabase = await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    return myDatabase;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('onUpgrade =====================================');

    await db.execute(
      '''CREATE TABLE 'items' (id INTEGER PRIMARY KEY AUTOINCREMENT 
      , name TEXT, price REAL, image TEXT)''',
    );
    await db.execute('''
    CREATE TABLE 'bouquet' (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    price REAL,
    int_num INTEGER
  )
''');
    await db.execute('''
  CREATE TABLE 'rooms' (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    number_room INTEGER,
    payment_type TEXT,
    property_condition TEXT,
    categories_id INTEGER,
    FOREIGN KEY (categories_id) REFERENCES categories(id)
  )
''');
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE 'offers' (id INTEGER PRIMARY KEY AUTOINCREMENT 
      , name TEXT)''',
    );
    await db.execute(
      '''CREATE TABLE 'categories' (id INTEGER PRIMARY KEY AUTOINCREMENT 
      , name TEXT, image TEXT)''',
    );
    await db.execute(
      '''CREATE TABLE 'items' (id INTEGER PRIMARY KEY AUTOINCREMENT 
      , name TEXT, price REAL, image TEXT)''',
    );
    await db.execute('''
    CREATE TABLE 'bouquet' (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    price REAL,
    int_num INTEGER
  )
''');
    await db.execute('''
  CREATE TABLE rooms (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    number_room INTEGER,
    payment_type TEXT,
    property_condition TEXT,
    categories_id INTEGER,
    FOREIGN KEY (categories_id) REFERENCES categories(id)
  )
''');

    print('onCreate =====================================');
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
