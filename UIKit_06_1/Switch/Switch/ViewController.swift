//
//  ViewController.swift
//  StackView
//
//  Created by 김혜림 on 5/20/24.
//


//실습2: 토글 스위치
import UIKit

class ViewController: UIViewController {
    
    let toggleSwitch = UISwitch()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //스위치 기본 값 설정
        label.text = "Switch is Off"
        label.textAlignment = .center
        
        //value 값이 변경되면 토글스위치에게 switchChanged라는 오브젝트씨 함수를 실행
        toggleSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        
        //뷰 배치 및 정렬
        let stackView = UIStackView(arrangedSubviews: [label, toggleSwitch])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //뷰 위치 설정
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    //스위치 온오프 함수
    @objc func switchChanged(_ sender: UISwitch) {
        if sender.isOn {
            label.text = "Switch is On"
        } else {
            label.text = "Switch is Off"
        }
    }
}

