//
//  ViewModel.swift
//  MiniApp68-RxSwift09-withMike
//
//  Created by 前田航汰 on 2022/07/30.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {

    var AnswerText: Observable<String> = Observable.of("0")
    let disposeBag = DisposeBag()
    private var num1 = ""
    private var  num2 = ""
    private var num3 = ""

    init(numberText1: Observable<String>,
         numberText2: Observable<String>,
         numberText3: Observable<String>,
         outputButton: Observable<Void>){

        Observable
            .combineLatest(numberText1, numberText2, numberText3)
            .subscribe(onNext: { text1, text2, text3 in
                self.num1 = text1
                self.num2 = text2
                self.num3 = text3
            })
            .disposed(by: disposeBag)

//        outputButton.asObservable()
//            .subscribe(onNext: {
//                print("here")
//                self.AnswerText.asObservable()
//                    //.subscribe(onNext: { print($0) })
//                    .map{ _  -> String in
//                        print("ae")
//                        let numInt1 = Int(self.num1) ?? 0
//                        let numInt2 = Int(self.num1) ?? 0
//                        let numInt3 = Int(self.num1) ?? 0
//                        return String(numInt1 + numInt2 + numInt3)
//                    }
//            })
//            .disposed(by: disposeBag)

    }
}
