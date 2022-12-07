//
//  Basic.swift
//  demo
//
//  Created by Masaki Futami on 2022/12/07.
//

import Foundation

class Basic {
    /// 変数の宣言
    var message = "Hello, World!"

    /// 定数の宣言
    let maxValue = 100

    /// 配列
    var numbers = [1, 2, 3, 4, 5]

    /// 辞書型
    var person: [String: Any] = ["name": "John", "age": 30]
    
    /// 関数
    func greet(name: String) -> String {
        // 条件分岐
        if maxValue > 50 {
            print("maxValue is greater than 50")
        } else {
            print("maxValue is less than or equal to 50")
        }
        
        // 例外処理
        do {
            try someFunction()
        } catch let error {
            print(error.localizedDescription)
        }
        
        // 繰り返し
        for num in numbers {
            print(num)
        }
        
        // while文
        var i = 0
        while i < 10 {
            i += 1
        }
        
        // オプショナル型
        let optionalValue: Int? = 10
        // オプショナルアンラップ
        if let optionalValue = optionalValue {
            print(optionalValue)
        } else {
            print("optionalValue is nil")
        }
        
        guard let optionalValue = optionalValue else {
            return ""
        }
        print(optionalValue)

        // タプル
        let coordinates = (x: 10, y: 20)
        print(coordinates.x)
        print(coordinates.y)
        
        // スイッチ
        let fruit = Fruit.apple
        switch fruit {
        case .apple:
            print("This is an apple.")
        case .banana:
            print("This is a banana.")
        }
        
        // 高階関数
        let numbers = [1, 2, 3, 4, 5]
        let doubledNumbers = numbers.map { $0 * 2 }
        let firstNumber = numbers.first
        print(doubledNumbers)
        print(firstNumber!)
        
        // クロージャ
        let greet = { (name: String) -> String in
            return "Hello, \(name)!"
        }
        print(greet("Jane"))
        
        return "Hello, \(name)!"
    }
    
    /// クラス呼び出し
    func persons() {
        let john = Person(name: "John", age: 30)
        print(john.name)
        print(john.age)
    }
    
    func someFunction() throws {
        throw NSError()
    }
}


/// クラス
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

/// Enum
enum Fruit {
    case apple
    case banana
}

/// 構造体
struct Vector2D {
    var x: Int
    var y: Int
}

/// 拡張
extension Vector2D {
    func length() -> Double {
        return sqrt(Double(x * x + y * y))
    }
}
