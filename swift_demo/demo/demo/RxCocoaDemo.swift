//
//  RxCocoaDemo.swift
//  demo
//
//  Created by Masaki Futami on 2022/12/07.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class RxCocoaDemo: UIViewController {
    
    let textField = UITextField()
    let button = UIButton()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.rx.text
            .subscribe({ value in
                print(value)
            })
            .disposed(by: disposeBag)
        button.rx.tap
            .subscribe({ _ in
                print("tapped")
            })
            .disposed(by: disposeBag)
    }
}
