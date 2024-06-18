//
//  ViewController.swift
//  Spacer
//
//  Created by 김혜림 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //뷰 생성
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let labelLeft = UILabel()
        labelLeft.text = "왼쪽"
        labelLeft.backgroundColor = .lightGray
        
        let labelRight = UILabel()
        labelRight.text = "오른쪽"
        labelRight.backgroundColor = .lightGray
        
        //스페이서 생성
        //스페이서는 재활용 불가능: 스페이서를 2번 사용할 거라면 2개 만들어야 함
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        //뷰 배치
        stackView.addArrangedSubview(labelLeft)
        stackView.addArrangedSubview(spacer)
        stackView.addArrangedSubview(labelRight)
        
        view.addSubview(stackView)
        
        //뷰 배치
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16), //좌측 기준
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16) //우측 기준
        ])
    }


}

