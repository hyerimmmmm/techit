//
//  ViewController.swift
//  Stepper
//
//  Created by 김혜림 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    let stepper = UIStepper()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //기본 라벨 설정
        label.text = "값: 0"
        
        //스텝퍼 설정
        stepper.minimumValue = 0 //최소값
        stepper.maximumValue = 10 //최대값
        stepper.stepValue = 1 //한번 클릭할 때마다 오르는 값
        stepper.value = 0 //기본값
        
        //밸류값이 변경되면 스텝퍼의 라벨 내용 변경, 만약 값이 옵셔널 하면 0 넣기
        stepper.addAction(UIAction {[weak self] _ in
            self?.label.text = "값: \(self?.stepper.value ?? 0)"
        }, for: .valueChanged)
        
        //뷰 배치 및 정렬
        let stackView = UIStackView(arrangedSubviews: [label, stepper])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //뷰 정렬
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

