class SchemaDB {
  static var _scripts = [
    // Version 1
    """
    CREATE TABLE IF NOT EXISTS category(
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(150) NOT NULL,
      description VARCHAR(255),
      created_at DATETIME NOT NULL,
      updated_at DATETIME NOT NULL,
      deleted_at DATETIME
    );

    CREATE INDEX IF NOT EXISTS index_id_cat ON category(id);

    CREATE TABLE IF NOT EXISTS product(
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      id_cat INTEGER NOT NULL,
      code VARCHAR(50) NOT NULL,
      name VARCHAR(150) NOT NULL,
      description VARCHAR(255),
      unit VARCHAR(3) NOT NULL,
      created_at DATETIME NOT NULL,
      updated_at DATETIME NOT NULL,
      deleted_at DATETIME,
      FOREIGN KEY(id_cat) REFERENCES category(id) ON UPDATE CASCADE
      ON DELETE CASCADE
    );

    CREATE INDEX IF NOT EXISTS index_id_prod ON product(id);

    CREATE TABLE IF NOT EXISTS shopping_list(
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(150) NOT NULL,
      description VARCHAR(255),
      time_used INTEGER NOT NULL,
      background_img VARCHAR(25),
      created_at DATETIME NOT NULL,
      updated_at DATETIME NOT NULL,
      deleted_at DATETIME,
    );

    CREATE TABLE IF NOT EXISTS product_shopping_list(
      id_shop INTEGER NOT NULL,
      id_product INTEGER NOT NULL,
      amount INTEGER NOT NULL,
      UNIQUE(id_shop, id_product),
      FOREIGN KEY(id_shop) REFERENCES shopping_list(id) ON UPDATE CASCADE
      ON DELETE CASCADE,
      FOREIGN KEY(id_product) REFERENCES product(id) ON UPDATE CASCADE
      ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS logs(
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      message VARCHAR(255) NOT NULL,
      times_repeated INTEGER NOT NULL,
      threw_at DATETIME NOT NULL,
    );
    """,
    // Version 2
  ];

  static int get getCurrentVersion => _scripts.length;

  static String get getCurrentSchema {
    return _scripts.last;
  }

  static String getSchema(int version) {
    if (version > 0) {
      return _scripts[version];
    } else {
      return "";
    }
  }
}
