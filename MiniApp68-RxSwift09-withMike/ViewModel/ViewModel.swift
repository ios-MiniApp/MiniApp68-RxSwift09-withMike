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

    var AnswerText: Observable<String>
    let disposeBag = DisposeBag()

    init(numberText1: Observable<String>,
         numberText2: Observable<String>,
         numberText3: Observable<String>,
         outputButton: Observable<Void>){

        //outputButton.subscribe(onNext: { [weak self] in
            AnswerText = Observable
                .combineLatest(numberText1, numberText2, numberText3)
                .map({ text1, text2, text3 -> (String) in
                    let num1 = Int(text1) ?? 0
                    let num2 = Int(text2) ?? 0
                    let num3 = Int(text3) ?? 0
                    let answer = num1 + num2 + num3
                    return String(answer)
                })
//                .subscribe(onNext: { text in
//                    print(text)
//                })
//                .disposed(by: disposeBag)
                //.disposed(by: self?.disposeBag)

       // })
        //.disposed(by: disposeBag)

    }
}
