//
//  RxSwiftDemo.swift
//  demo
//
//  Created by Masaki Futami on 2022/12/07.
//

import RxSwift

class RxSwiftDemo {
    let observable = Observable.from(1...10)
    let subject = PublishSubject<String>()
    let disposeBag = DisposeBag()
    
    init() {
        observable
            .subscribe(
                onNext: { count in
                    print(count)
                },
                onError: { error in
                    print(error)
                }
            )
            .disposed(by: disposeBag)
        
        subject
            .subscribe(
                onNext: { value in
                    print(value)
                },
                onError: { error in
                    print(error)
                }
            )
            .disposed(by: disposeBag)
        
        subject.onNext("Hello")
    }
}
