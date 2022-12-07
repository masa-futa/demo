class Basic {
  /// 非公開な名前付きコンストラクタ
  Basic._();

  /// ファクトリーメソッド
  factory Basic.from({required String name}) {
    print(name);
    return Basic._();
  }

  /// 変数
  var number = 10;
  String name = 'Jon';

  /// 定数
  final age = 30;
  static const message = 'Hello';

  /// null safety
  int? ages;

  /// 関数（返り値あり + アロー構文）
  int count() => number;

  /// 関数（返り値なし）
  void add() {
    final person = Person(name, age);
    print(person.name);
    print(person.age);
  }

  /// 非同期関数
  Future<String> future() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return "";
  }

  /// アンラップ処理
  void rap(String? name) {
    if (name != null) {
      print(name);
    }
  }
}

/// クラス
class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

/// 拡張
extension PersonExtension on Person {
  void add(String name, int age) {
    print(name);
    print(age);
  }
}

/// Enum
enum Fruit {
  apple,
  banana,
}

/// interface
abstract class Test {
  void add();
}
