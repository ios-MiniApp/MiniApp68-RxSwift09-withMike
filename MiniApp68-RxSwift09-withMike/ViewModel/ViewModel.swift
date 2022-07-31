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

    var AnswerText = PublishSubject<Int>()
    private var num1 = 0
    private var  num2 = 0
    private var num3 = 0

    private let disposeBag = DisposeBag()

    init(numberText1: Observable<String>,
         numberText2: Observable<String>,
         numberText3: Observable<String>,
         outputButton: Observable<Void>){

        Observable
            .combineLatest(numberText1, numberText2, numberText3)
            .subscribe(onNext: { text1, text2, text3 in
                self.num1 = Int(text1) ?? 0
                self.num2 = Int(text2) ?? 0
                self.num3 = Int(text3) ?? 0
            })
            .disposed(by: disposeBag)

        outputButton.asObservable()
            .subscribe(onNext: {
                self.AnswerText.onNext(self.num1 +  self.num2 +  self.num3)
            })
            .disposed(by: disposeBag)

    }
}
