//
//  ViewController.swift
//  Stepper
//
//  Created by 김혜림 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    let slider = UISlider()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //기본 라벨 설정
        label.text = "값: 0"
        
        //스텝퍼 설정
        slider.minimumValue = 0 //최소값
        slider.maximumValue = 1 //최대값
        slider.value = 0.5 //기본값
        
        //화면 갱신 자동으로
        slider.isContinuous = true
        
        //밸류값이 변경되면 스텝퍼의 라벨 내용 변경, 만약 값이 옵셔널 하면 0 넣기
        slider.addAction(UIAction {[weak self] _ in
            self?.label.text = "값: \(String(format: "%.1f"/*소수점 첫번째 자리까지만 나오게 하기*/, self?.slider.value ?? 0))"
        }, for: .valueChanged)
        
        //뷰 배치 및 정렬
        let stackView = UIStackView(arrangedSubviews: [label, slider])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //뷰 정렬
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

