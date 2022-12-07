//
//  Combine.swift
//  demo
//
//  Created by Masaki Futami on 2022/12/07.
//

import Combine
import Foundation

class Combine {
    // 受信する値を定義
    let publisher = PassthroughSubject<String, Never>()
    let currentValuesPublisher = CurrentValueSubject<Int, Never>(0)
    
    var cancelables = Set<AnyCancellable>()

    init() {
        // 受信する値を処理するために、Subscriberを作成
        publisher
            .sink(
                receiveCompletion: {
                    print("Received completion: \($0)")
                },
                receiveValue: {
                    print("Received value: \($0)")
                }
            )
            .store(in: &cancelables)
        
        currentValuesPublisher
            .sink(
                receiveCompletion: {
                    print("Received completion: \($0)")
                },
                receiveValue: {
                    print("Received value: \($0)")
                }
            )
            .store(in: &cancelables)
        
        anyPublisher()
            .sink(
                receiveCompletion: {
                    print("Received completion: \($0)")
                },
                receiveValue: {
                    print("Received value: \($0)")
                }
            )
            .store(in: &cancelables)
        
        futureAnyPublisher()
            .sink(
                receiveCompletion: {
                    print("Received completion: \($0)")
                },
                receiveValue: {
                    print("Received value: \($0)")
                }
            )
            .store(in: &cancelables)
    }
    
    /// 同期的なPublisher
    func anyPublisher() -> AnyPublisher<String, Never> {
        return Just("Hello").eraseToAnyPublisher()
    }
    
    /// 非同期なPublisher
    func futureAnyPublisher() -> AnyPublisher<Int, Never> {
        return Future<Int, Never> { promise in
            promise(.success(100))
        }
        .eraseToAnyPublisher()
    }
}
