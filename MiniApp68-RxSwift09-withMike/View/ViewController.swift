//
//  ViewController.swift
//  MiniApp68-RxSwift09-withMike
//
//  Created by 前田航汰 on 2022/07/30.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!
    @IBOutlet private weak var number3TextField: UITextField!
    @IBOutlet private weak var resultButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!

    private let disposeBag = DisposeBag()
    private var viewModel: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDindings()
    }

    private func setupDindings() {

        viewModel = ViewModel(
            numberText1: number1TextField.rx.text.orEmpty.asObservable(),
            numberText2: number2TextField.rx.text.orEmpty.asObservable(),
            numberText3: number3TextField.rx.text.orEmpty.asObservable(),
            outputButton: resultButton.rx.tap.asObservable()
        )

        viewModel?.AnswerText
            .subscribe(onNext: { num in
                self.resultLabel.text = String(num)
            })
            .disposed(by: disposeBag)
    }

}

